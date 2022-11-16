from django import template

register = template.Library()


@register.filter
def filter_add(v1, v2):
    return int(v1 / v2)


@register.simple_tag
def filter_madd(v1, v2, v3, v4):
    return v1 + v2 + v3 + v4


@register.filter
def filter_mm(v1, v2):
    if v2 == '':
        v2 = ['翻墙', '美帝', '精日']
    for one in v2:
        v1 = v1.replace(one,'zzz')
    return v1
