from django.conf.urls import url
from app03.views import *

urlpatterns = [
    # url(r'^hello$', hello),
    url(r'^add', AddView.as_view()),
    url(r'^show', ShowView.as_view()),
    url(r'^update', UpdateView.as_view()),
    url(r'^delete', DeleteView.as_view()),
    url(r'^oneToMany', OneToManyView.as_view()),
]
