#!/usr/bin/python
#encoding:utf-8

from django.contrib.syndication.views import Feed
from django.core.urlresolvers import reverse

from models import BlogPost

class BlogPostFeed(Feed):
    title = "JaySon的小黑屋"
    link = "/blog/"
    description = "最新日志"

    def items(self):
        return BlogPost.objects.order_by('-timestamp')[:5]

    def item_title(self, item):
    	return item.title

    def item_description(self, item):
    	return item.body[:200]

    def item_link(self, item):
    	return '/blog/%d/'%(item.id)
    	# return reverse('blog.views.blog' ,args=(item.id,))

    def item_pubdate(self, item):
    	return item.timestamp
