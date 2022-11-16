from django.conf.urls import url
from host.views import *

urlpatterns = [
    url(r'^list/$', hostlist, name='hostlists'),
    url(r'tpl/', TemplateView.as_view()),
    url(r'userlist/', UserListView.as_view(), name='userlists'),
    url(r'log/', LogListView.as_view(), name='loglists')
]
