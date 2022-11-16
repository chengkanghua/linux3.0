"""mydjango URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from blog.views import *

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^hello$', hello),
    url(r'^devops', devops),
    url(r'^testrep', testrep),
    url(r'^testget', testget),
    url(r'^testpost', testpost),
    url(r'^ads.html', ads),
    # url(r'^hello', ads),
    url(r'^hellotom', devops),
    url(r'^testurl/(\d{4})/(\d{2})/(\d{2})$', testurl),
    # url(r'^testurl/(?P<year>\d{4})/(?P<mouth>\d{2})/(?P<day>\d{2})$', testurl),
    url(r'^register1$', register, name='register'),
    # url(r'^login$', login, name='login'),
    url(r'^login$', LoginView.as_view(), name='login'),
    url(r'^shop/', include('shop.urls')),
    url(r'^host/', include('host.urls')),
    url(r'^app03/', include('app03.urls')),
]
