#coding=utf-8
from django.db import models
from django.http import HttpResponse
from django.template import RequestContext
from django.shortcuts import render_to_response

from django.http import Http404

from blog.models import BlogPost, BlogCatalogue
from constants import (
	profile_list, 
	DEFAULT_CSS_FILES, 
	DEFAULT_JAVASCRIPT_FILES,
)
from settings import IS_ONLINE

from markdown import markdown

def render_default(template_file, parms, request, more_css=None, more_js=None):
	if more_css:
		css_files = DEFAULT_CSS_FILES + more_css
	else:
		css_files = DEFAULT_CSS_FILES
	parms['css_files'] = css_files

	if more_js:
		js_files = DEFAULT_JAVASCRIPT_FILES + more_js
	else:
		js_files = DEFAULT_JAVASCRIPT_FILES
	parms['js_files'] = js_files
	parms['IS_ONLINE'] = IS_ONLINE
	parms['profile_list'] = profile_list
	return render_to_response(
		template_file,
		parms,
		context_instance=RequestContext(request)
	)

def index(request, nonce=None):
	global profile_list,IS_ONLINE

	blog_list = BlogPost.objects.all()
	cata_list = BlogCatalogue.objects.all()

	for blog in blog_list:
		blog.body = markdown(unicode(blog.body[:300]))

	return render_default(
		'index.html',
		{
		'blog_list' : blog_list,
		'cata_list' : cata_list,
		},
		request
	)

def catalogue(request, cata_name):
	global profile_list,IS_ONLINE

	cata_list = BlogCatalogue.objects.all()

	if cata_name is not None and cata_name != "":
		try :
			cata = BlogCatalogue.objects.get(title=cata_name)
			blog_list = cata.catalogue_post.all()
			for blog in blog_list:
				blog.body = markdown(unicode(blog.body[:300]))
		except BlogCatalogue.DoesNotExist :
			print cata_name,"does NOT exist!"
			raise Http404
	else:
		raise Http404
	return render_default(
		'index.html',
		{
		 'blog_list': blog_list,
		 'cata_list': cata_list,
		 'current_cata': cata_name,
		},
		request
	)

def web_homework(request, no):
	no = int(no)
	title = ""
	template_path = "WebCourse/%d.html"%(no,)

	try :
		return render_to_response(
			template_path,
			{},
			context_instance=RequestContext(request)
		)
	except :
		raise Http404

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

def baidu_verify2(request):
	return render_to_response(
		'baidu_verify_QnWi0gN0st.html',
		{},
		context_instance=RequestContext(request),
	)

def tic_logo(request):
	return render_default(
		'tic_logo.html',
		{},
		request,
		more_css=('css/tic_logos.css',)
	)
	return render_to_response(
		'tic_logo.html',
		{},
		context_instance=RequestContext(request)
	)
