from django.conf.urls import url
from app01.views import *
urlpatterns = [
    url(r'^hello', hello),
    url(r'^testget', testget),
    url(r'^testpost', testpost),
    url(r'^house', house),
    url(r'^news1', news),
    url(r'^news', house),
    url(r'^testurl/(\d{2})/$', testurl),
    url(r'^date/(?P<year>\d{4})/(?P<mouth>\d{2})/(?P<day>\d{2})', testdate),
    url(r'^login', login, name='dl'),
    # url(r'^register', login, name='dl')
]
