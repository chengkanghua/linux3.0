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
    return render(request,'index.html')

def news(request):
    return render(request,'news.html')

def testurl(request,num):
    print('#####################')
    print(num)
    return HttpResponse('测试路由')

def testdate(request,year,mouth,d):
    return HttpResponse(year+mouth+d)
def login(request):
    if request.method == 'GET':
        return render(request,'login.html')
    if request.method == 'POST':
        print(request.POST)
        return HttpResponse('接收到POST请求')