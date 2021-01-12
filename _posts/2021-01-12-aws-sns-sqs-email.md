---
published: true
layout: single
title: "AWS SNS, SQS, EMAIL"
category: post
tags:
  - aws
  - sns
  - sqs
  - email
comments: true
---

What is AWS SNS, SQS?
=============



## Amazon SNS (Simple Notification Service)



Pub, Sub 구조









## Amazon SQS (Simple Queue Service)

- Queue생성 시 메세지 대기열 유형의 차이는?
  1. 표준
     - 최소 1회 전송, 메세지 순서가 유지되지 않음
     - 최선의 정렬
     - 처리량이 많고 
  2. FIFO
     - 선입선출 전송, 메시지 순서가 유지됨
     - 정확히 1회 처리

<img src="/assets/images/aws-sns-sqs-email-type.png" style="zoom:50%" />



### Amazon SQS Architecture

- **분산 메세징 시스템**이란

  - 분산 시스템의 구성 요소

  - 대기열

  - 메시지

    로 구성된다.

### 표준 대기열 (Standard Queues)

- 메세지를 정렬할때 순서를 완벽히 보장하지는 않는다.
  - standard queues provide <span style="color:red">**best-effort**</span> ordering
- 중복성(Redundancy) 과 고가용성(High availability)를 해결하기 위해 ***여러개의 메세지를 여러 서버에 분산하여 복사***해놓는다.
- 그래서 메세지의 순서가 보장되지 않고 📑📦
- 동일한 메세지가 2번 이상 전송될 수 도 있다. 📩📩

- **메세지를 수신하였을때, 동일한 메세지를 삭제한다던가, Lambda함수를 트리거할때 반복된 작업으로 문제가 생기지 않게 설계를 해야한다.**

### 선입선출 FIFO (First In First Out) 대기열

- 표준대기열의 기본적인 기능들을 다 포함하고 있음.
- 순서를 보장
- 하지만 초당 트랙잭션 TPS(Transactions per second)의 제한이 있다.

### 연관 서비스

- Amazon SNS
- AWs Lambda


