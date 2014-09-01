#!/usr/bin/python
#encoding:utf-8

from django.contrib.sitemaps import Sitemap
from models import BlogPost

class BlogPost(Sitemap):
    changefreq = "weekly"
    priority = 0.5

    domain_name = 'jaysonhwang.sinaapp.com'

    def items(self):
        return BlogPost.objects.all()

    def lastmod(self, obj):
        return obj.timestamp

    def location(self, obj):
    	return domain_name + '/blog/' + obj.id
