#!/usr/bin/env python
#encoding=utf-8

from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.post_all, name='post_all'),
    url(r'^(?P<post_id>[0-9]+)$', views.post_detail, name='post_detail'),
    url(r'^cata/(?P<cata_name>.+)/$', views.cata, name='cata'),
    url(r'^tag/(?P<tag_name>.+)/$', views.tag, name='tag'),
    url(r'^search/$', views.search, name='search'),
]
