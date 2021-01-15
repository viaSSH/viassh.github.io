---
published: true
layout: single
title: "Network VPC"
category: AWS
tags:
  - Network
  - VPC
comments: true
---

AWS VPC
=============

## VPC(Virtual Private Cloud)

- AWS VPC can be represented by VPN on Cloud

- AWS VPC is isolated network.

- 0.0.0.0/0  은 모든 Local Adress를 받을 수 있다.



NACL - 네트워크 ACL (Network Access Control List)
-------
- EC2 혹은 외부에서 Brute Force공격이 올 경우에 Lambda규칙과 Guard Duty를 사용하여 공격 차단을 할 수 있다.
- NACL은 하나 이상의 서브넷에서 들어오고 나가는 트래픽을 제어하기 위한 방화벽 역할을 하는 VPC에 대한 보안 계층

- NACL VS Security Group(보안그룹)


| NACL | Security Group |
| --- | --- |
|Traffic Control in front of **subnet** | Traffic Control in front of **Instance**|
|First Check | Second Check|
|Black-list | White-list 기반 |

- NACL에서 먼저 검사를 한 뒤에 인스턴스로 넘어와 보안그룹에 따라 네트워크를 제어한다

  

  

  

  ###### Security Group (보안그룹)

  - 화이트리스트 방식으로 기본적으로 모든 트래픽을 막아두고, 허용할 주소만 Open하는 방식
  - IP와 특정 port를 지정하여 허용

  ###### NACL (네트워크 엑세스 제어 목록)

  - 블랙리스트 방식으로 특정 IP, port 차단 가능

  

VPC의 Auto Scaling EC2 인스턴스를 배포하였는데 비정상적인 HTTP 인바운드 트래픽이 발생할 경우

- 웹 계층 서브넷과 연결된 인바운드 NACL에 거부 규칙을 설정하여 공격 IP차단

- 예시

  TODO

**Traffic flow**
traffic --> NACL | Subnet --> Security Group | Instance



###### 추가적인 방법

1. EC2에서 iptables 방화벽을 구성한다.
   - 특정 IP를 차단할 수 있는 방법이지만 스케일이 커지면 일일히 차단설정을 해줘야하는 번거로움




혼자 궁금한 점

1. 람다에서 VPC는 어떻게 되는거지??
