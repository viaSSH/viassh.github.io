---
published: true
layout: single
title: "AWS Lambda function url 활용 가이드"
category: AWS
tags:
  - aws
  - lambda
  - python
comments: true
author_profile: false

---
Function URL 설명
=============


Function URL 을 안전하게 사용하기 위한 3가지 방법

1. AWS_IAM
   > 인증된 IAM 사용자 및 역할만 함수 URL에 요청할 수 있습니다.
  - 1. IAM 에서 특정 사용자에 아래 정책과 같이 `InvokeFunctionUrl` action을 부여하여 함수를 호출할 수 있도록 함.
  - 2. 해당 사용자의 Access Key, Secret Key를 발급받아 프로그래밍 방식으로 바로 사용하는 방식 (Policy Condition 세부 조건을 걸고 키가 외부로 노출되지 않도록 어플리케이션에서 관리를 해줘야함.)
  ```json
      {
          "Version": "2012-10-17",
          "Statement": [
              {
                  "Sid": "LambdaFunctionURLAllow",
                  "Effect": "Allow",
                  "Action": "lambda:InvokeFunctionUrl",
                  "Resource": "arn:aws:lambda:*:123456789012:function:*",
                  "Condition": {
                      "StringEquals": {
                          "lambda:FunctionUrlAuthType": "AWS_IAM"
                      }
                  }
              }
          ]
      }
  ```
  - Session Token 사용
2. CORS
   - API를 호출하는 위치나 헤더값, 메서드 종류에 따라 일부 허용할 수 있는 기능
3. JWT
   - 헤더값에 토큰을 넣어보내고 어플리케이션 내에서 로직을 구현해 인증을 허용하고 차단할 수 있도록 함


### Lambda Function URL postman 테스트
> IAM 인증 설정 시

403 forbidden
{
    "message": "Credential should be scoped to correct service: 'lambda'. "
}

postman으로 테스트 시 이러한 에러가 나왔었다.
Credential should be scoped to correct service: 'lambda'.




### AWS Function URL 기능을 언제쓸까?
1. 프로토타이핑
   - API Gateway를 붙이지 않고 간단히 Lambda를 호출하여 테스트할때 사용하기 편하다.
2. 간단한 웹훅을 받아서 처리할때
   - Slack Webhook, Github Webhook, GitLab Webhook 등 다양한 웹훅의 대상으로 Lambda Function url을 지정해 이벤트를 받아 처리할때 사용할 수 있다.

### API Gateway vs Lambda Function url

| | **Lambda Function URL** | **API Gateway** |
| ------ | ------ | ----- |
| **Resource** | Lambda | API Gateway + Lambda |
| **API Type** | HTTP | HTTP, REST, Websocket |
| **Auth** | IAM | API Key, IAM, Cognito |
| **Domain** | No | Yes |
| **Caching** | No | Yes |
| **Cors** | Yes | Yes |
| **Response Timeout** | 15 minutes | 29 Seconds |
| **Price** | Only Lambda | Lambda + API GW |
| **사용예시** | 웹훅의 타겟 URL  | WebSockets 사용사례,  캐슁이 필요한 사례 |


Lambda Function URL 기능을 사용해본 결과 우선 매우 간단하게 함수를 외부로 열어 테스트를 할 수 있었다.

**AWS Lambda Function URL**

Slack, Github 등등 외부의 웹훅을 받을 때 Lambda Function URL을 쓰면 간단하게 요청을 받아 처리할 수 있다. 람다함수의 제한이 15분인것을 활용해 Long polling 요청을 수행하거나 단일 기능 마이크로 서비스에서도 각 함수를 분리하여 테스트해볼때 사용하면 좋을 것 같다.

**Amazon API Gateway**

Amazon API Gateway는 API Gateway Usage Plans를 사용하여 제한 사용량을 추적해야 하는 애플리케이션, WebSocket을 사용한 실시간 애플리케이션, API 응답 시간이 29초 이내인 경우, AWS Cognito, Throttling, Cacheing, Service Proxy를 사용하여 다른 AWS 서비스에 대한 고급 인증을 받아야 하는 경우와 같은 고급 사용 사례에 적합하다.


괜찮은 블로그
https://engineering.teknasyon.com/fine-details-of-aws-lambda-function-url-feature-f3b65b894c5f
