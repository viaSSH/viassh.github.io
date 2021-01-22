---
published: true
layout: single
title: "AWS RDS configuration"
category: AWS
tags:
  - AWS
  - RDS
comments: true
---

AWS RDS Configuration
=============





#### 용량 유형

Provisioned(프로비저닝 됨) VS serverless(서버리스)



#### RDS 데이터를 S3로 옮겨 Athena를 사용할때

1. RDS에서 생성된 스냅샷을 선택하여 S3로 내보내기

2. Parquet 포맷으로 변환되어 S3에 담긴다.



#### 데이터베이스 저장타입

- ###### Parquet (파케이)

  - 많은 데이터 처리를 위해 일반적인 Row(행) 기반이 아닌 Column(열) 기반 포맷 처리를 말한다.
  - Column기반으로 데이터를 처리하면 Row기반으로 압축을 했을때에 비해 데이터 압축률이 더 높고, 필요한 열의 데이터만 읽어 처리하는 것이 가능하기 때문에 처리자원을 절약할 수 있다.
  - 이 포맷은 Apache Spark, Hadoop 등의 대용량 데이터 처리에 사용되고 있음





### RDS -> RDS Migration 데이터 이동 (Workbench 사용)

- source DB에서 옮기고자 하는 데이터를 local컴퓨터로 export 는 잘 된다.

  - workbench -> Data Export -> 테이블선택, Dump Structure and Data -> Start Export

- 하지만 target DB에서 해당 `.sql`파일들을 import 하려고하니깐

  `ERROR 1227 (42000) at line 20: Access denied; you need (at least one of) the SUPER, SYSTEM_VARIABLES_ADMIN or SESSION_VARIABLES_ADMIN privilege(s) for this operation` 에러가 나온다...

- 해당 계정에 SUPER 권한이 없어 오류가 발생한다.

  

  해결방법 

  [이 블로그를 참조하였음](https://jung-study.tistory.com/6)

  RDS -> 파라미터그룹 생성 -> `log_bin_trust_function_creators` 1로 변경하여 추가 -> 디비 인스턴스에 해당 파라미터 그룹으로 수정 -> 유의사항. 적용되었는지 잘 확인한다 . (나는 재시작 보류중이라고 뜸...그래서 인스턴스 재부팅하였음)

  [https://ssungkang.tistory.com/entry/MySQL-RDS에서-RDS로-데이터-migration](https://ssungkang.tistory.com/entry/MySQL-RDS%EC%97%90%EC%84%9C-RDS%EB%A1%9C-%EB%8D%B0%EC%9D%B4%ED%84%B0-migration)

- 해결안됨...

  - `SET @@SESSION.SQL_LOG_BIN= 0; `  에서 문제가 발생하는 듯
  -  Sql 파일마다 SET @, SET @@로 시작하는 쿼리들을 다 지워줬더니 됨...

