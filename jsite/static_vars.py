#!/usr/bin/env python
#encoding=utf-8

profile_list = (
    {'url': '/', 'title': u'博客'},
    {
        'url': '/lab',
        'title': 'Lab',
        'drop_downs': (
            {'url': '/lab/grass', 'title': u'机械草丛'},
        )
    },
    {'url': 'http://www.zhihu.com/people/jayson-hwang', 'title': u'知乎'},
    {'url': 'https://github.com/JaySon-Huang', 'title': u'GitHub'},
    {'url': 'http://www.wooyun.org/whitehats/JaySon', 'title': u'乌云'},
)

# SEO 优化
from meta.views import Meta
meta = Meta(
    title=u"JaySon的小黑屋",
    description=u"JaySon的编程笔记, 生活碎碎念",
    keywords=['Information Security', 'JaySon', 'blog', ],
    extra_props={
        'viewport': 'width=device-width, initial-scale=1.0, minimum-scale=1.0'
    },
    extra_custom_props=[
        ('http-equiv', 'Content-Type', 'text/html; charset=UTF-8'),
    ],
    use_og=True,  # for FB
    use_twitter=True,  # for twitter
    use_googleplus=True,  # for google plus
    locale='zh_CN',
)

POST_PER_PAGE = 10
