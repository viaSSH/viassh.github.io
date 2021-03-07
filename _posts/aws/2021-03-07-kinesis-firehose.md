---
published: true
layout: single
title: "Kinesis firehose"
category: AWS
tags:
  - kinesis
  - firehose
  - data
comments: true

---

Firehose 사용법 및 설명
=============

AWS IoT core의 MQTT 혹은 http 통신을 통해 전달받은 데이터를 rule로 catch 할 수 있다.

해당 룰을 통해 여러가지 기능으로 데이터를 전달해 줄 수 있는데, 그 중 하나가 kinesis, kinesis firehose 이다.



일단 firehose 부터 사용해보았다.

전체적인 흐름은 iot Core -> kinesis firehose -> elasticSearch 로 흘러간다.



수 많은 센서에서 넘어온 데이터들은 IoT Core의 rule로 한번 필터링이 되고 데이터가 firehose에 쌓이게된다.

최소 60초, 5분과같이 특정 시간 혹은 쌓인 데이터의 양 5MB 와 같이 기준시점이 지나면 elasticSearch 로 전달하여 index에 맡게 차곡차곡 쌓이게된다.

나중에는 쌓인데이터를 kibana로 시각화를 하여 보여줄 것이고, kibana뿐만 아니라 elastic search의 API를 통해 필터, 특정 데이터만 끌고와 사용할 수 있다.



Kinesis 와 Kinesis firehose 의 차이점