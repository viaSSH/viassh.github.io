---
published: true
layout: single
title: "Github Action + ECR + Argocd 연동기"
category: network
tags:
  - AWS
  - EKS
comments: true
author_profile: false
---



기존 배포방식

Source Code -> Github -> Github Action -> Code Pipeline (Code Deploy) - blue/green -> EC2

EKS 도입 후 배포 방식 변화

Source Code -> Github -> Github Action -> ECR -> Kustomization (gitops New Repository) -> Argocd -> EKS



### 시작하기

사전조건. EKS에 Argocd 가 설치되어있어야함.

1. Front 코드 준비 (React 사용)
   - `npx create-react-app front-sample-eks`  - 샘플 앱 생성
   
2. Dockerfile 생성
   
3. Github Action 설정
   - 최상위 경로에 `.github/workflows` 에 yaml 파일 생성
     - `frontend-cicd.yaml`
```yaml
name: Frontend CI / CD

on:
  push:
    branches:
      - "master"

env:
  AWS_REGION: ap-northeast-2                   # set this to your preferred AWS region, e.g. us-west-1
  ECR_REPOSITORY: "cicd-front"           # set this to your Amazon ECR repository name
  # CONTAINER_NAME: MY_CONTAINER_NAME           # set this to the name of the container in the
                                               # containerDefinitions section of your task definition
  
# permissions:
#   contents: read

jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    environment: production

    steps:
    - name: Checkout
      uses: actions/checkout@v3

    - name: Configure AWS credentials
      uses: aws-actions/configure-aws-credentials@v1
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: ${{ env.AWS_REGION }}

    - name: Login to Amazon ECR
      id: login-ecr
      uses: aws-actions/amazon-ecr-login@v1

    # - name: echo
    #   run: echo "${{ steps.login-ecr.outputs.registry }}"

    - name: Docker Build and ECR Push
      id: docker_build
      uses: docker/build-push-action@v2
      with:
        context: .
        file: ./Dockerfile
        platforms: linux/amd64
        push: true
        tags: ${{ steps.login-ecr.outputs.registry }}/${{ env.ECR_REPOSITORY }}:${{ github.sha }}


    - name: Get verion
      id: image
      run: |
        VERSION=$(echo ${{ github.sha }} | cut -c1-8)
        echo VERSION=$VERSION
        echo "::set-output name=version::$VERSION"

    # kustomize 명령을 가져온다.
    - name: Setup Kustomize
      uses: imranismail/setup-kustomize@v1

    - name: Checkout kustomize repository
      uses: actions/checkout@v2
      with:
        # kubernetes 설정정보 저장소
        repository: viaSSH/cicd-gitops-eks
        ref: frontend
        # 다른 저장소에 push 하려면 Personal Access Token이 필요.
        token: ${{ secrets.ACTION_TOKEN }}
        path: cicd-gitops-eks
    # 새 이미지 버전으로 파일 수정
    - name: Update Kubernetes resources
      run: |
        pwd
        cd cicd-gitops-eks/overlays/prd/
        echo \${{ steps.login-ecr.outputs.registry }}/\${{ env.ECR_REPOSITORY }}
        echo \${{ steps.login-ecr.outputs.registry }}/\${{ env.ECR_REPOSITORY }}:\${{ github.sha }}
        kustomize edit set image \${{ steps.login-ecr.outputs.registry }}/\${{ env.ECR_REPOSITORY }}=\${{ steps.login-ecr.outputs.registry }}/\${{ env.ECR_REPOSITORY }}:\${{ github.sha }}
        cat kustomization.yaml

    # 수정된 파일 commit & push
    - name: Commit minifest files
      run: |
        cd cicd-gitops-eks
        git config --global user.email "hanseung0609@github.com"
        git config --global user.name "viassh"
        git commit -am "Update image tag"
        git push -u origin frontend

    # - name: Build, tag, and push image to Amazon ECR
    #   id: build-image
    #   env:
    #     ECR_REGISTRY: ${{ steps.login-ecr.outputs.registry }}
    #     IMAGE_TAG: ${{ github.sha }}
    #     CI: false
    #   run: |
    #     # Build a docker container and
    #     # push it to ECR so that it can
    #     # be deployed to ECS.
    #     docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG .
    #     docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG
    #     echo "::set-output name=image::$ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG"

    # - name: Fill in the new image ID in the Amazon ECS task definition
    #   id: task-def
    #   uses: aws-actions/amazon-ecs-render-task-definition@v1
    #   with:
    #     task-definition: ${{ env.ECS_TASK_DEFINITION }}
    #     container-name: ${{ env.CONTAINER_NAME }}
    #     image: ${{ steps.build-image.outputs.image }}

    # - name: Deploy Amazon ECS task definition
    #   uses: aws-actions/amazon-ecs-deploy-task-definition@v1
    #   with:
    #     task-definition: ${{ steps.task-def.outputs.task-definition }}
    #     service: ${{ env.ECS_SERVICE }}
    #     cluster: ${{ env.ECS_CLUSTER }}
    #     wait-for-service-stability: true


```


4. ECR 생성
5. Argocd에서 읽어갈 Github repo 생성
   - kustomize 파일 세팅
   - Github Access tokens 발급받기
6. ArgoCD에서 5번 항목의 Github 세팅
7. 배포 테스트


### 에러핸들링

`Error: buildx failed with: error: EOF`

- docker/build-push-action@v2 사용 중 에러 발생

- 이게 무슨 에러인지 몰라 변수 이것저것 다 바꿔보고 삽질을 했지만 결국엔 ecr repo가 없어 image push를 못한것.. 아니 ecr에 레포 만들었는데 왜 에러가 떳지? 

ecr을 많이 안써봐서 당연히 public으로 만들었지만 
123412341234.dkr.ecr.ap-northeast-2.amazonaws.com/cicd-front
는 private ecr 이다...
=> ECR에서 Private repo를 만들어서 재 실행 하니 성공.. public repo로 `build-push-action` 하는 방법은 없던것인가?..