#coding=utf-8
from django.db import models
from django.http import HttpResponse
from django.template import RequestContext
from django.shortcuts import render_to_response

from django.http import Http404

from models import BlogPost

# Create your views here.
def blog(request, blog_id):
	guidance_list = (
		{'url':'/','title':u'博客'},
		{'url':'http://www.zhihu.com/people/jayson-24','title':u'知乎'},
		{'url':'https://github.com/JaySon-Huang','title':u'GitHub'},
		{'url':'http://www.wooyun.org/whitehats/JaySon','title':u'乌云'},
	)


	if blog_id != None:
		try:
			record = BlogPost.objects.get(id=blog_id)
		except BlogPost.DoesNotExist:
			raise Http404
	else :
		raise Http404

	return render_to_response(
		'blog.html',
		{"guidance_list":guidance_list,
		"blog":record,
		},
		context_instance=RequestContext(request)
	)
