# -*- coding: utf-8 -*-
# Generated by Django 1.11.18 on 2019-05-14 09:39
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app03', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Author',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='作者姓名')),
                ('job', models.CharField(max_length=50, verbose_name='工种')),
            ],
            options={
                'verbose_name': '作者表',
                'db_table': 'author',
            },
        ),
        migrations.AddField(
            model_name='book',
            name='author',
            field=models.ManyToManyField(to='app03.Author'),
        ),
    ]
