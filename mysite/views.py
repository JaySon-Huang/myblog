#coding=utf-8
from django.db import models
from django.http import HttpResponse
from django.template import RequestContext
from django.shortcuts import render_to_response

from blog.models import BlogPost
from profile import profile_list

def index(request):
	global profile_list

	blog_list = BlogPost.objects.all()

	return render_to_response(
		'index.html',
		{'profile_list': profile_list,
		 'blog_list':blog_list,
		 },
		context_instance=RequestContext(request)
	)
