#!/usr/bin/python
#encoding:utf-8

from django.conf.urls import patterns, include, url
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

from mysite.views import index,catalogue
from mysite.views import google_verify,baidu_verify,baidu_verify2
from mysite.views import web_homework
from blog.views import blog
from blog.models import BlogPost


from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # url(r'^$', 'mysite.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^$', index),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^comments/', include('django.contrib.comments.urls')),
    url(r'^blog/$', index),
    url(r'^blog/(\d+)$', blog),

    # FIXME: 实现按照类别、标签查看
    url(r'^cata/(.+)$', catalogue),
    url(r'^tag/(\w+)$', index)
    
)

# 站长认证
urlpatterns += patterns('',
	url(r'^google08a282ae4299a9ec.html$', google_verify),
    url(r'^baidu_verify_khKBt7UZo7.html$', baidu_verify),
    url(r'^baidu_verify_QnWi0gN0st.html$', baidu_verify2)
)

# sitemap
from blog.sitemaps import BlogPostSitemap, BlogCatalogueSitemap, BlogTagSitemap
sitemaps = {
    'blog': BlogPostSitemap,
    'catalogue': BlogCatalogueSitemap,
    'tag': BlogTagSitemap,
}
urlpatterns += patterns('',
    url(r'^sitemap\.xml$', 'django.contrib.sitemaps.views.index',
         {'sitemaps': sitemaps},),
	url(r'^sitemap-(?P<section>.+)\.xml$', 'django.contrib.sitemaps.views.sitemap',
         {'sitemaps': sitemaps},),
)

# feed
from blog.feeds import BlogPostFeed
urlpatterns += patterns('',
    url(r'^feed/$', BlogPostFeed())
)

# 14年Web程序设计课堂练习
urlpatterns += patterns('',
    url(r'^web/(\d+)$', web_homework),
)
urlpatterns += staticfiles_urlpatterns()
