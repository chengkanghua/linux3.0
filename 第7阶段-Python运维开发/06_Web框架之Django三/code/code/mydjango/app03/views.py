from django.shortcuts import render, HttpResponse
from django.views.generic import View
from app03.models import *


# Create your views here.
class AddView(View):
    def get(self, request):
        # 方法一  save
        # obj = Host(hostname='server01',ip='12.168.17.100',type='1',status='1')
        # print(obj)
        # rs = obj.save()
        # print(rs)
        # 方法二 save
        # obj = Host()
        # obj.hostname = 'server02'
        # obj.ip = '192.168.17.102'
        # obj.type = '2'
        # obj.status = '1'
        # obj.save()
        # 方法三
        # Host.objects.create(hostname='server03',ip='192.168.17.103',type='1',status='0')
        # 方法四
        data = {'hostname': 'server04', 'ip': '192.168.17.104', 'type': '3', 'status': '0'}
        # 这里 ** 代表传入的参数是一个dict
        Host.objects.create(**data)
        return HttpResponse('测试添加数据')


class ShowView(View):
    def get(self, request):
        # 查询所有数据
        # data = Host.objects.all()
        # print(data)
        # for one in data:
        #     # print(one.hostname)
        #     print(one)
        # 查询一条 get方法
        # data = Host.objects.get(status=4)
        # 查询多条  filter方法
        # data = Host.objects.filter(status=4)
        # 排除  exclude
        # data = Host.objects.filter(status=0)
        # data = Host.objects.exclude(status=1)
        # 筛选显示
        # data = Host.objects.get(id=1).values('hostname','ip','status')
        # id 大于1的数据
        # data = Host.objects.filter(id__gt=1).values('id','hostname')
        # select * from host where hostname in ('server02','server03');
        data = Host.objects.filter(hostname__in=['server02','server03']).value('id','hostname')
        print(data)
        return HttpResponse('查询数据')


class UpdateView(View):
    def get(self, request):
        # 方法一  操作数据对象  存储修改
        # obj = Host.objects.get(hostname='server01')
        # obj.hostname = 'Server01'
        # obj.save()
        # 方法二  通过update方法修改
        Host.objects.filter(hostname='Server01').update(hostname='server01')
        return HttpResponse('修改测试')


class DeleteView(View):
    def get(self, request):
        # 删除数据
        Host.objects.filter(hostname='server04').delete()
        return HttpResponse('删除测试')


class ManyToOneView(View):
     def get(self,request):
         # 添加数据
         # 先添加一关系   先出版社  才可以出版图书
         Publish.objects.create(name='清华大学出版社',address='北京')
         Publish.objects.create(name='东北大学出版社', address='沈阳')
         Publish.objects.create(name='东北财经大学出版社',address='大连')
         # 添加图书
         Book.objects.create(name='Linux高级运维详解',price=89.60,publish=Publish.objects.get(name='清华大学出版社'))
         Book.objects.create(name='DevOps的设计理念', price=64.50, publish=Publish.objects.get(name='东北大学出版社'))
         Book.objects.create(name='Python高级开发', price=50.43, publish=Publish.objects.get(name='清华大学出版社'))
         # 查询数据  通过图书名称  查询属于哪个出版社  正向查询
         # data = Book.objects.get(name__startswith='Linux')
         # print(data.publish.name)
         # 通过出版社名称 查询出出版的图书名称
         # data = Publish.objects.get(name='清华大学出版社').book_set.all().values('name')
         # 删除清华大学出版社  清华大学出版社  要下架所有图书
         # 1、删除清华大学出版社  对应图书是清华大学出版社的  都删除
         # Publish.objects.get(name='清华大学出版社').delete()
         # print(data)
         return HttpResponse('多对一的测试操作')


class ManyToManyView(View):
    def get(self, request):
        # 添加数据
        # 东北财经大学出版社  出版了《计算机网络基础和运维》
        # 添加三个作者
        user1 = Author.objects.create(name='张晓明',job='coder')
        user2 = Author.objects.create(name='李晓彤', job='sa')
        user3 = Author.objects.create(name='张大龙', job='app')
        # 添加图书  并添加图书和作者的关系
        # 1、图书和出版社关系
        book = Book.objects.create(name='计算机网络基础和运维',price='5.50',publish=Publish.objects.get(name='东北财经大学出版社'))
        # 2、添加图书和作者的关系
        # book.objects.add(user1,user2,user3)
        return HttpResponse('多对多的测试操作')