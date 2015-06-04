from django.conf.urls import url

from . import views

urlpatterns = [
    url(
        r'^google08a282ae4299a9ec\.html$',
        views.static_pages,
        {'page': 'google08a282ae4299a9ec.html'}
    ),
    url(
        r'^baidu_verify_khKBt7UZo7\.html$',
        views.static_pages,
        {'page': 'baidu_verify_khKBt7UZo7.html'}
    ),
    url(
        r'^baidu_verify_QnWi0gN0st\.html$',
        views.static_pages,
        {'page': 'baidu_verify_QnWi0gN0st.html'}
    ),
]
