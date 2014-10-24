#!/usr/bin/python
#encoding:utf-8

from django.contrib.sitemaps import Sitemap
from models import BlogPost, BlogCatalogue, BlogTag

class BlogPostSitemap(Sitemap):
    changefreq = "daily"
    priority = 0.8

    def items(self):
        return BlogPost.objects.all()

    def lastmod(self, obj):
        return obj.timestamp

    def location(self, obj):
    	return u'/blog/%d/'%(obj.id)

class BlogCatalogueSitemap(Sitemap):
	changefreq = "weekly"
	priority = 0.1

	def items(self):
		return BlogCatalogue.objects.all()

	def location(self, obj):
		return u'/cata/%s/'%(obj.title)

class BlogTagSitemap(Sitemap):
	changefreq = "weekly"
	priority = 0.1

	def items(self):
		return BlogTag.objects.all()

	def location(self, obj):
		return u'/tag/%s/'%(obj.title)

