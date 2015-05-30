#!/usr/bin/env python
#coding=utf-8

from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.core.urlresolvers import reverse
from django.template import RequestContext
from django.shortcuts import render_to_response, get_object_or_404

from .models import Post, Catalogue
from jsite.static_vars import profile_list

from markdown import markdown


def render_post(post):
    '''render the post object before sending it to html'''
    post.body = markdown(post.body)
    post.post_type = {
        0: '原',
        1: '转',
        2: '译',
    }[post.post_type]
    return post


def post_all(request):
    return render_to_response(
        'base.html',
        {
            'profile_list': profile_list,
        }
    )


def post_detail(request, post_id):
    cata_list = Catalogue.objects.all()

    post = get_object_or_404(Post, pk=post_id)
    post.page_view += 1  # update page view
    post.save()  # save to database
    post = render_post(post)

    return render_to_response(
        'blog/post_detail.html',
        {
            'post': post,
            'cata_list': cata_list,
        }
    )


def cata(request, cata_name):
    raise NotImplementedError


def tag(request, tag_name):
    raise NotImplementedError
