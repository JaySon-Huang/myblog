# [JaySon的小黑屋](http://www.jaysonhwang.com/)

## 使用的组件
* Django 1.8  
`pip install django==1.8`
* 前端框架：[bootstrap3](http://v3.bootcss.com/)
* 前端框架：[jQuery](http://jquery.com/)
* 评论功能：[disqus](https://disqus.com/)
* 标签：[taggit](https://github.com/alex/django-taggit)
* SEO(搜索引擎优化)：[django-meta](https://github.com/nephila/django-meta/)
* markdown解析：[python-markdown](https://github.com/waylan/Python-Markdown)

## 美化
* 时钟效果：[fancyClock](http://tutorialzine.com/2009/12/colorful-clock-jquery-css/)  
对图片和CSS参数进行修改，使得大小缩为原来一半。
* 机械草丛效果： [Straws](http://codepen.io/tholman/pen/Apvxe)  
对js文件进行重写，使得渲染的Canvas可以作为一个小部分嵌入到网页中。

## 说明
若想把这个project在SAE上成功部署，还需要以下步骤：
#### 1.第三方库
把使用的第三方库放到`site-package`目录下。按照上方"使用的组件"列表，目录结构应该是这样的:

    ➜ tree -L 1 ./site-packages
    ./site-packages
    ├── disqus
    ├── django
    ├── markdown
    ├── meta
    └── taggit


#### 2.静态文件
使用`manage.py`的`collectstatic`指令，把使用的静态文件都搜集到`static_collect`目录下:

    ➜ python3 manage.py collectstatic

#### 3.部署数据库
把生成的数据库同步到SAE上（`views.py`中部分函数未处理不能获取数据库对象的逻辑.(`map`)）

#### 4.fuck.py
`fuck.py`文件中，Django的`SECRET_KEY`、Disqus的相关参数、`DATABASES`的设置。
