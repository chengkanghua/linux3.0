from django.db import models

# Create your models here.
# MySQL对应语法
# create table host(
#     hostname char(50) not null,
#     ip char(50) not null,
#     type char(50) not null,
#     status char(50) not null,
# )
typeList = [(1, 'web'), (2, 'mysql master'), (3, 'HA'), (4, 'LB'), (5, 'cache'), (6, 'mycat'), (7, 'mysql slave'),
            (8, 'hadoop')]
statusList = [(0, '下线'), (1, '在线')]


class Host(models.Model):
    hostname = models.CharField(max_length=50, verbose_name='主机名称')
    ip = models.CharField(max_length=50, verbose_name='主机的ip')
    type = models.IntegerField(choices=typeList, verbose_name='主机的服务类型')
    status = models.IntegerField(choices=statusList, verbose_name='主机的状态')
    info = models.CharField(max_length=200, default='')

    class Meta:
        # 默认表名称 appname+modelname
        db_table = 'host'
        # pass
        # 排序 查看后  以hostname倒序
        # ordering = ['-hostname']
        # 表注释  表的用途
        verbose_name = '主机信息列表'

    # def __str__(self):
    #     return self.hostname


class Book(models.Model):
    name = models.CharField(max_length=20, verbose_name='图书名称')
    price = models.DecimalField(max_digits=5, decimal_places=2, verbose_name='价格')
    # 一对多关系的设置方式
    publish = models.ForeignKey('Publish')

    class Meta:
        db_table = 'book'


class Publish(models.Model):
    name = models.CharField(max_length=20, verbose_name='出版社名称')
    address = models.CharField(max_length=100, verbose_name='出版社所在地')

    class Meta:
        db_table = 'publish'
