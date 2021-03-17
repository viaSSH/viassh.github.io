---
published: true
layout: single
title: "Elastic Search와 Lambda 연동 권한"
category: AWS
tags:
  - Elastic search
  - Lambda
  - Policy
comments: true


---

외부에서의 ES 접근을 제한하기 위해 사용하는 방법이 **Access Policy** 이다.



특정 IP에서만 ES에 접근하여 데이터를 읽고 추가할 수 있도록 하거나, 특정 Lambda에서만 사용가능하게 하여서 제3자가 ES에 접근하지 못하도록 할 수 있다.

이때 Access Policy 를 사용하는데 Lambda는 IP로 accees 를 Allow 할 수 없다.

그래서 람다 함수에서 request 에 auth를 넣어 날려줘야한다. 

Layer에 AWS4Auth를 설치하여   - `pip3 install request-aws4auth -t .`  

레이어에 추가하고 `AWS4Auth` 를 import 하여 credebtial 을 추가해야된다.

```python
from requests_aws4auth import AWS4Auth
# 중중
region = "ap-northeast-2"
service = "es"
ELB_URL = "https://THISISYOURESDOMAIN.ap-northeast-2.es.amazonaws.com/test/_search"
PARAMS = {'q': 'office:*', 'sort':'times:desc', 'size': 60}

credentials = boto3.Session().get_credentials()
awsauth = AWS4Auth(credentials.access_key, credentials.secret_key, region, service, session_token=credentials.token)

# 중략

r = requests.get(url=ELB_URL, auth=awsauth,  params = PARAMS)
data = r.json()
```



```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:sts::12345:assumed-role/get-Reservation-role/Office-get-Office",
          "arn:aws:iam::12345:user/Admin"
        ]
      },
      "Action": "es:*",
      "Resource": "arn:aws:es:ap-northeast-2:12345:domain/my-elastic/*"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "es:*",
      "Resource": "arn:aws:es:ap-northeast-2:12345:domain/my-first-elastic/*",
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": "1.2.3.4"
        }
      }
    }
  ]
}
```





[참조 링크] (https://docs.aws.amazon.com/ko_kr/elasticsearch-service/latest/developerguide/es-request-signing.html)