

# 一、Linux下软件包管理

## ㈠ 软件包类型

### 1 、 二进制包

- 什么是二进制包？有什么特点？

  1. 二进制包，指的是已经[^编译]好了的软件包，只需要==直接安装==就可以使用。
  2. 二进制包，==不需要编译==，直接下载安装即可
  3. 二进制包，需要根据自己的计算机CPU以及操作系统去==选择合适==的
  4. 二进制包，命名方式一般为：`xlockmore-5.31-2.el6.x86_64.rpm`

  ```BASH
  xlockmore-5.31-2.e16.x86_64.rpm
  #xlockmore 软件包名字
  # 5.31-2 版本
  # e16 操作系统版本
  # x86_64 计算机cpu架构
  # rpm  包
  ```
  
  

###  2、源码包

- 什么是源码包？有什么特点？
  1. 源码包，指的是程序员写的原始的==程序代码文件==，==不能==够==直接==在计算机上==运行==。
  2. 源码包，需要进行==编译==，变成==二进制的软件包后==，才可安装使用
  3. 源码包，一般可以在任何的计算机上安装使用
  4. 源码包，命名方式一般为：
     - `软件包名.tar.gz`
     - `软件包名.tar.bz2`
     - `软件包名.tar.xz`
     - `软件包名.zip`

### 3、 二进制源码包(了解)

- 什么是二进制源码包？有什么特点？
  1. 二进制源码包，是一个==半成品==，安装后不能直接使用
  2. 二进制源码包，需要使用`rpmbuild`工具重建成真正的`rpm`包或者重建成源码包才可安装使用
  3. 二进制源码包，命名方式一般为：
     - mysql-community-5.7.25-1.el6.==src.==rpm
     - mysql-community-5.7.25-1.el7.==src==.rpm

## ㈡ 常见的二进制包

| 系统平台                  | 包类型 | 工具         | 在线安装 |
| ------------------------- | ------ | ------------ | -------- |
| RedHat/Centos/Fedora/SUSE | rpm    | rpm,rpmbuild | yum      |
| Ubuntu/Debian             | deb    | dpkg         | apt      |

## ㈢ 总结二进制包和源码包区别

| 软件包类型 | 是否编译 | 安装难易程度         | 可定制性 |
| ---------- | -------- | -------------------- | -------- |
| 二进制包   | 否       | 易(直接安装)         | 差       |
| 源码包     | 是       | 难(配置—>编译—>安装) | 好       |

# 二、Linux系统中软件包安装方式

## ㈠ 二进制包

### 1、==rpm工具安装==

- 首先，需要下载好rpm包到本地
- 然后，直接使用rpm工具安装

### 2、yum工具安装

- 首先，需要配置软件仓库(里面存放很多软件包，但不一定在本地)
- 然后，使用yum工具安装

## ㈡ 源码包

### 1、根据需求配置

功能的定制

### 2、编译

使用编译器编译成二进制的软件包

### 3、安装

将软件包安装到指定位置

### 4、源码包安装优点

1. 可以在==任意平台==上编译安装，编译出来的软件包非常适应所在机器。  
2. 可以在编译的时候，通过配置，==对某些功能进行定制==，开启或关闭相应的功能。

# 三、==二进制rpm包如何管理(重点)==

## ㈠ 如何获取rpm包

Linux只是内核，Linux发行版本：GNU/Linux

1. RedHat/Centos光盘或官方网站 ftp://ftp.redhat.com
2. 推荐网站
   - www.rpmfind.net
   - rpm.pbone.net
3. 相应软件官方网站 
   - http://www.mysql.com
   - http://nginx.org/packages/

## ㈡ 如何选择合适的rpm包

1. 选择==适合当前系统==的版本号
   - 找不到适合的，才去尝试别的系统版本号  
   - el6兼容el5；el5无法安装 el6
2. 选择==适合当前计算机cpu==的架构
   - x86_64包，只能安装在64位的系统上 
   - i386,i586,i686的软件包可以安装在32和64位系统上  
   - noarch表示这个软件包与硬件构架无关，可以通用  
   - 32位系统不能安装64位包

**建议**： 建议不要跨大版本号去安装软件包，尽量使用当前系统版本自带软件包安装

## ㈢ 如何管理rpm包

### 1、==rpm工具管理==

#### ① rpm工具安装rpm包

```powershell
# rpm -ivh 软件包
# rpm -ivh xlockmore-5.31-2.el6.x86_64.rpm
注意：软件包的名字必须写全，xxx.rpm
```

#### ② rpm工具卸载rpm包

```powershell
# rpm -e 软件包名字
# rpm -e xlockmore
注意：卸载软件只需要跟软件包名字即可
```

#### ③ rpm包的升级rpm包

```powershell
# rpm -Uvh 软件包
或者
# rpm -Fvh 软件包
选项说明：
-v:输出详细信息
-h:打印散列标记，一般和-v一起使用
-U:升级软件包，如果该软件包没安装，会自动帮你安装
-F:升级软件包，如果该软件包没安装，不会自动帮你安装
```

#### ④ 查看rpm包相关信息

```powershell
查看已经安装的软件的文件列表
rpm -ql	软件包名
查看未安装的rpm包里的文件列表
rpm -qlp  软件包(xxx.rpm)
查看已经安装的所有rpm包
rpm -qa 软件包名
查看已经安装软件的文档列表
rpm -qd 软件包名
查看已经安装软件的配置文件
rpm -qc 软件包名
查看已经安装软件的详细信息
rpm -qi 软件包名
查看指定文件来自哪个rpm包
rpm -qf 文件名
```

#### ⑤ rpm工具其他安装选项

```powershell
--force		表示强制
rpm -ivh 软件包 --force		强制安装软件包
rpm -e 软件包名 --force	  强制卸载软件包

--nodeps		忽略依赖关系
rpm -ivh 软件包 --nodeps	忽略依赖关系安装
rpm -e 软件包 --nodeps		忽略依赖关系卸载

其他了解：
rpm --import  key_file			导入公钥用于检查rpm文件的签名
rpm --checksig package.rpm		检查rpm包的签名
```

### 2、yum工具管理

**核心：**需要有一个==软件仓库==，软件仓库指的是来存放软件包和软件包之间的依赖关系地方。

#### ① yum工具安装rpm包

```powershell
# yum -y install 软件包名
# yum -y groupinstall "包组名"
注意：
1.其中，-y选项表示取消交互
2.包组里面包含很多的软件包。
```

#### ② yum工具卸载rpm包

```powershell
# yum -y remove 软件包名
# yum -y groupremove "包组名"
```

#### ③ yum工具升级rpm包

```powershell
# yum update 软件包名
```

#### ④ yum工具其他相关选项

```powershell
# yum list				列出仓库里的软件包
# yum repolist			列出可用仓库
# yum clean all			清空yum缓存
# yum makecache 		创建yum缓存
```

# 四、源码安装

## ㈠ 根据需求配置

```powershell
--prefix=... Directories to put files in /usr/local 软件家目录
--bindir=... $prefix/bin 	命令的目录
--etcdir=... $prefix/etc 	配置文件的目录
--mandir=... $prefix/share/man man	文档路径
--locale=... $prefix/share/locale 	语言编码
...
```

## ㈡ 编译

```powershell
make	（使用gcc编译器进行编译）
```

## ㈢ 安装

```powershell
make install 类似 rpm -ivh
```

## ㈣ 源码安装示例

### 1、 安装需求

1. 将==axel软件==安装到/opt/axel目录下
2. 安装好后可以正常使用

### 2、安装步骤

#### ① 下载软件并解压

```powershell
[root@localhost soft]# tar xf axel-1.0a.tar.gz 
[root@localhost soft]# ls
axel-1.0a  axel-1.0a.tar.gz
```

#### ② 进入到解压目录进行安装

```powershell
[root@localhost soft]# cd axel-1.0a
[root@localhost axel-1.0a]# ls
```



##### 1）根据需求配置

```powershell
[root@localhost axel-1.0a]# ./configure --prefix=/opt/axel
```

##### 2）编译

```powershell
[root@localhost axel-1.0a]# make
```

##### 3）安装

```powershell
[root@localhost axel-1.0a]# make install

确认成功安装：
[root@localhost axel-1.0a]# ls /opt/axel/
bin  etc  share
[root@localhost axel-1.0a]# ls /opt/axel/bin/
axel
```

### 3、测试使用

```powershell
使用axel下载文件：
[root@localhost axel]# axel http://mirrors.163.com/centos/6/os/x86_64/RPM-GPG-KEY-CentOS-6
-bash: axel: command not found
```

- ==分析错误产生的可能原因==
  1. 命令没有安装
  2. ==命令安装了但是找不到==
     原因：命令安装了但是不能找到，原因是不知道去/opt/axel/bin目录里找。
     说明：系统中有==PATH==环境变量，该变量里保存的是命令的路径，只要PATH中有命令的所在路径，就可以找到。
  3. 命令敲错了
- 解决问题

```powershell
查看当前系统默认的环境变量：
[root@localhost axel-1.0a]# echo $PATH
/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
将axel命令临时添加到环境变量中：
[root@localhost axel-1.0a]# export PATH=$PATH:/opt/axel/bin
[root@localhost axel-1.0a]# echo $PATH
/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/opt/axel/bin

永久添加到环境变量：
[root@localhost axel-1.0a]# vi /etc/profile
在文件最后增加如下内容：
export PATH=$PATH:/opt/axel/bin

重新读取配置文件：
[root@localhost axel-1.0a]# source /etc/profile
```

- 再次测试使用

```powershell
再次下载——>成功
[root@localhost axel-1.0a]# axel http://mirrors.163.com/centos/6/os/x86_64/RPM-GPG-KEY-CentOS-6
Initializing download: http://mirrors.163.com/centos/6/os/x86_64/RPM-GPG-KEY-CentOS-6
File size: 1706 bytes
Opening output file RPM-GPG-KEY-CentOS-6
Starting download
```

- man手册后续配置（可选）

```powershell
查看axel更详细的帮助：
[root@localhost axel]# man axel
No manual entry for axel
原因：找不到指定的man文档

解决：
[root@localhost axel]# vim /etc/man.config
...
增加如下内容：
MANPATH /opt/axel/share/man
```

### 4、源码卸载软件

```powershell
进入到解压包目录里：
[root@localhost axel-1.0a]# make uninstall		//卸载安装
rm -f /opt/axel/bin/axel
rm -f /opt/axel/etc/axelrc
rm -f /opt/axel/share/man/man1/axel.1
[root@localhost axel-1.0a]# make distclean		//卸载编译和配置过程
rm -f *.o axel search core *.mo
rm -f Makefile.settings config.h
```



[^编译]: 编译，就是通过编译工具，把高级语言变成计算机可以识别的2进制语言，计算机只认识1和0。编译程序，就是使用编译工具，把高级语言开发的程序变成计算机可以识别的二进制程序。