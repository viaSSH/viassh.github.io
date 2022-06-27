---
published: false
layout: single
title: "Kibana 두 라인 그리기"
category: Kibana
tags:
  - ELK
  - Kibana
comments: true



---

Kibana 라인 차트 그리기

데이터를 필터링한 두 결과가 있다.

이 두 라인데이터를 한번에 보고싶을때, Buckets 에서 Split series 를 사용하자.

예를 들어 여러 장소에서의 시간 별 온도변화를 확인하고 싶을때, 

Y-axis는 평균온도

X-axis는 시간 값

Split series 는 Sub aggregation -> Terms 를 선택하여 Field를 원하는 것으로 선택하면 여러 차트가 한 곳에 보인다!.

