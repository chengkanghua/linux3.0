from django.shortcuts import render, HttpResponse
from django.views.generic import View
from app03.models import *


# Create your views here.
class AddView(View):
    def get(self, request):
        # 方法一：save
        # obj = Host(hostname='server01',ip='192.168.17.100',type='1',status='1',info='web服务器 主要提供web服务器')
        # obj.save()
        # 方法二:
        # obj = Host()
        # obj.hostname = 'server02'
        # obj.ip = '192.168.17.101'
        # obj.type = '2'
        # obj.status = '0'
        # obj.info = 'mysql数据库的  主服务器'
        # obj.save()
        # 方法三：
        # Host.objects.create(hostname='server03',ip='192.168.17.102',type='1',status='1',info='web服务器的备用服务器')
        # 方法四：
        data = {'hostname': 'server04', 'ip': '192.168.17.103', 'type': '4', 'status': '0', 'info': 'web服务器的负载均衡服务器'}
        Host.objects.create(**data)
        return HttpResponse('添加测试')


class ShowView(View):
    def get(self, request):
        # 查询所有的数据
        # data = Host.objects.all()
        # 查询条件  获取一条
        # data = Host.objects.get(status=5)
        # 查询获取多条
        # data = Host.objects.filter(status=0)
        # 排除条件
        # data = Host.objects.exclude(status=0)
        # for one in data:
        #     # print(key+':'+value)
        #     print(one.hostname)
        # 显示筛选数据
        # data = Host.objects.filter(status=0,hostname='server04').values('hostname', 'ip')
        # 内置查询方法  __下划线方法
        # data = Host.objects.filter(hostname__contains='S')
        # data = Host.objects.filter(id__gt=1)
        # 原生SQL语句
        # data = Host.objects.raw("select * from host where id > 1 and ip = '192.168.17.101' order by hostname desc")
        data = Host.objects.filter(id__gt=1,ip='192.168.17.101').order_by('hostname')
        print(data)
        for one in data:
            print(one.hostname)
        return HttpResponse('查询测试');


class UpdateView(View):
    def get(self, request):
        # 方法一
        # obj = Host.objects.get(hostname='server01')
        # obj.hostname = 'Server01'
        # obj.save()
        # 方法二
        # Host.objects.filter(hostname='Server01').update(hostname='server01')
        # Host.objects.filter(hostname='server02').update(hostname='Server02')
        return HttpResponse('修改测试');

class DeleteView(View):
    def get(self,request):
        rs = Host.objects.filter(ip='192.168.17.103').delete()
        print(rs)
        return HttpResponse('删除测试')

class OneToManyView(View):
    def get(self,request):
        # 先添加出版社
        # Publish.objects.create(name='清华大学出版社',address='北京')
        # Publish.objects.create(name='东北大学出版社', address='沈阳')
        # Publish.objects.create(name='东北财经大学出版社', address='大连')
        # 添加图书消息
        # Book.objects.create(name='Linux高级运维详解',price='89.6',publish=Publish.objects.get(name='清华大学出版社'))
        # Book.objects.create(name='DevOps的设计理念', price='60.5', publish=Publish.objects.get(name='东北大学出版社'))
        # Book.objects.create(name='Python的高级开发', price='50.43', publish=Publish.objects.get(name='清华大学出版社'))
        # 正向查询 书是哪个出版社出版的
        # data = Book.objects.all()
        # print(data)
        # for one in data:
        #     print(one.name+':'+one.publish.name)
        # 反向查询  这个出版社出了什么书
        # 清华大学出版社出了什么书
        data = Publish.objects.get(name__contains='清华').book_set.all().values('name')
        print(data)
        return HttpResponse('一对多测试')
