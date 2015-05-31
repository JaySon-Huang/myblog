#!/usr/bin/env python
#coding=utf-8

from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.core.urlresolvers import reverse
from django.template.context_processors import csrf
from django.shortcuts import render_to_response, get_object_or_404

from .models import Post, Catalogue
from jsite.static_vars import profile_list

from taggit.models import Tag
from markdown import markdown


def render_post(post):
    '''render the post object before sending it to html'''
    post.body = markdown(post.body)
    return post


def context_update(new_context):
    context = {
        'profile_list': profile_list,
        'cata_list': Catalogue.objects.all(),
        'tag_list': Tag.objects.all(),
    }
    context.update(new_context)
    return context


def post_all(request):
    post_list = list(map(render_post, Post.objects.all()))
    context = context_update({
        'post_list': post_list,
    })
    context.update(csrf(request))
    print(context)
    return render_to_response(
        'blog/post_all.html',
        context
    )


def post_detail(request, post_id):
    post = get_object_or_404(Post, pk=post_id)
    post.page_view += 1  # update page view
    post.save()  # save to database
    post = render_post(post)
    return render_to_response(
        'blog/post_detail.html',
        context_update({
            'post': post,
        })
    )


def cata(request, cata_name):
    cata = get_object_or_404(Catalogue, title=cata_name)
    posts_of_cata = cata.catalogue_post.all()
    posts_of_cata = list(map(render_post, posts_of_cata))
    return render_to_response(
        'blog/post_all.html',
        context_update({
            'cur_cata': cata,
            'post_list': posts_of_cata,
        })
    )


def tag(request, tag_name):
    tag = get_object_or_404(Tag, name=tag_name)
    posts_of_tag = list(map(
        render_post,
        Post.objects.filter(tags__name__in=[tag_name])
    ))
    return render_to_response(
        'blog/post_all.html',
        context_update({
            'cur_tag': tag,
            'post_list': posts_of_tag,
        })
    )


def search(request):
    query = request.POST['q']
    posts_of_search = Post.objects.filter(title__icontains=query)
    posts_of_search = list(map(render_post, posts_of_search))
    context = context_update({
        'post_list': posts_of_search,
        'q': query,
    })
    context.update(csrf(request))
    return render_to_response(
        'blog/post_all.html',
        context
    )
