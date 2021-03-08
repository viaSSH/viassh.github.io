---
published: true
layout: single
title: "IoT Core에서 MQTT와 HTTP의 차이점"
category: AWS
tags:
  - kinesis
  - firehose
  - data
comments: true


---

# AWS IoT Core

> 디바이스 <-> 서버(클라우드) 로 데이터 송수신으로 제어 및 통신할 수 있도록 만들어주는 서비스

## MQTT vs HTTP 

**MQTT 간략소개**

MQTT의 QoS 는 0, 1, 2 가 있다.

Qos(Quality of Service) 는 서비스의 질을 보장해주는 레벨을 의미한다.

유선이 아닌 무선통신상에서 발생할 수 있는 불안정함을 안정적으로 제어하기 위해 QoS가 사용된다.

QOS 0은 한번 전송하고 성공하던말던 다시 보내지 않고 실패한 상태로 끝나는 레벨이다.

1은 최소 한번은 보낸다는 의미이다.

2는 정확히 1번 보낸다는 의미.



한 패킷, 한 데이터에 대해 HTTP와 MQTT로 Device -> IoT Core로 전송해보았다.

-> 

esp was iot

