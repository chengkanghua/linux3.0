# openstack排错思路

在搭建openstack过程当中，如果你配置文件有误，导入了数据后才发现错误。这时候不是把配置文件改正确就OK了。

原因是: 

1. 数据是导入到mysql里的，它会按照你的配置来导入相应的信息。
2. 如果你的配置有错误，那么导入的信息也是错误的。
3. 你发现了配置错误，改成过来。但在mysql里的数据仍然是错误的。

解决方法:

* 把配置改正过来OK后，需要把mysql里的库也删除。
* 因为创建的user,service,endpoint也要放在mysql中，所以建议也全部删除。重新创建



## 排错案例

以nova这个较复杂的组件为例:

**1, 先把配置文件错误都更正，确认无误**

**2, 在controller节点与compute节点关闭服务**

~~~powershell
[root@controller ~]# systemctl stop openstack-nova-api.service openstack-nova-consoleauth.service openstack-nova-scheduler.service openstack-nova-conductor.service openstack-nova-novncproxy.service
~~~

~~~powershell
[root@compute ~]# systemctl stop libvirtd.service openstack-nova-compute.service
~~~

**3, 删除mysql里的相关库,并重建( 不需要重新授权)**

~~~powershell
[root@controller ~]# mysql -pdaniel.com

MariaDB [(none)]> drop database nova;
MariaDB [(none)]> drop database nova_api;
MariaDB [(none)]> drop database nova_cell0;

MariaDB [(none)]> create database nova;
MariaDB [(none)]> create database nova_api;
MariaDB [(none)]> create database nova_cell0;
~~~

**4，删除相关的user,service,endpoint**

~~~powershell
[root@controller ~]# openstack user delete nova
[root@controller ~]# openstack user delete placement
[root@controller ~]# openstack service delete nova
[root@controller ~]# openstack service delete placement

删除service后会自动删除相关的endpoint
~~~

**5, 重建相关的user,service,endpoint（按文档操作再做一次，如果再搞错，就再回到第1步重来吧)**

~~~powershell
[root@controller ~]# openstack user create --domain default --password daniel.com nova

[root@controller ~]# openstack role add --project service --user nova admin

[root@controller ~]# openstack service create --name nova --description "OpenStack Compute" compute

[root@controller ~]# openstack endpoint create --region RegionOne compute public http://controller:8774/v2.1

[root@controller ~]# openstack endpoint create --region RegionOne compute internal http://controller:8774/v2.1

[root@controller ~]# openstack endpoint create --region RegionOne compute admin http://controller:8774/v2.1


[root@controller ~]# openstack user create --domain default --password daniel.com placement

[root@controller ~]# openstack role add --project service --user placement admin


[root@controller ~]# openstack service create --name placement --description "Placement API" placement

[root@controller ~]# openstack endpoint create --region RegionOne placement public http://controller:8778

[root@controller ~]# openstack endpoint create --region RegionOne placement internal http://controller:8778

[root@controller ~]# openstack endpoint create --region RegionOne placement admin http://controller:8778
~~~

**6, 导入数据(按文档顺序)**

~~~powershell
[root@controller ~]# su -s /bin/sh -c "nova-manage api_db sync" nova

[root@controller ~]# su -s /bin/sh -c "nova-manage cell_v2 map_cell0" nova

[root@controller ~]# su -s /bin/sh -c "nova-manage cell_v2 create_cell --name=cell1 --verbose" nova

[root@controller ~]# su -s /bin/sh -c "nova-manage db sync" nova
~~~

**7, 在controller节点与compute节点再启动服务**

~~~powershell
[root@controller ~]# systemctl start openstack-nova-api.service openstack-nova-consoleauth.service openstack-nova-scheduler.service openstack-nova-conductor.service openstack-nova-novncproxy.service
~~~

~~~powershell
[root@compute ~]# systemctl start libvirtd.service openstack-nova-compute.service
~~~

**8, controller上新增计算节点记录，增加到nova数据库中**

~~~powershell
[root@controller ~]# su -s /bin/sh -c "nova-manage cell_v2 discover_hosts --verbose" nova
~~~

**9，请自行验证**



## 案例总结

以上排错案例的主要思想就是，按着文档操作的**逆向思维**来操作。

* 比如最后1步一般是启服务，我们就先停服务
* 因为导入的数据都在mysql中，所以清空mysql数据库
* 创建的user,service,endpoint等数据在keystone中，也需要清掉
* 清完数据后，就可以按文档顺序再操作了



# 最后说明

以上排错思路在真实环境中并无太大意义。工作中不可能天天去排错搭建过程的小错误的，而是做自动化部署(shell或ansible等)

还是要在学习搭建过程中去体会，去尽量减少自己的操作错误，去培养自己的操作思维(不可言传，只能在磨练中体会)。



