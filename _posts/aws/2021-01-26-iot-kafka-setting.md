---
published: true
layout: single
title: "Kafka"
category: AWS
tags:
  - AWS
  - Kafka
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
