from django.shortcuts import render, HttpResponse


# Create your views here.

def hello(request):
    print('####################')
    print(request.method)
    print(request.path)
    print(request.get_full_path())
    print('##############')
    # return HttpResponse({'name':'linux'},content_type='application/json')
    # 实列化HttpResponse
    res = HttpResponse()
    res.status_code = 200
    res.content = "{'msg':'测试响应类'}"
    res.content_type = 'application/json'
    return res


def testget(request):
    print(type(request.GET.get('name')))
    print(type(request.GET.getlist('name')))
    print(request.GET.items())
    for one in request.GET.items():
        print(one)
    data = request.GET
    print(request.GET.lists())
    for one in request.GET.lists():
        print(one)

    # return HttpResponse('测试GET方法')
    return HttpResponse('姓名:' + data.get('name') + '<br />年龄:' + data.get('age'))


def testpost(request):
    data = request.POST
    return HttpResponse('姓名:' + data.get('name') + '<br />年龄:' + data.get('age'))


def house(request):
    # return HttpResponse('房子广告页面')
    return render(request, 'index.html')


def news(request):
    return render(request, 'news.html')


def testurl(request, num):
    print('#####################')
    print(num)
    return HttpResponse('测试路由')


def testdate(request, year, mouth, d):
    return HttpResponse(year + mouth + d)


def login(request):
    # GET请求加载页面
    if request.method == 'GET':
        return render(request, 'app02/../app02/templates/login.html')
    # POST请求接收用户参数
    if request.method == 'POST':
        # 1、接收数据  用户名称和密码
        data = request.POST
        username = data.get('username')
        password = data.get('password')
        # 2、根据接收参数查询数据库  对比
        # 这里先固定写一个校验值
        if username == 'admin' and password == '123456':
            #      2.1 判断或者查询 一致  校验成功 做登录操作
            res = '校验成功,登录完成'
        else:
            #        2.2  校验不通过  返回给用户错误信息
            res = '用户名称或者密码错误'
        # 3、返回响应信息给用户
        return HttpResponse(res)


def host(request):
    return render(request, 'host.html')
