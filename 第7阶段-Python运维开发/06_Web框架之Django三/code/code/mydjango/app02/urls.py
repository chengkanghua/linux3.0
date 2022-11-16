from django.conf.urls import url
from app02.views import *

urlpatterns = [
    # url(r'^test', ),
    url(r'^test', TestView.as_view()),
    url(r'^login', LoginView.as_view(), name='login'),
    url(r'^tpltest', TplView.as_view(), ),
    url(r'^host', HostView.as_view(), ),
    url(r'^user', UserView.as_view(), )
]
