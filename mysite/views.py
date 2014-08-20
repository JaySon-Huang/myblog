#coding=utf-8
from django.db import models
from django.http import HttpResponse
from django.template import RequestContext
from django.shortcuts import render_to_response

from blog.models import BlogPost


def index(request):
	guidance_list = (
		{'url':'/','title':u'博客'},
		{'url':'http://www.zhihu.com/people/jayson-24','title':u'知乎'},
		{'url':'https://github.com/JaySon-Huang','title':u'GitHub'},
		{'url':'http://www.wooyun.org/whitehats/JaySon','title':u'乌云'},
	)

	blog_list = BlogPost.objects.all()

	for blog in blog_list:
		blog.sum = blog.body[:40]

	return render_to_response(
		'index.html',
		{'guidance_list': guidance_list,
		 'blog_list':blog_list,
		 },
		context_instance=RequestContext(request)
	)
