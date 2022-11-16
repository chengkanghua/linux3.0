from django.conf.urls import url
from dashboard.views import *

urlpatterns = [
    # url(r'^admin/', admin.site.urls),
    url(r'^$', IndexView.as_view(),name='index'),
]
