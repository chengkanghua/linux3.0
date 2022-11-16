from django.shortcuts import render, HttpResponse
from django.views.generic import View


# Create your views here.

class TestView(View):
    def get(self, request):
        return HttpResponse('这是GET请求')

    def post(self, request):
        return HttpResponse('this is POST')

    def put(self, request):
        return HttpResponse('this is put')


class LoginView(View):
    # 加载登录页面
    def get(self, request):
        return render(request, 'app02/login.html')

    # 收集用户信息校验登录
    def post(self, request):
        data = request.POST
        if data.get('username') == 'admin' and data.get('password') == '123456':
            res = '登录成功'
        else:
            res = '登录失败'
        return HttpResponse(res)


class TplView(View):
    def get(self, request):
        # 接收用户传输的原始数据
        data = request.GET
        # 响应返回给用户的数据
        name = data.get('name')
        age = data.get('age')
        age = int(age)
        sex = data.get('sex')
        info = '我是一名程序员'
        hobby = ['吃饭', '睡觉', '打豆豆']
        # print(hobby[0])
        msg = {'str': '现在是从事运维应用方向，逐渐迁移到云计算方法,翻墙,美帝', 'str1': 'i am coder'}
        # print(msg.get('str'))
        # res = {'name':name,'age':age}
        # 加载模板  并传输数据给模板   最终返回给用户
        # print(locals())
        return render(request, 'app02/tpl.html', locals())


class HostView(View):
    def get(self, request):
        return render(request, 'app02/host.html')


class UserView(View):
    def get(self, request):
        return render(request, 'app02/user.html')
