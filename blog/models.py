from django.db import models
from django.contrib import admin

class BlogPost(models.Model):
	title = models.CharField(max_length = 256)
	body = models.TextField()
	timestamp = models.DateTimeField()

	def __unicode__(self):
		return self.title

	class Meta:
		ordering = ['-timestamp']

class BlogPostAdmin(admin.ModelAdmin):
	list_display = ('title', 'timestamp')


admin.site.register(BlogPost, BlogPostAdmin)
