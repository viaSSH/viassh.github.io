---
published: true
layout: single
title: "Amazon Athena"
category: AWS
tags:
  - AWS
  - Athena
  - Data
comments: true
---

Amazon Athena란
=============



## 특징

- 서버리스라 관리할 필요가 없음



What is it??



CloudTrail 로그를 Athena로 옮겨서 쿼리해보기

1. CloudTrail -> 이벤트 기록 -> Athena 테이블 생성
2. S3에 `cloudtrail-log > AWSLogs > 336401010101 > CloudTrail > ap-northeast-2 > 2021 > 01 > 21` 과 같은 디렉터리 구조에 로그가 쌓임

기본적인 쿼리

**전체조회하기**

```sql
SELECT * FROM "default"."cloudtrail_logs_aws_cloudtrail_logs_336481557929_a5bac61f" 
where awsregion = 'ap-northeast-2'
limit 10;
```

Results

|      | eventversion | useridentity | eventtime            | eventsource            | eventname      | awsregion      | sourceipaddress | useragent | errorcode | errormessage | requestparameters | responseelements | additionaleventdata | requestid | eventid | resources | eventtype  | apiversion | readonly | recipientaccountid | serviceeventdetails | sharedeventid | vpcendpointid |
| :--- | :----------- | :----------- | :------------------- | :--------------------- | :------------- | :------------- | :-------------- | :-------- | :-------- | :----------- | :---------------- | :--------------- | :------------------ | :-------- | :------ | :-------- | :--------- | :--------- | :------- | :----------------- | :------------------ | :------------ | :------------ |
| 1    | 1.08         | {생략}       | 2021-01-01T00:24:10Z | dynamodb.amazonaws.com | DescribeStream | ap-northeast-2 | {생략}          | {생략}    |           |              | {생략}            | null             |                     | {생략}    | {생략}  |           | AwsApiCall | 2012-08-10 | true     | {생략}             |                     |               |               |

**RDS데이터 -> S3 로 옮기기**

- RDS의 스냅샷을 S3로 내보내기
  - KMS가 필요
  - S3어디에 만들건지