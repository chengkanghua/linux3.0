[02Linux基础命令 (yuque.com)](https://www.yuque.com/chengkanghua/linux3.0/basecmd)

## 4、切换用户

基本语法：

```powershell
# su - root
Password:123456
[root@localhost ~]# 切换成功
```

> 扩展：-横杠作用是什么？答：-横杠代表切换用户的同时，切换用户的家目录

## 5、uname命令

主要功能：获取计算机操作系统相关信息

基本语法：

```powershell
# uname -a
选项说明：
-a ：all缩写，代表显示所有信息，获取全部的系统信息（类型、全部主机名、内核版本、发布时间、开源计划）
```

## 6、ls命令

### ☆ 用法一

主要功能：ls完整写法list show，以平铺的形式显示当前目录下的文件信息

基本语法：

```powershell
# ls
```

### ☆ 用法二

主要功能：显示其他目录下的文件信息

```powershell
# ls 其他目录的绝对路径或相对路径
```

> 扩展：ls后面跟的路径既可以是绝对路径也可以是相对路径

**绝对路径**：不管当前工作路径是在哪，==目标路径都会从“/”磁盘根下开始==。
案例：访问itheima用户的家目录，查看有哪些文件

```powershell
# ls /home/itheima
```

<font color="red">绝对路径必须以左斜杠开头，一级一级向下访问，不能越级</font>



**相对路径**：除绝对路径之外的路径称之为相对路径，相对路径得有一个相对物（当前工作路径）。

只要看到路径以“/”开头则表示该路径是绝对路径，除了以“/”开头的路径称之为相对路径。

当前位置：/home/itheima目录下

../：表示上级目录（上一级）

./ ：表示当前目录（同级），普通文件./可以省略，可执行文件（绿色）必须加./

文件夹名称/：表示下级目录（下一级），注意这个斜杠/

### ☆ 用法三

基本语法：

```powershell
# ls [选项] [路径]
选项说明：
-l ：ls -l，代表以详细列表的形式显示当前或其他目录下的文件信息(简写命令=>ll)
-h ：ls -lh，通常与-l结合一起使用，代表以较高的可读性显示文件的大小(kb/mb/gb)
-a ：ls -a，a是all缩写，代表显示所有文件（也包含隐藏文件=>大部分以.开头）
```

计算机中的单位：

```powershell
# 1TB = 1024GB
# 1GB = 1024MB
# 1MB = 1024KB
# 1KB（千字节） = 1024B（字节）
```

## 7、pwd命令

主要功能：pwd=print working directory，打印当前工作目录（告诉我们，我们当前位置）

基本语法：

 ```powershell
# pwd
 ```

## 8、cd命令

主要功能：cd全称change directory，切换目录（从一个目录跳转到另外一个目录）

基本语法：

```powershell
# cd [路径]
选项说明：
路径既可以是绝对路径，也可以是相对路径
```

案例一：切换到/usr/local这个程序目录

```powershell
# cd /usr/local
```

案例二：比如我们当前在/home/itheima下，切换到根目录/下

```powershell
# cd /home/itheima
# cd ../../
```

案例三：当我们在某个路径下，如何快速回到自己的家目录

```powershell
# cd
或
# cd ~
```

## 9、clear命令

主要功能：清屏

基本语法：

```powershell
# clear
```

## 10、reboot命令

主要功能：立即重启计算机

基本语法：

```powershell
# reboot
```

## 11、shutdown命令

主要功能：立即关机或延迟关机

立即关机基本语法：

```powershell
# shutdown -h 0或now
# shutdown -h 0
# shutdown -h now
选项说明：
-h ：halt缩写，代表关机
```

> 在Linux系统中，立即关机除了使用shutdown -h 0以外还可以使用halt -p命令

延迟关机基本语法：

```powershell
# shutdown -h 分钟数
代表多少分钟后，自动关机
```

案例1：10分钟后自动关机

```powershell
# shutdown -h 10
```

案例2：后悔了，取消关机

```powershell
光标一直不停的闪，取消关机
# 按Ctrl + C（CentOS6，中断关机。CentOS7中还需要使用shutdown -c命令）
# shutdown -c
```

## 12、type命令

主要功能：主要用来结合help命令，用于判断命令的类型（属于内部命令还是外部命令）

基本语法：

```powershell
# type 命令
内部命令：命令 is a shell builtin
外部命令：没有显示以上信息的就是外部命令
```

## 13、history命令

主要功能：显示系统以前输入的前1000条命令

基本语法：

```powershell
# history
```

## 14、hostnamectl命令

主要功能：用于设置计算机的主机名称（给计算机起个名字），此命令式CentOS7新增的命令。

hostnamectl ： hostname + control

### ☆ 获取计算机的主机名称

```powershell
# hostname	CentOS6
# hostnamectl  CentOS7
```

### ☆ 设置计算机的主机名称

Centos7中主机名分3类，静态的（static）、瞬态的（transient）、和灵活的（pretty）。

① 静态static主机名称：电脑关机或重启后，设置的名称亦然有效

② 瞬态transient主机名称：临时主机名称，电脑关机或重启后，设置的名称就失效了

③ 灵活pretty主机名称：可以包含一些特殊字符

CentOS 7中和主机名有关的文件为/etc/hostname，它是在系统初始化的时候被读取的，并且内核根据它的内容设置瞬态主机名。

> 更改主机名称，让其永久生效？① 使用静态的 ② 改/etc/hostname文件

#### ① 瞬态主机名称（临时设置）

```powershell
# hostnamectl --transient set-hostname 主机名称
主机名称 建议遵循 FQDN协议（功能+公司域名）
web01.itcast.cn
web02.itcast.cn
```

案例：临时设置主机名称为yunwei.itcast.cn

```powershell
# hostnamectl --transient set-hostname yunwei.itcast.cn
# su 立即生效
```

#### ② 静态主机名称（永久生效）

```powershell
# hostnamectl --static set-hostname 主机名称
温馨提示：--static也可以省略不写
```

案例：把计算机的主机名称永久设置为yunwei.itcast.cn

```powershell
# hostnamectl --static set-hostname yunwei.itcast.cn
# su 立即生效
```

#### ③ 灵活主机名称（主机名称可以添加特殊字符）

```powershell
# hostnamectl --pretty set-hostname 主机名称（包含特殊字符）
```

案例：把计算机的主机名称通过灵活设置，设置为yunwei's server01

```powershell
# hostnamectl --pretty set-hostname "yunwei's server01"
查看灵活的主机名称
# hostnamectl --pretty
```

