---
permalink: /about/
title: "About"
excerpt: "Minimal Mistakes is a flexible two-column Jekyll theme."
layouts_gallery:
  - url: /assets/images/mm-layout-splash.png
    image_path: /assets/images/mm-layout-splash.png
    alt: "splash layout example"
  - url: /assets/images/mm-layout-single-meta.png
    image_path: /assets/images/mm-layout-single-meta.png
    alt: "single layout with comments and related posts"
  - url: /assets/images/mm-layout-archive.png
    image_path: /assets/images/mm-layout-archive.png
    alt: "archive layout example"
last_modified_at: 2020-10-28T14:51:23-04:00
toc: true
---

<link rel="stylesheet" href="/assets/css/timesheet.css">
<script src="/assets/js/timesheet.min.js"></script>


Minimal Mistakes is a flexible two-column Jekyll theme. Perfect for hosting your personal site, blog, or portfolio on GitHub or self-hosting on your own server. As the name implies --- styling is purposely minimalistic to be enhanced and customized by you :smile:.

{% include gallery id="layouts_gallery" caption="Examples of included layouts `splash`, `single`, and `archive`." %}

[Show CV]({{ "/docs/quick-start-guide/" | relative_url }}){: .btn .btn--success .btn--large}


<div id="timesheet" class="" >

</div>

## Notable Features

- Bundled as a "theme gem" for easier install/upgrading.
- Compatible with GitHub Pages.
- Support for Jekyll's built-in Sass/SCSS preprocessor.
- Nine different skins (color variations).
- Several responsive layout options (single, archive index, search, splash, and paginated home page).
- Optimized for search engines with support for [Twitter Cards](https://dev.twitter.com/cards/overview) and [Open Graph](http://ogp.me/) data
- Optional [header images](https://mmistakes.github.io/minimal-mistakes/docs/layouts/#headers), [custom sidebars](https://mmistakes.github.io/minimal-mistakes/docs/layouts/#sidebars), [table of contents](https://mmistakes.github.io/minimal-mistakes/docs/helpers/#table-of-contents), [galleries](https://mmistakes.github.io/minimal-mistakes/docs/helpers/#gallery), related posts, [breadcrumb links](https://mmistakes.github.io/minimal-mistakes/docs/configuration/#breadcrumb-navigation-beta), [navigation lists](https://mmistakes.github.io/minimal-mistakes/docs/helpers/#navigation-list), and more.
- Commenting support (powered by [Disqus](https://disqus.com/), [Facebook](https://developers.facebook.com/docs/plugins/comments), [Discourse](https://www.discourse.org/), [utterances](https://utteranc.es/), static-based via [Staticman v1 and v2](https://staticman.net/), and custom).
- [Google Analytics](https://www.google.com/analytics/) support.
- UI localized text in English (default), Brazilian Portuguese (Português brasileiro), Catalan, Chinese, Danish, Dutch, Finnish, French (Français), German (Deutsch), Greek, Hindi (हिंदी), Hungarian, Indonesian, Irish (Gaeilge), Italian (Italiano), Japanese, Korean, Malayalam, Myanmar (Burmese), Nepali (Nepalese), Norwegian (Norsk), Persian (فارسی), Polish, Punjabi (ਪੰਜਾਬੀ), Romanian, Russian, Slovak, Spanish (Español), Swedish, Thai, Turkish (Türkçe), and Vietnamese.

## Demo Pages

| Name                                        | Description                                           |
| ------------------------------------------- | ----------------------------------------------------- |
| [Post with Header Image][header-image-post] | A post with a large header image. |
| [HTML Tags and Formatting Post][html-tags-post] | A variety of common markup showing how the theme styles them. |
| [Syntax Highlighting Post][syntax-post] | Post displaying highlighted code. |
| [Post with a Gallery][gallery-post] | A post showing several images wrapped in `<figure>` elements. |
| [Sample Collection Page][sample-collection] | Single page from a collection. |
| [Categories Archive][categories-archive] | Posts grouped by category. |
| [Tags Archive][tags-archive] | Posts grouped by tag. |

For even more demo pages check the [posts archive][year-archive].


---

## Credits

### Icons + Demo Images:

- [The Noun Project](https://thenounproject.com) -- Garrett Knoll, Arthur Shlain, and [tracy tam](https://thenounproject.com/tracytam)
- [Font Awesome](http://fontawesome.io/)
- [Unsplash](https://unsplash.com/)

### Other:

- [Jekyll](https://jekyllrb.com/)
- [jQuery](https://jquery.com/)
- [Susy](http://susy.oddbird.net/)
- [Breakpoint](http://breakpoint-sass.com/)
- [Magnific Popup](http://dimsemenov.com/plugins/magnific-popup/)
- [FitVids.JS](http://fitvidsjs.com/)
- Greedy Navigation - [lukejacksonn](https://codepen.io/lukejacksonn/pen/PwmwWV)
- [jQuery Smooth Scroll](https://github.com/kswedberg/jquery-smooth-scroll)
- [Lunr](http://lunrjs.com)

---

Minimal Mistakes is designed, developed, and maintained by Michael Rose. Just another boring, tattooed, designer from Buffalo New York.

<script>
function ccc(){
  alert("asd");
}

new Timesheet('timesheet', 2010, 2021, [
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
    ]);
</script>
