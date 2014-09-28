#!/usr/bin/python
#encoding:utf-8

from django.db import models

class BlogCatalogue(models.Model):
	'''
	Blog的分类model。每个发布的Blog只对应一个分类
	'''

	title = models.CharField(max_length=64)

	def __unicode__(self):
		return self.title


class BlogTag(models.Model):
	'''
	Blog的标签model。每个发布的Blog可对应多个分类
	'''

	title = models.CharField(max_length=64)

	def __unicode__(self):
		return self.title

class BlogPost(models.Model):
	'''
	发布的Blog内容model。
	'''

	title = models.CharField(max_length = 256)
	body = models.TextField()
	timestamp = models.DateTimeField()
	page_view = models.IntegerField()

	'''one to many.一篇blog只能对应一个分类。'''
	catalogue = models.ForeignKey(BlogCatalogue, related_name='catalogue_post')

	'''many to many.'''
	tags = models.ManyToManyField(BlogTag, related_name='tag_post')

	def __unicode__(self):
		return self.title

	class Meta:
		ordering = ['-timestamp']


class Comment(models.Model):
	'''
	评论记录model。
	'''
	nickname = models.CharField(max_length=32)
	email = models.CharField(max_length=32)
	body = models.TextField()
	timestamp = models.DateTimeField()

	post = models.ForeignKey(BlogPost, related_name='comment_post')


	def __unicode__(self):
		return u'%s:%s...'%(self.nickname, self.body[:10])

	class Meta:
		ordering = ['-timestamp']
