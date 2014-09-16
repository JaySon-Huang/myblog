#!/usr/bin/python
#encoding:utf-8

from django.conf.urls import patterns, include, url
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.contrib.sitemaps.views import sitemap
from django.contrib.sitemaps import FlatPageSitemap, GenericSitemap

from mysite.views import index
from mysite.views import google_verify,baidu_verify
from mysite.views import web_homework
from blog.views import blog
from blog.models import BlogPost


from django.contrib import admin
admin.autodiscover()

info_dict = {
    'queryset': BlogPost.objects.all(),
    'date_field': 'timestamp',
}

sitemaps = {
    'flatpages': FlatPageSitemap,
    'blog': GenericSitemap(info_dict, priority=0.6),
}

urlpatterns = patterns('',
    # url(r'^$', 'mysite.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^$', index),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^comments/', include('django.contrib.comments.urls')),
    url(r'^blog/$', index),
    url(r'^blog/(\d+)$', blog),

    # FIXME: 实现按照类别、标签查看
    url(r'^cata/(.+)$', index),
    url(r'^tag/(\w+)$', index)
    
)
# 站长认证
urlpatterns += patterns('',
	url(r'^google08a282ae4299a9ec.html$', google_verify),
    url(r'^baidu_verify_khKBt7UZo7.html$', baidu_verify),
)
# sitemap
from mysite.views import sitemap_temp
urlpatterns += patterns('',
	# url(r'^sitemap\.xml$', sitemap, {'sitemaps': sitemaps},
    # name='django.contrib.sitemaps.views.sitemap')
	url(r'^sitemap\.xml$',sitemap_temp),
)
# 14年web程序设计
urlpatterns += patterns('',
    url(r'^web/(\d+)$', web_homework),
)
urlpatterns += staticfiles_urlpatterns()
