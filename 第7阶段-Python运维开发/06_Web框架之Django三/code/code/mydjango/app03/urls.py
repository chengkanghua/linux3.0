from django.conf.urls import url
from app03.views import *

urlpatterns = [
    # url(r'^admin/', admin.site.urls),
    url(r'add', AddView.as_view()),
    url(r'show', ShowView.as_view()),
    url(r'update', UpdateView.as_view()),
    url(r'delete', DeleteView.as_view()),
    url(r'manytoone', ManyToOneView.as_view()),
    url(r'manytomany', ManyToManyView.as_view())
]
