#!/usr/bin/python
#encoding:utf-8

from django.contrib import admin
from blog.models import BlogPost, BlogCatalogue, BlogTag, Comment

class BlogPostAdmin(admin.ModelAdmin):
	list_display = ('title', 'post_type', 'timestamp', 'catalogue', 'page_view', )

admin.site.register(BlogPost, BlogPostAdmin)


class BlogCatalogueAdmin(admin.ModelAdmin):
	list_display = ('title', )

admin.site.register(BlogCatalogue, BlogCatalogueAdmin)


class BlogTagAdmin(admin.ModelAdmin):
	list_display = ('title', )

admin.site.register(BlogTag, BlogTagAdmin)


class CommentAdmin(admin.ModelAdmin):
	list_display = ('nickname', 'email', 'timestamp')

admin.site.register(Comment, CommentAdmin)
