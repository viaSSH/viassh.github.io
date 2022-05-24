---
permalink: /about/
title: "About Me"
classes: wide
excerpt: "이거는 어디에 출력이 되는걸까"
layouts_gallery:
  - url: /assets/images/test-img-1.png
    image_path: /assets/images/test-img-1.png
    alt: "splash layout example"
  - url: /assets/images/about-project-solarzon-1.png
    image_path: /assets/images/about-project-solarzon-1.png
    alt: "single layout with comments and related posts"
  - url: /assets/images/about-project-autocar-1.png
    image_path: /assets/images/about-project-autocar-1.png
    alt: "archive layout example"
last_modified_at: 2021-01-12T14:51:23-04:00

---
<!-- toc: true -->
<link rel="stylesheet" href="/assets/css/timesheet.css">
<script src="/assets/js/timesheet.min.js"></script>

> Frontend, Backend, AWS, IaC, Kubernetes

Developer
<!-- 
{% include gallery id="layouts_gallery" caption="Examples of included layouts `splash`, `single`, and `archive`." %} -->

[Show CV]({{ "/docs/quick-start-guide/" | relative_url }}){: .btn .btn--success .btn--large}


<div id="timesheet" class="" >

</div>

## Notable Features

- Solution Architect

## Demo Pages

| Name                                        | Description                                           |
| ------------------------------------------- | ----------------------------------------------------- |
| Locust 부하테스트 연동  | https://github.com/viaSSH/Locust_to_Cloudwatch |
| EC2 자동화 | https://github.com/viaSSH/EC2-Save-bot |


---


<script>
function ccc(){
  alert("asd");
}

new Timesheet('timesheet', 2010, 2022, [
['03/2010', '02/2013', '**외국어고등학교 중국어과', 'lorem'],
['03/2013', '06/2014', '**대학교 컴퓨터공학과', 'ipsum'],
['06/2014', '03/2016', '군복무 의경', 'dolor'],
['04/2016', '02/2018', '*** 연구원', 'default', 1],
['03/2018', '06/2020', '** 컴퓨터공학과', 'ipsum', 1],
['11/2018', '12/2018', '교내 SW 경진대회 우수상', 'lorem', 1],
['12/2018', '02/2019', '*** 연구원', 'default', 1],
['09/2019', '06/2020', '*** 개발자', 'default', 1],
['06/2019', '06/2020', '교내 캡스톤 경진대회 최우수상 (자율주행 인공지능부문)', 'lorem', 1],
['07/2020', '12/2020', '** SW 아카데미 SSAFY (임베디드) ', 'ipsum', 1],
['12/2020', '04/2022', '** Solution Architect Engineer', 'default', 1]
    ]);

</script>

<!-- new Timesheet('timesheet', 2010, 2021, [
['03/2010', '02/2013', '인천외국어고등학교 중국어과', 'lorem'],
['03/2013', '06/2014', '한동대학교 컴퓨터공학과', 'ipsum'],
['06/2014', '03/2016', '군복무 의경', 'dolor'],
['04/2016', '02/2018', '인더코어비즈니스플랫폼 연구원', 'default', 1],
['03/2018', '06/2020', '한동대학교 컴퓨터공학과', 'ipsum', 1],
['11/2018', '12/2018', '교내 SW 경진대회 우수상', 'lorem', 1],
['12/2018', '02/2019', '인더코어비즈니스플랫폼 연구원', 'default', 1],
['09/2019', '06/2020', '한국금융솔루션 개발자', 'default', 1],
['06/2019', '06/2020', '교내 캡스톤 경진대회 최우수상 (자율주행 인공지능부문)', 'lorem', 1],
['07/2020', '12/2020', '삼성 청년 SW 아카데미 SSAFY (임베디드) ', 'ipsum', 1],
['12/2020', '12/2021', 'GS네오텍 Solution Architect Engineer', 'default', 1]
    ]); -->
