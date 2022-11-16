**拓展:osd磁盘的删除**(这里以删除node1上的osd.0磁盘为例)

1, 查看osd磁盘状态

```powershell
[root@node1 ceph]# ceph osd tree
ID CLASS WEIGHT  TYPE NAME      STATUS REWEIGHT PRI-AFF
-1       0.00298 root default
-3       0.00099     host node1
 0   hdd 0.00099         osd.0      up  1.00000 1.00000
-5       0.00099     host node2
 1   hdd 0.00099         osd.1      up  1.00000 1.00000
-7       0.00099     host node3
 2   hdd 0.00099         osd.2      up  1.00000 1.00000
```

2, 先标记为out

```powershell
[root@node1 ceph]# ceph osd out osd.0
marked out osd.0.

[root@node1 ceph]# ceph osd tree
ID CLASS WEIGHT  TYPE NAME      STATUS REWEIGHT PRI-AFF
-1       0.00298 root default
-3       0.00099     host node1
 0   hdd 0.00099         osd.0      up        0 1.00000			可以看到权重为0,但状态还是UP
-5       0.00099     host node2
 1   hdd 0.00099         osd.1      up  1.00000 1.00000
-7       0.00099     host node3
 2   hdd 0.00099         osd.2      up  1.00000 1.00000
```

3, 再rm删除,但要先去**==osd.0对应的节点上==**停止ceph-osd服务,否则rm不了

```powershell
[root@node1 ceph]# systemctl stop ceph-osd@0.service

[root@node1 ceph]# ceph osd rm osd.0
removed osd.0

[root@node1 ceph]# ceph osd tree
ID CLASS WEIGHT  TYPE NAME      STATUS REWEIGHT PRI-AFF
-1       0.00298 root default
-3       0.00099     host node1
 0   hdd 0.00099         osd.0     DNE        0			  状态不再为UP了
-5       0.00099     host node2
 1   hdd 0.00099         osd.1      up  1.00000 1.00000
-7       0.00099     host node3
 2   hdd 0.00099         osd.2      up  1.00000 1.00000
```

4, 查看集群状态

```powershell
[root@node1 ceph]# ceph -s
  cluster:
    id:     6788206c-c4ea-4465-b5d7-ef7ca3f74552
    health: HEALTH_WARN
            1 osds exist in the crush map but not in the osdmap	 有警告,没有在crush算法中删除

  services:
    mon: 3 daemons, quorum node1,node2,node3
    mgr: node1(active), standbys: node2, node3
    osd: 2 osds: 2 up, 2 in							发现只有两个osd,说明osd.0删除成功

  data:
    pools:   0 pools, 0 pgs
    objects: 0  objects, 0 B
    usage:   28 MiB used, 2.0 GiB / 2.0 GiB avail		3G变为2G,说明删除成功
    pgs:

```

5, 在crush算法中和auth验证中删除

```powershell
[root@node1 ceph]# ceph osd crush remove osd.0
removed item id 0 name 'osd.0' from crush map
```

```powershell
[root@node1 ceph]# ceph auth del osd.0
updated
```

6, 还需要在**==osd.0对应的节点==**上卸载

```powershell
[root@node1 ceph]# df -h |grep osd
tmpfs           488M   48K  488M   1% /var/lib/ceph/osd/ceph-0

[root@node1 ceph]# umount /var/lib/ceph/osd/ceph-0
```

7, **在osd.0对应的节点上**删除osd磁盘产生的逻辑卷

```powershell
[root@node1 ceph]# pvs
  PV         VG                                        Fmt  Attr PSize    PFree
  /dev/sdb   ceph-56e0d335-80ba-40d8-b076-fc63a766dcac lvm2 a--  1020.00m    0
  
    
[root@node1 ceph]# vgs
  VG                                        #PV #LV #SN Attr   VSize    VFree
  ceph-56e0d335-80ba-40d8-b076-fc63a766dcac   1   1   0 wz--n- 1020.00m    0


[root@node1 ceph]# lvremove ceph-56e0d335-80ba-40d8-b076-fc63a766dcac
Do you really want to remove active logical volume ceph-56e0d335-80ba-40d8-b076-fc63a766dcac/osd-block-ef26149d-5d7d-4cc7-8251-684fbddc2da5? [y/n]:y
  Logical volume "osd-block-ef26149d-5d7d-4cc7-8251-684fbddc2da5" successfully removed

```

至此，就完全删除了

8，如果要再加回来,再次在部署节点使用下面命令即可

```powershell
[root@node1 ceph]# ceph-deploy disk zap node1 /dev/sdb
[root@node1 ceph]# ceph-deploy osd create --data /dev/sdb node1
```





