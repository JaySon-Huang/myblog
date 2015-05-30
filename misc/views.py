#!/usr/bin/env python
#coding=utf-8

from django.shortcuts import render_to_response


def static_pages(request, **kwargs):
    return render_to_response(
        'misc/' + kwargs['page']
    )
