# 课后练习答案

1. 自定义监控agent1所有进程数量,并设定触发器(当大于200就警告，当大于300就严重警告，超过400个就灾难）

~~~powershell
UserParameter=total_proc,ps -ef | wc -l
~~~

2. 自定义监控agent1上mariadb的当前登录用户数, 并设定触发器(当大于50个就警告，当大于100就严重警告，超过150个就灾难)

方法一:

~~~powershell
[root@agent1 ~]# yum install mariadb-server -y
[root@agent1 ~]# systemctl restart mariadb
下面这条命令就可以得到当前登录用户数，然后自定义一个UserParameter就可以了
[root@agent1 ~]# mysqladmin extended-status |grep Threads_connected |awk '{print $4}'
~~~

方法二:

~~~powershell
在agent端的下面这个子配置文件里已经有mysql的用户参数定义了
[root@agent1 ~]# /etc/zabbix/zabbix_agentd.d/userparameter_mysql.conf

直接在后面的mysql.status[]的中括号里传相应的参数就OK了,如:

监控远程mariadb当前登录用户数
[root@zabbixserver ~]# zabbix_get -s 10.1.1.12 -k mysql.status[Threads_connected]
监控远程mariadb运行时间
[root@zabbixserver ~]# zabbix_get -s 10.1.1.12 -k mysql.status[uptime]
~~~

3, 自定义监控agent1上的tcp连接数量, 并自定义触发器

~~~powershell
# netstat -nt | awk 'NR>2 {print $0} |wc -l
~~~

4, 监控某分区磁盘使用率，并自定义触发器

~~~powershell
# df -h |awk -F'[ %]*' '$NF=="/" {print $5}'
~~~

5, 监控可用内存，并自定义触发器

~~~powershell
# free |awk 'NR==2 {print $NF}'
~~~