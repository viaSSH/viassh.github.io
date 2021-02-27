---
published: true
layout: single
title: "Step function"
category: AWS
tags:
  - AWS
  - Stepfunction
comments: true


---

Step Function





Step Function 내부에 람다함수 여러개를 순차적으로 연결해두고 각 람다에서 실행한 결과를 취합을 하여 return 하려고 했다.

API Gateway에서 Step Function을 호출하여 Response를 받으려고했지만, 실패하였다...



원인은 API Gateway는 동기적인 방식이고 또한 Timeout도 갖고있다.

하지만 Step Function은 비동기 방식이고 실행시간또한 무지 길다. 그래서 API gateway에서 Step Function을 실행시키면 

```json
{
   "input": "{}",
   "name": "MyExecution4",
   "stateMachineArn": "arn:aws:states:ap-northeast-2:123123213:stateMachine:MyStateMachine"
}
```

요런걸 body에 담아서 보내면 응답은

```json
{
    "executionArn": "arn:aws:states:ap-northeast-2:123123123:execution:MyStateMachine:MyExecution4",
    "startDate": 1.614321940139E9
}
```

요렇게만 날라왔던 것이다.

결론적으로 API Gateway에서 StepFunction을 호출하여 그 실행시킨 결과를 리턴받기는 어렵다.....

