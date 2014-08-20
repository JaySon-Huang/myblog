#coding=utf-8
from django.db import models
from django.http import HttpResponse
from django.template import RequestContext
from django.shortcuts import render_to_response

from django.http import Http404

from models import BlogPost
from mysite.profile import profile_list

# Create your views here.
def blog(request, blog_id):
	global profile_list

	if blog_id != None:
		try:
			record = BlogPost.objects.get(id=blog_id)
		except BlogPost.DoesNotExist:
			raise Http404
	else :
		raise Http404

	return render_to_response(
		'blog.html',
		{"profile_list":profile_list,
		"blog":record,
		},
		context_instance=RequestContext(request)
	)
