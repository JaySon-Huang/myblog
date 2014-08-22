# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

from mysite.views import index,google_verify,baidu_verify
from blog.views import blog

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
)
# 站长认证
urlpatterns += patterns('',
	url(r'^google08a282ae4299a9ec.html$', google_verify),
    url(r'^baidu_verify_khKBt7UZo7.html$', baidu_verify),
)
urlpatterns += staticfiles_urlpatterns()
