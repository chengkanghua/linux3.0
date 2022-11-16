from django.db import models

# Create your models here.
Types = (
    (1, 'web服务器'),
    (2, '数据库主服务器'),
    (3, '负载均衡服务器'),
    (4, '数据库从服务器'),
    (5, '数据库中间件服务器'),
    (6, '缓存中间件服务器'),
    (7, '日志分析服务器')
)
Status = (
    (0, '下线'),
    (1, '在线'),
)


class Host(models.Model):
    hostname = models.CharField(max_length=50, verbose_name='主机名称')
    ip = models.CharField(max_length=15, verbose_name='IP地址')
    type = models.IntegerField(choices=Types, verbose_name='服务器类型')
    status = models.IntegerField(choices=Status, verbose_name='服务器状态')

    class Meta:
        # pass
        db_table = 'host'
        ordering = ['-hostname']
        verbose_name = '服务器主机资源信息管理表'

    def __str__(self):
        return self.ip


class Book(models.Model):
    name = models.CharField(max_length=50, verbose_name='图书名称')
    price = models.DecimalField(max_digits=5, decimal_places=2, verbose_name='价格')
    publish = models.ForeignKey('Publish')
    author = models.ManyToManyField('Author')

    class Meta:
        db_table = 'book'
        verbose_name = '图书表'


class Publish(models.Model):
    name = models.CharField(max_length=50, verbose_name='出版社名称')
    address = models.CharField(max_length=50, verbose_name='出版社地址')

    class Meta:
        db_table = 'publish'
        verbose_name = '出版社表'

class Author(models.Model):
    name = models.CharField(max_length=50, verbose_name='作者姓名')
    job = models.CharField(max_length=50, verbose_name='工种')

    class Meta:
        db_table = 'author'
        verbose_name = '作者表'
