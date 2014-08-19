#coding=utf-8
from django.db import models
from django.http import HttpResponse
from django.template import RequestContext
from django.shortcuts import render_to_response

# Create your views here.
def blog(request, blog_id):
	guidance_list = (
		{'url':'/','title':u'博客'},
		{'url':'http://www.zhihu.com/people/jayson-24','title':u'知乎'},
		{'url':'https://github.com/JaySon-Huang','title':u'GitHub'},
	)
	print 'get blog:',blog_id
	if blog_id != None:
		print blog_id,'is num.'
		_blog = {"body":'''*hello world*  
		====  
		''',
		"timestamp":"2012-01-01",
		"title":"just for test"}
		# blog['body'] = markdown(blog['body'])

	return render_to_response(
		'blog.html',
		{"guidance_list":guidance_list,
		"blog":_blog,
		},
		context_instance=RequestContext(request)
	)
