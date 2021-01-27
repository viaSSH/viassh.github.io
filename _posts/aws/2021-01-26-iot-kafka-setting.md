---
published: true
layout: single
title: "IoT Kafka"
category: AWS
tags:
  - AWS
  - Kafka
  - IoT
comments: true
---

IoT Rule Kafka
=============

when ssl configuration

I met `The given ARN is not vended by IAM` error...

I wrote `${get_secret('freeMyKey', 'SecretString', 'hey', 'arn:aws:secretsmanager:ap-northeast-2:000000000000:secret:freeMyKey-epz67f')}`


ACM Setting
->
`
{
  "Version" : "2012-10-17",
  "Statement" : [ {
    "Effect" : "Allow",
    "Principal" : {
      "AWS" : "arn:aws:iam::000000000000:user/Admin"
    },
    "Action" : "secretsmanager:GetSecretValue",
    "Resource" : "*"
  } ]
}
`
up... You don't need to do it.


just

write Correctly

`
${get_secret('arn:aws:secretsmanager:ap-northeast-2:123456789012:secret:freeMyKey-epz67f', 'SecretString', 'mymymykey', 'arn:aws:iam::123456789012:role/secretFullAccess')}
`

But second error occurred ....
`
EVENT:ExternFunctionException TOPICNAME:iot/log CLIENTID:arn:aws:iot:ap-northeast-2:123456789012:cert/cc4e77cf5e2163343a005e15dac298ef7154912131ab837d11b4fca2fa8f20c9 MESSAGE:Function 'GetSecret' failed to execute for rule 'sensorLog'. User: arn:aws:sts::918843473817:assumed-role/iotgoldeneyeruntimeservice-ap-northea-InstanceRole-1LJP9ZC7LBYSG/i-02aa8d4201046f238 is not authorized to perform: sts:AssumeRole on resource: arn:aws:iam::123456789012:role/secretFullAccess (Service: AWSSecurityTokenService; Status Code: 403; Error Code: AccessDenied; Request ID: f69fdb43-78fb-4b3d-afac-99609e296283; Proxy: null)`

`iotgoldeneyeruntimeservice` error
`AWSSecurityTokenService`
