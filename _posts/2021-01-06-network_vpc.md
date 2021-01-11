---
published: true
layout: single
title: "Network VPC"
category: post
tags:
  - network
  - vpc
comments: true
---

AWS VPC
=============

VPC(Virtual Private Cloud)
------------

AWS VPC can be represented by VPN on Cloud

AWS VPC is isolated network.

0.0.0.0/0  은 모든 Local Adress를 받을 수 있다.



NACL - 네트워크 ACL (Network Access Control List)
-------
EC2 혹은 외부에서 Brute Force공격이 올 경우에 Lambda규칙과 Guard Duty를 사용하여 공격 차단을 할 수 있다.


NACL VS Security Group(보안그룹)


| NACL | Security Group |
| --- | --- |
|Traffic Control in front of **subnet** | Traffic Control in front of **Instance**|
|First Check | Second Check|



**Traffic flow**
traffic --> NACL | Subnet --> Security Group | Instance




혼자 궁금한 점

1. 람다에서 VPC는 어떻게 되는거지??
