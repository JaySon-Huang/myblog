#!/usr/bin/env python
#encoding=utf-8

from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^grass/$', views.grass, name='grass'),
]
