from django.shortcuts import render, HttpResponse
from django.views.generic import View


# Create your views here.
def hello(request):
    return HttpResponse('<h1>hello</h1>')


def devops(request):
    # 命令行输出
    print('###############')
    print(request.method)
    print(request.get_host())
    print(request.get_full_path())
    print('###############')
    # 响应返回  显示到页面
    return HttpResponse(request.scheme)
    # return HttpResponse('devops')


def testrep(requset):
    return HttpResponse(content='你好')


def testget(requset):
    print(requset.GET)
    # print(type(requset.GET.get('name')))
    # print(type(requset.GET.getlist('name')))
    items = requset.GET.items()
    # print(type(items))
    # print(list(items))
    for one in items:
        print(one)
        # print(type(one))
    lists = requset.GET.lists()
    # # print(list(lists))
    for one in lists:
        print(one)
    str = '姓名:' + requset.GET.get('name') + '<br />年龄' + requset.GET.get('age')
    return HttpResponse(str)


def testpost(requset):
    print(requset.POST)
    str = '姓名:' + requset.POST.get('name') + '<br />年龄' + requset.POST.get('age')
    return HttpResponse(str)


def ads(request):
    # return HttpResponse('ads')
    return render(request, 'index.html')


def testurl(request, y, m, d):
    # return HttpResponse('测试正则匹配')
    # print(year)
    str = '您输入的是' + y + '年' + m + '月' + d + '日'
    return HttpResponse(str)


def register(request):
    return render(request, 'register.html')


# 函数视图
# def login(request):
#     # 判断请求方法  执行对应操作
#     # GET方法加载页面
#     if request.method == 'GET':
#         return render(request, 'login.html')
#     elif request.method == 'POST':
#         # post请求
#         data = request.POST
#         username = data.get('username')
#         password = data.get('password')
#         # print(username)
#         # print(password)
#         # 判断校验  正常来说  是需要从数据库查询
#         if username == 'admin' and password == '123456':
#             return HttpResponse('登录成功')
#         else:
#             return HttpResponse('用户名称或者密码错误')


# 类视图
class LoginView(View):
    def get(self, request):
        return render(request, 'login.html')

    def post(self, request):
        username = request.POST.get('username')
        password = request.POST.get('password')
        if username == 'admin' and password == '123456':
            return HttpResponse('登录成功')
        else:
            return HttpResponse('用户名或者密码错误')
    def delete(self,request):
        return HttpResponse('请求到了delete方法')
