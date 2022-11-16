from django.shortcuts import render, HttpResponse
from django.views.generic import View
import datetime


# Create your views here.
def hostlist(request):
    # return HttpResponse('主机列表')
    return render(request, 'newhostlist.html')


class TemplateView(View):
    def get(self, request):
        # return HttpResponse('模板测试类')
        # 通过接受参数返回不同的信息
        # kw = request.GET.get('kw')
        # if kw == '1':
        #     content = '接受到参数1,返回对应的信息'
        # elif kw == '2':
        #     content = '接受到参数2,返回对应的信息'
        # else:
        #     content = '非法参数,请传入正确的参数信息'
        # print(locals())
        # return render(request, 'template.html',locals())
        # content = '后端传输数据'
        username = 'devops'
        age = request.GET.get('age')
        job = 'linux'
        hobby = ['money', 'ball', 'car', 'gun']
        info = {'less': 'i am a ops', 'more': 'i am a devops  I\'m very nice'}
        date = datetime.datetime.now()
        # print(locals())
        return render(request, 'template.html', locals())


class UserListView(View):
    def get(self, request):
        print('####################')
        return render(request, 'userlist.html')


class LogListView(View):
    def get(self,request):
        return render(request,'loglist.html')
