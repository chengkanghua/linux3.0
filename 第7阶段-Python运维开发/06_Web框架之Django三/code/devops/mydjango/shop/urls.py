from django.conf.urls import url
from shop.views import *

urlpatterns = [
    url(r'^index/', index),
]