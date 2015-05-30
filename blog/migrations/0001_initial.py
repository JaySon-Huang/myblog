# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import taggit.managers


class Migration(migrations.Migration):

    dependencies = [
        ('taggit', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Catalogue',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=64)),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=256)),
                ('body', models.TextField()),
                ('pub_date', models.DateTimeField(auto_now_add=True)),
                ('modified_date', models.DateTimeField(auto_now=True)),
                ('page_view', models.IntegerField(default=0)),
                ('post_type', models.IntegerField(default=0, choices=[(0, '原创'), (1, '转发'), (2, '翻译')])),
                ('catalogue', models.ForeignKey(related_name='catalogue_post', to='blog.Catalogue')),
                ('tags', taggit.managers.TaggableManager(to='taggit.Tag', help_text='A comma-separated list of tags.', through='taggit.TaggedItem', verbose_name='Tags')),
            ],
            options={
                'ordering': ['-pub_date'],
            },
        ),
    ]
