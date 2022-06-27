---
published: true
layout: single
title: "AWS Elastic Load Balancer"
category: AWS
tags:
  - ALB
comments: true
---

ELB (Elastic Load Balancer)
=============

> **로드밸런싱**은 하나의 서버에 집중된 요청을 분산시켜 이를 처리하기 위한 부하를 줄이고 인프라 전반적인 자원을 효율적으로 사용할 수 있도록 지원하는 기술이다.
>
> 하나의 서버에 있어 한정된 물리 자원을 활용해야 하는 가상화 기술의 특성을 고려할 때, 로드밸런싱은 가상화 기술의 효과를 극대화 할 수 있는 주요 요소 중 하나다.

로드 밸런싱 -> 로드밸런서

ELB 는 3가지 유형의 로드밸런서를 지원한다.

1. ALB (Application)
   - 이게 뭘까?... 
     - 로드 밸런서는 클라이언트에 대해 단일 접점 역할을 수행
     -  여러 가용 영역에서 EC2같은 인스턴스에 어플리케이션 트래픽 분산
   - NLB랑 무슨차이가 있을까?
   - 대표적인 사례가 뭐가있을까?
2. NLB (Network)
3. CLB (Classic)



## WHY? ELB를 왜 쓸까?

1. 트래픽을 분산하여 안정적인 서버를 운영할 수 있게
2. 분산처리를 위하여



## HOW? ELB를 어떻게 쓸까?

1. 스케일 **업** 방식
   - 성능을 업그레이드
2. 스케일 **아웃** 방식
   - 서버를 추가하는 것



## WHEN? ELB를 언제쓰면 될까?

1. 서비스 초기에는 1대의 서버로 감당가능하지만 트래픽의 증가로 CPU나 메모리의 급격한 증가로 서버가 down되는 경우가 발생할때



## WHAT? 로드밸런싱이란 무엇인가?

- 로드밸런싱 알고리즘의 종류
  1. 라운드로빈
  2. 가중 라운드 로빈
  3. IP해쉬
  4. 최소연결방식
  5. 최소 리스폰 타임 방식



- 로드밸런서의 종류

  [OSI 7계층이란](https://ko.wikipedia.org/wiki/OSI_%EB%AA%A8%ED%98%95)

  1. L4 (Layer 4 - 네트워크 계층)
     - IP address 와 PORT 를 기반으로 로드밸런싱을 한다. 
  2. L7 (Layer 7 - 애플리케이션 계층)


- L2 
  - 패킷의 MAC 주소에 따라 스위칭
- L3
  - `IP 주소`를 보고 스위칭 (라우터)
- L4
  - `IP 주소 + 포트번호` 에 따라 스위칭
- L7
  - `IP 주소 + 포트번호 + 패킷내용` 에 따라 스위칭
  - 확인해야할 내용이 많아서 L4 보다 느림


참고하고 있는 자료

- [대용량 세션을 위한 로드밸런서](https://d2.naver.com/helloworld/605418)

https://m.post.naver.com/viewer/postView.nhn?volumeNo=27046347&memberNo=2521903