---
published: true
layout: single
title: "EKS 현재 사용자 또는 역할이 이 EKS cluster에 있는 Kubernetes 객체에 액세스할 수 없습니다"
category: network
tags:
  - AWS
  - EKS
comments: true
author_profile: false
---


## EKSCTL 생성 후 node 정보 확인이 안될때

에러 1

`현재 사용자 또는 역할이 이 EKS cluster에 있는 Kubernetes 객체에 액세스할 수 없습니다.`

=> 생성한 클러스터 내부의 Configmap의 aws-auth에 현재 사용자 또는 역할이 없어 AWS Console에서 확인이 안되는 것이다. 

`kubectl edit cm/aws-auth -n kube-system` 명령어르 입력 후 mapRole과 같은 depth에 아래 mapUsers를 추가

configMap에 aws-auth 가 없을 경우도 있다. 이때는 EKS cluster가 제대로 생성되지 않았을 경우라 Cloudformation에서 나온 에러를 확인 후 다시 `eksctl creater cluster 추가옵션` 을 해줘야한다. 

```yaml

mapUsers: |
     - userarn: arn:aws:iam::123412341234:user/Admin
       username: Admin
       groups:
         - system:masters

```

`bash@viaSSH: ~/Documents/GitHub/argo-sample kubectl get cm/aws-auth -n kube-system -o yaml`
```yaml
apiVersion: v1
data:
  mapRoles: |
    - groups:
      - system:bootstrappers
      - system:nodes
      rolearn: arn:aws:iam::123412341234:role/eksctl-eks-exam-nodegroup-eks-exa-NodeInstanceRole-UCELJUF74CUJ
      username: system:node:{{EC2PrivateDNSName}}
  mapUsers: |
    - userarn: arn:aws:iam::123412341234:user/Admin
      username: Admin
      groups:
        - system:masters
kind: ConfigMap
metadata:
  creationTimestamp: "2022-06-25T09:49:58Z"
  name: aws-auth
  namespace: kube-system
  resourceVersion: "3948"
  uid: d2a0d6dc-72b6-4818-916d-d56151b7f703
```


## EKSCTL create 시 에러핸들링

에러 2

Node Group 생성 시 subnet에 public ip를 연결할 수 없다는 아래와 같은 에러
`AWS::EKS::Nodegroup/ManagedNodeGroup: CREATE_FAILED – "Resource handler returned message: \"[Issue(Code=Ec2SubnetInvalidConfiguration, Message=One or more Amazon EC2 Subnets of [subnet-0609724dd9cda79f0] for node group eks-exam-ng does not automatically assign public IP addresses to instances launched into it. If you want your instances to be assigned a public IP address, then you need to enable auto-assign public IP address for the subnet. See IP addressing in VPC guide: https://docs.aws.amazon.com/vpc/latest/userguide/vpc-ip-addressing.html#subnet-public-ip, ResourceIds=[subnet-0609724dd9cda79f0])] (Service: null, Status Code: 0, Request ID: null)\" (RequestToken: e3b0b552-a971-8251-46cb-bfc386f332b6, HandlerErrorCode: GeneralServiceException)"
`

=> AWS Console에 들어가 cluster.yml 에서 설정하였던 퍼블릿 서브넷들을 확인해봐야한다. 
에러문구에 나온 서브넷을 확인하여 **`퍼블릭 IPv4 주소 자동 할당`** 에 `아니요` 라고 되어있을텐데 이를 예 로 바꿔줘야한다.


