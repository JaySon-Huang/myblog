#!/usr/bin/env python
#encoding=utf-8

from django.contrib.sitemaps import Sitemap
from django.core.urlresolvers import reverse

from blog.models import Post


class BlogPostSitemap(Sitemap):
    changefreq = 'daily'
    priority = 0.8

    def items(self):
        return Post.objects.all()

    def lastmod(self, obj):
        return obj.modified_date

    def location(self, obj):
        return reverse('blog:post_detail', args=[obj.id])
