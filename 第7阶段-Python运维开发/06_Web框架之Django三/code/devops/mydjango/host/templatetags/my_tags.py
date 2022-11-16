from django import template
register=template.Library()

@register.filter
def filter_minus(v1,v2):
    return (int(v1)-v2)

@register.filter
def filter_addstr(v1,v2):
    return v1+'###'+v2

@register.simple_tag
def filter_mutiladd(v1,v2,v3,v4):
    return int(v1)+v2+v3+v4