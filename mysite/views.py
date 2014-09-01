#coding=utf-8
from django.db import models
from django.http import HttpResponse
from django.template import RequestContext
from django.shortcuts import render_to_response

from blog.models import BlogPost
from profile import profile_list

from markdown import markdown

def index(request, nonce=None):
	global profile_list

	blog_list = BlogPost.objects.all()

	for blog in blog_list:
		blog.body = markdown(unicode(blog.body[:300]))

	return render_to_response(
		'index.html',
		{'profile_list': profile_list,
		 'blog_list':blog_list,
		 },
		context_instance=RequestContext(request)
	)

def google_verify(request):
	return render_to_response(
		'google08a282ae4299a9ec.html',
		{},
		context_instance=RequestContext(request)
	)

def baidu_verify(request):
	return render_to_response(
		'baidu_verify_khKBt7UZo7.html',
		{},
		context_instance=RequestContext(request)
	)

def sitemap_temp(request):
	return render_to_response(
		'sitemap.xml',
		{},
		context_instance=RequestContext(request)
	)
