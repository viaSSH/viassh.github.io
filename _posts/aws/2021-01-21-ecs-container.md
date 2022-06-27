---
published: true
layout: single
title: "ECS Fargate"
category: AWS
tags:
  - ECS
comments: true
---

ECS
=============


Docker




- Docker : 컨테이너 가상화 도구
- Dockerfile : 도커의 이미지 생성과정을 정의한 DSL형식으로 작성된 파일
- Cluster : ECS의 가장 기본적인 단위. 서비스나 태스크가 실행되는 공간을 나누는 논리적인 공간
- Container Instance : 클러스에서 속한 인스턴스. 클러스터에 서비스나 태스크 실행을 요청하면 클러스터에 속한 컨테이너 인스턴스 중 하나에서 실행된다.
- ECR : AWS의 Private 도커 레지스트리
