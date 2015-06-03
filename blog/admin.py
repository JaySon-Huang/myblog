#!/usr/bin/env python
#encoding=utf-8

from django.contrib import admin

from .models import Post, Catalogue

# 使用register(since 1.7)
# https://docs.djangoproject.com/en/1.8/ref/contrib/admin/#the-register-decorator


@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    '''admin of post'''

    '''列表中显示的列'''
    list_display = (
        'title', 'post_type', 'pub_date', 'modified_date', 'catalogue', 'page_view',
    )

    '''添加/修改时分组显示'''
    fieldsets = [
        (None, {
            'fields': [
                'title', 'catalogue', 'tags',
                ('post_type', 'page_view', ),
            ]
        }),
        ('Body', {
            'fields': ['body'],
            'classes': ('wide', ),
        }),
        ('Date information', {
            'fields': [('pub_date', 'modified_date', )],
            # 'classes': ('collapse', ),
        })
    ]

    '''在列表的顶部添加根据字段分级显示的功能'''
    date_hierarchy = 'pub_date'

    '''搜索功能'''
    search_fields = ['=title']  # `=` for case-insensitive

    '''跳转到链接处(since 1.7), 需要`model`实现method`get_absolute_url`'''
    view_on_site = True


@admin.register(Catalogue)
class CatalogueAdmin(admin.ModelAdmin):
    '''admin of catalogue'''

    list_display = ('title', )

# just for joke
import django
# change the site header, since 1.7
django.contrib.admin.AdminSite.site_header = 'What the f**k?'
# change the index/site title, since 1.7
django.contrib.admin.AdminSite.index_title = '0h!'
django.contrib.admin.AdminSite.site_title = 'Y0u F0und M3!'
