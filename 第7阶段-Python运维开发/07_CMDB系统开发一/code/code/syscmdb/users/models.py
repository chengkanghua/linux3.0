from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class Profile(models.Model):
    name_cn = models.CharField(max_length=50,verbose_name='中文名')
    wechat = models.CharField(max_length=50,verbose_name='微信')
    phone = models.CharField(max_length=11,verbose_name='电话')
    info = models.TextField(verbose_name='备注')
    profile = models.OneToOneField(User)