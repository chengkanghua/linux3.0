from django.conf.urls import url
from users.views import *

urlpatterns = [
    # url(r'^admin/', admin.site.urls),
    url(r'list', UserListView.as_view(), name='user_list'),
    url(r'testdata', TestDataView.as_view()),
]
