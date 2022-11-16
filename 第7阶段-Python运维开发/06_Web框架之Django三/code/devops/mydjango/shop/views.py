from django.shortcuts import render,HttpResponse

# Create your views here.
def index(request):
    return HttpResponse('这是shop里的index页面')