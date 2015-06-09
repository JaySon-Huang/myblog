#!/usr/bin/env python
#encoding=utf-8

from django.db import models
from django.core.urlresolvers import reverse

from taggit.managers import TaggableManager


class Catalogue(models.Model):
    '''
    Blog的分类model。
    '''

    title = models.CharField(max_length=64)

    def __str__(self):
        return self.title

    def __unicode__(self):
        return self.title


class Post(models.Model):
    '''
    发布的Blog内容model。
    '''

    '''标题:长度256'''
    title = models.CharField(max_length=256)
    '''内容'''
    body = models.TextField()
    '''发布时间:创建的时候自动添加'''
    # pub_date = models.DateTimeField(auto_now_add=True)
    pub_date = models.DateTimeField()
    '''修改时间:每次修改的时候自动更新值'''
    # modified_date = models.DateTimeField(auto_now=True)
    modified_date = models.DateTimeField()
    '''浏览次数:默认值0'''
    page_view = models.IntegerField(default=0)

    # 原创/转/译
    POST_TYPE_CHOICES = (
        (0, '原创'),
        (1, '转发'),
        (2, '翻译'),
    )
    '''类型:(原创/转发/翻译)'''
    post_type = models.IntegerField(
        choices=POST_TYPE_CHOICES,
        default=0
    )

    '''目录:one to many，一篇blog只能对应一个分类。'''
    catalogue = models.ForeignKey(Catalogue, related_name='catalogue_post')

    '''标签:第三方库taggit'''
    tags = TaggableManager()

    def __str__(self):
        return self.title

    def __unicode__(self):
        return self.title

    class Meta:
        ordering = ['-pub_date']

    def get_absolute_url(self):
        return reverse('blog:post_detail', args=(self.id, ))
