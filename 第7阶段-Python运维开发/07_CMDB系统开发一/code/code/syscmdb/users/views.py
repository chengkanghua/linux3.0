from django.shortcuts import render
from django.views.generic import View, ListView
from django.contrib.auth.models import User
from users.models import *
from django.contrib.auth.hashers import make_password


# Create your views here.
# class UserListView(View):
#     def get(self,request):
#         data = User.objects.all()
#         return render(request,'user_list.html',{'data':data})
class UserListView(ListView):
    template_name = 'user_list.html'
    model = User
    paginate_by = 8

    def get_context_data(self, **kwargs):
        context = super(UserListView, self).get_context_data(**kwargs)
        context['page_range'] = self.page_range(context['page_obj'], context['paginator'])
        print(context)
        return context

    def page_range(self, page_obj, paginator):
        current_page = page_obj.number
        start = current_page - 2
        end = current_page + 3
        # 如果start 小于 1
        if start < 1:
            start = 1
        # 如果 end 大于 最大页数
        if end > paginator.num_pages:
            end = paginator.num_pages + 1
        return range(start, end)


class TestDataView(View):
    def get(self, request):
        for i in range(1, 100):
            user = User()
            profile = Profile()
            user.username = 'user{}'.format(i)
            user.password = make_password('123456')
            user.email = '{}.qq@com'.format(i)
            user.save()
            profile.profile_id = user.id
            profile.name_cn = '用户{}'.format(i)
            profile.wechat = 'wechat_user{}'.format(i)
            profile.phone = '133333333{}'.format(i)
            profile.info = '测试用户{}'.format(i)
            profile.save()
