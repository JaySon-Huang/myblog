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
	)

	content = \
u'''概述

宗旨

Markdown 的目标是实现「易读易写」。

可读性，无论如何，都是最重要的。一份使用 Markdown 格式撰写的文件应该可以直接以纯文本发布，并且看起来不会像是由许多标签或是格式指令所构成。Markdown 语法受到一些既有 text-to-HTML 格式的影响，包括 Setext、atx、Textile、reStructuredText、Grutatext 和 EtText，而最大灵感来源其实是纯文本电子邮件的格式。'''

	blog_list = [ 
	{'title':"Markdown 语法说明","timestamp":"2012-01-01","id":1,"sum":content[:40],},
	{'title':"Markdown 语法说明2","timestamp":"2012-01-01","id":2,"sum":content[:40],},
	]

	return render_to_response(
		'index.html',
		{'guidance_list': guidance_list,
		 'blog_list':blog_list,
		 },
		context_instance=RequestContext(request)
	)
