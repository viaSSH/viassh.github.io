---
published: true
layout: single
title: "AWS SNS, SQS, EMAIL"
category: AWS
tags:
  - aws
  - sns
  - sqs
  - email
comments: true
---

메시징 서비스 분석해보기
=============

> What is AWS SNS, SQS, MQ?
>
> Why we use this?
>
> How can I use?



## Amazon SNS (Simple Notification Service)



Pub, Sub 구조

``` 팬아웃 패턴 ```
- 팬 아웃 패턴이란 하나의 메세지를 넓게 펼처 여러 곳으로 전달한다는 개념이다. Pub, Sub의 구조로 SNS에 메세지를 하나 전송하면 SNS를 구독하고 있는 서비스들이 해당 메세지를 가져가는 것입니다. 

- SQS는 1:1 매핑이라면 SNS는 1:N 매핑인 것이죠. 








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
- 중복성(Redundancy) 과 고가용성(High availability)를 해결하기 위해 ***여러개의 메세지를 여러 서버에 분산하여 복사***  해놓는다.
- 그래서 메세지의 순서가 보장되지 않고 📑📦
- 동일한 메세지가 2번 이상 전송될 수 도 있다. 📩📩

- **메세지를 수신하였을때, 동일한 메세지를 삭제한다던가, Lambda함수를 트리거할때 반복된 작업으로 문제가 생기지 않게 설계 해야한다.**

다음 그림과 같이 테스트로 메세지 전송을 한다.

1 -> 2 -> 3 -> 4 -> 5 순서대로 전송을 한다.

<img src="/assets/images/aws-sns-sqs-email-standard-test.png" style="zoom:50%" />

하지만 메세지 폴링으로 수신을 하면

5 -> 1 ->  3 -> 2 -> 4

<img src="/assets/images/aws-sns-sqs-email-standard-test2.png" style="zoom:50%" />

**송신 : 1 -> 2 -> 3 -> 4 -> 5**

**수신 : 5 -> 1 -> 3 -> 2 -> 4**

로 순서가 뒤죽박죽 섞여서 들어온다.



### 선입선출 FIFO (First In First Out) 대기열

- 표준대기열의 기본적인 기능들을 다 포함하고 있음.

- 순서를 보장

- 하지만 초당 트랙잭션 TPS(Transactions per second)의 제한이 있다.



##### 메시지 그룹 ID

- 동일한 그룹으로 지정하여 메시지를 전송하면 FIFO에 따라 순서가 지켜진다.
- 하지만 다른 그룹일 경우에는 순서가 보장되지 않음

##### 메시지 중복 제거 ID

- 각 메세지는 메시지 중복 제거 ID가 달라야 한다.

테스트 방식

| 순서 | 본문 | 메세지 그룹 ID | 메시지 중복 제거 ID |
| :--- | :--- | :------------: | :-----------------: |
| 1    | 1    |  test-group-1  |       test-1        |
| 2    | 2    |  test-group-1  |       test-2        |
| 3    | 3    |  test-group-1  |       test-3        |
| 4    | 4    |  test-group-1  |       test-4        |
| 5    | 5    |  test-group-1  |       test-5        |

**송신 : 1 -> 2 -> 3 -> 4 -> 5**

**수신 : 1 -> 2 -> 3 -> 4 -> 5**

**순서가 보장됨**을 확인 할 수 있었다.

<img src="/assets/images/aws-sns-sqs-email-fifo-test.png" style="zoom:50%" />



### 연관 서비스

- Amazon SNS
- AWs Lambda



## SQS vs MQ

MQ 는 기존의 온프레미스 환경에서 사용하던 서비스를 마이그레이션 하는 용도로 많이 사용한다고하는데, 차이점에 대해 자세히 알아봐야겠다.

<!-- TODO -->

