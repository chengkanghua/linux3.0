# Linux文件管理（上）

# 学习目标

1、了解文件命名规则和工作中的建议命名规则
2、会创建和删除目录mkdir/rmdir
3、会创建和删除文件touch/rm
4、了解复制cp和移动mv的区别会使用tar命令进行压缩和解压缩
5、掌握VIM的保存退出wq和不保存强制退出q!掌握VIM的快捷键yy,dd,gg,G,u
6、会使用tail命令查看文件
7、会使用find命令按文件名称查找文件

# 一、文件命名规则

## 1、可以使用哪些字符？

​        ==除了字符“/”之外，所有的字符都可以使用==，但是要注意，在目录名或文件名中，不建议使用某些特殊字符，例如， <、>、？、* 等，尽量避免使用。
​        如果一个文件名中包含了特殊字符，例如空格，那么在访问这个文件时就需要使用引号将文件名括起来。

建议文件命名规则：   

​        由于linux严格区分大小写，所以==尽量都用小写字母==

​        如果必须==对文件名进行分割，建议使用"_"==，例如：itheima_bj_2020.log

a.txt

001.txt

002.txt

tongxunlu.txt

tongxunlu_bj_caiwu.txt

## 2、文件名的长度

​        目录名或文件名的长度不能超过 255 个字符



## 3、Linux文件名大小写

​        Linux目录名或文件名是区分大小写的。如 itheima、ITheima、yunwei 和 Yunwei ，是互不相同的目录名或文件名。
​        不要使用字符大小写来区分不同的文件或目录。
​        建议文件名==一律使用小写字母==



## 4、Linux文件扩展名

​        Linux文件的扩展名对 Linux 操作系统没有特殊的含义，Linux 系统并不以文件的扩展名开分区文件类型。例如，itheima.exe 只是一个文件，其扩展名 .exe 并不代表此文件就一定是可执行的。
​        在Linux系统中，文件扩展名的用途为了==使运维人员更好的区分不同的文件类型==。
​        



# 二、文件管理命令

​        在日常工作中，我们经常需要对Linux的文件或目录进行操作，常见操作包括新建，删除，更改，查看，复制，移动等。

## 1、目录创建/删除

在实际应用中，与目录相关的操作主要有两个：创建目录与删除目录

### ① mkdir创建目录

命令： mkdir  (make directory，创建目录)

作用：创建目录

语法：#mkdir [参数选项] 路径（包含目录名）

常见参数：

-p：递归创建所有目录,如果想创建多层不存在的路径，可以使用-p参数实现。-p表示parents，父级的意思

```powershell
用法一：mkdir 不加参数，路径（需要包含目录名称）
示例代码：
#mkdir /usr/local/nginx
含义：在/usr/local目录下，创建一个文件夹名为nginx
特别注意：mkdir命令默认不能隔级创建目录，必须要求要创建的目录所在的目录一定要存在
```





```powershell
用法二：mkdir 加-p参数，路径（需要包含目录名称）
示例代码：
#mkdir -p /usr/local/itheima/tomcat
含义：在/usr/local目录下，同时创建itheima文件夹和itheima下的子文件夹tomcat
```



错误信息：cannot create directory '/usr/local/itheima/tomcat':No such file or directory
含义：不能建立目录'XXX'：没有文件或文件夹

问题：为什么会有这个错误信息？

答：





```powershell
用法三：mkdir 路径1 路径2 路径3
示例代码：
#mkdir /usr/local/a /usr/local/b /usr/local/c
含义：在/usr/local目录下，同时创建a,b,c文件夹
```





### mkdir命令总结

```powershell
#mkdir /mydata     在根目录下建立mydata文件夹

#mkdir -p /itcast/tbd      一次性建立多级文件夹/itcast/tbd

#mkdir /tbd /jinyanlong /shunyi    
```

问题：一台刚刚安装好的Centos系统，小明想建立/xiaoming/zuoye/shuxue，应该使用mkdir还是mkdir -p?

答案A  mkdir

答案B  mkdir -p



### ② 删除目录

命令： rmdir（remove directory缩写）

作用：删除==空==目录

语法：#rmdir [参数选项] 路径（包含目录名）

常见参数：

-p：递归删除所有空目录



```powershell
用法一：rmdir 不加参数，路径（需要包含目录名称）
示例代码：
#rmdir /usr/local/nginx
含义：删除/usr/local下的空目录nginx
```





```powershell
用法二：rmdir 路径1 路径2 路径3
示例代码：
#rmdir /usr/local/a /usr/local/b /usr/local/c
含义：同时删除a,b,c三个空目录
```





```powershell
用法三：rmdir -p 路径（需要包含目录名称）
示例代码：
#rmdir -p itheima/tomcat
含义：递归删除目录，删除tomcat和itheima目录
首先删除子目录，删除成功后，删除上级目录，直至结束。
```



问题：rmdir -p itheima/tomcat 中，“itheima/tomcat”是绝对路径还是相对路径？

答：A 绝对

​       B ==相对==



错误信息：rmdir: failed to remove directory ‘/usr/local/itheima’: Directory not empty

含义：





### rmdir命令总结

```powershell
#rmdir /itcast    删除根目录下的itcast目录

#rmdir /itcast /jinyanlong /shunyi    同时删除根目录下的itcast jinyanlong hunyi

#rmdir -p /itcast/heima   一次性删除heima和他的上级目录itcast
```



问题：能不能使用绝对路径rmdir -p /usr/local/itheima/tomcat ? 为什么？

答：



## 2、文件创建/删除

在实际应用中，与文件相关的操作主要有两个：创建文件与删除文件

### ① 创建文件

命令：touch

作用：创建文件

语法：# touch  文件路径    [文件路径2    文件路径3 …]

```powershell
用法一：touch 路径（包含文件名）
示例代码：
#touch readme.txt
含义：在当前路径下创建一个文件 readme.txt
```





```powershell
用法二：touch 路径1（包含文件名） 路径2（包含文件名） 路径3（包含文件名） 
示例代码：
#touch 1.txt 2.txt 3.txt
含义：在当前路径下创建1.txt 2.txt 3.txt三个文件
```







```powershell
用法三（了解）：touch 路径1（包含文件名）{1..n}
示例代码：
#touch {1..5}.txt
含义：在当前路径下创建1.txt 2.txt 3.txt 4.txt 5.txt三个文件
其中
1表示开始的数字
..表示连续的
5表示结束的数字
```







### touch命令总结

```powershell
#touch readme.txt    在 当前 目录下创建文件

#touch /readme.txt    在  根目录  下创建文件

#touch 1.txt 2.txt 3.txt    在 当前 同时创建 1.txt 2.txt 3.txt

#touch /usr/local/1.txt /usr/local/2.txt /usr/local/3.txt
在/usr/local下创建1.txt 2.txt 3.txt


#touch /usr/local/1.txt 2.txt 3.txt


#touch {1..6}.log
在对当前目录下，创建 1到6.txt
1.txt 2.txt 3.txt 4.txt 5.txt 6.txt

```



思考题

```powershell
#cd /usr

#touch /usr/local/a.txt b.txt c.txt

问题：执行以上两条命令后，请列出a.txt,b.txt,c.txt的绝对路径
```







### ② 删除文件

命令：rm（remove缩写）

作用：删除文件或文件夹

语法：rm   [参数选项]    文件或文件夹

选项：-r ：递归删除，主要用于删除目录，可删除指定目录及包含的所有内容，包括所有子目录和文件

​	    -f  ：强制删除，不提示任何信息。操作前一定要慎重！！！

```powershell
用法一：rm 路径（包含文件名）
示例代码：
#rm readme.txt
含义：删除当前路径下文件 readme.txt
```



提示信息：remove regular empty file 'readme.txt' ?
含义：是否要删除普通的空文件'readme.txt'？



```powershell
用法二：rm -r 路径（通常为目录名）
示例代码：
#rm -r itheima
含义：删除当前文件夹下的itheima文件夹及其包含的所有子文件夹/文件
```





提示信息：descend into directory 'itheima/'?
含义：是否进入itheima目录？

提示信息：remvoe directory 'itheima/'?
含义：是否删除itheima文件夹？



```powershell
用法三：rm -rf 路径（通常为目录名）
示例代码：
#rm -rf itheima
含义：强制删除当前文件夹下的itheima文件夹及其包含的所有子文件夹/文件
```





### rm命令总结

```powershell
#rm readme.txt    带确认的删除文件

#rm -r shop     带确认的删除目录

#rm -rf shop     不带确认删除目录及其所有子目录和文件
```

问题：rm -r /usr/local/itheima/  是否会删除itheima的父文件夹local？



答：A克隆

​       B快照

安全性和易用性



## 3、复制与剪切

### ① 复制操作

命令：cp (copy缩写，复制操作)

作用：复制文件/文件夹到指定的位置

语法：#cp  [参数选项]   源路径（含文件名）  目标路径（如不指定文件名，则文件名不变）

常见参数：-r：recursion，递归，用于复制目录



```powershell
用法一：cp 源路径 目标路径（不指定文件名）
示例代码：
#cp /root/itheima.txt /usr/local/
含义：将/root目录下的itheima.txt文件拷贝到/usr/local下，文件名不变
```





```powershell
用法二：cp 源路径 目标路径（指定文件名）
示例代码：
#cp /root/itheima.txt /usr/local/heimayunwei.txt
含义：将/root目录下的itheima.txt文件拷贝到/usr/local下，重命名为heimayunwei.txt
```





```powershell
用法三：cp -r 源路径（包含目录名） 目标路径
示例代码：
#cp -r /root/chuanzhiboke /usr/local/
含义：将/root目录下的chuanzhiboke目录完整拷贝到/usr/local下
```



### cp命令总结

```powershell
#cp readme.txt /usr/local/  当前目录下的readme.txt 拷贝到/usr/local下

#cp readme.txt /usr/local/readme.txt   

#cp readme.txt /usr/local/readhis.txt   

#cp readme.txt readme.aaa   

#cp -r /root/chuanzhiboke /usr/local/   
```



问题：小明在/root下面建立了一个文件，叫做xiaoming.txt，小明想把这个文件拷贝到/usr/local下，文件名不变，应该用什么命令？文件名变成xiaohong.txt，用什么命令

答：



### ② 剪切操作

命令：mv （move，移动，剪切）

作用：可以在不同的目录之间==移动==文件或目录，也可以对文件和目录进行==重命名==

语法：#mv [参数] 源文件 目标路径（不指定文件名）

​    

```powershell
mv与cp的区别：
☆ mv 与 cp 命令不一样，不管是针对文件还是针对文件夹都不需要加类似 -r 的选项。
☆ 默认在移动的过程中文档名称名称是不变的，变的是路径
```



```powershell
用法一：mv 源文件 目标路径（不指定文件名）
示例代码：
#mv readme.txt /usr/local/
含义：将当前目录下的readme.txt文件移动到/usr/local下，文件名不变
```





```powershell
用法二：mv 源目录 目标路径（不指定目录名）
示例代码：
#mv shop /usr/local/
含义：将当前目录下的shop目录移动到/usr/local下，目录名不变
```





### ③ 重命名操作

命令：mv （move，移动，剪切）

语法：#mv [参数] 源文件 目标路径（指定文件名）

```powershell
用法三：mv 当前文件名 新文件名
示例代码：
#mv itheima.txt heimacxy.txt
含义：将当前目录下的itheima.txt文件重命名成 heimacxy.txt
前面我们说过，默认情况下文件名称不变，但如果我们指定目标文件名称，就变成了重命名操作。
```





```powershell
用法四：mv 当前目录名 新目录名
示例代码：
#mv shop shopping
含义：将当前目录下的shop目录重命名成 shopping
```



​        在Linux 中重命名的命令也是mv，语法和移动语法一样。区别在于重命名的话一般是路径不变，名称改变。而移动是名字不变，路径变。



### mv命令总结

```powershell
#mv readme.txt /tmp/      移动 当前 目录下的readme.txt 到 /tmp目录下，文件名不变

#mv /root/shop /tmp    移动root目录下的 shop目录 到 /tmp目录下

#mv hello.txt readme.txt     

#mv /root/shop1 /usr/local/shop2   
```



新建目录的时候，不要加点，或者说，不要建立一个类似 shop.txt这样的目录





## 4、tar打包压缩与解压缩

​    **打包**，指的是一个文件或目录的集合，而这个集合被存储在一个文件中。归档文件没有经过压缩，占用的空间是其中**所有文件和目录的总和**。

1.txt     5MB

2.txt     10MB

3.txt      20MB

123.tar      35MB

​    **压缩**文件也是一个文件和目录的集合，且这个集合也被存储在一个文件中，但它们的不同之处在于，压缩文件所占用的磁盘空间**比集合中所有文件大小的总和要小。**

 123.tar.gz   不是35MB，是压缩后的大小。



#### 1）打包

命令：tar

作用：将多个文件打包成一个文件

语法：tar  选项   打包文件名    要打包的文件或目录

常见参数：-c，create 创建的意思

​	           -v，显示打包文件过程

​	           -f，指定打包的文件名，此参数是必须加的。

​	           -u，update缩写，更新原打包文件中的文件（了解）

​	           -t，查看打包的文件内容（了解）

注意：

​        在使用 tar 命令指定选项时可以不在选项前面输入“-”。例如，使用“cvf”选项和 “-cvf”起到的作用一样。

​        使用 tar 命令归档的包通常称为 tar 包（tar 包文件都是以“.tar”结尾的）。

.tar给谁看的？

A centos

B 运维人员



```powershell
用法一：tar -cvf 文件名 文件1 文件2 文件3  
示例代码：
#tar -cvf abc.tar a.txt b.txt c.txt
含义：将当前目录下的a.txt b.txt c.txt 打包成abc.tar文件，大小是三个文件的总合
重点掌握CVF就可以了
```





```powershell
用法二：tar -uf 现有包文件名 要追加的文件
示例代码：
#tar -uf abc.tar d.txt
含义：将当前目录下的d.txt 追加到abc.tar文件，大小是四个文件的总合
```





```powershell
用法三：tar -tf 包文件名
示例代码：
#tar -tf abc.tar
含义：查看abc.tar文件内容
```





#### 2）打包并压缩（重点）

​        Linux下，常用的压缩工具有很多，比如 gzip、zip、bzip2、xz 等

​        tar 在打包的时候，是支持压缩的，gzip 、bzip2 、xz 压缩工具都可以在 tar 打包文件中使用。

命令：tar

作用：将多个文件打包并压缩成一个文件，==其实就是tar命令的三个压缩参数==

语法：tar  选项   打包文件名    要压缩的文件或目录==

常见参数：==-z，压缩为.gz格式==

​	           ==-j，压缩为.bz2格式==

​	           ==-J，压缩为.xz格式==

​	           -c，create 创建的意思

​                   ==-x，解压缩==

​	           -v，显示打包文件过程

​	           -f，file指定打包的文件名，此参数是必须加的。

​	           -u，update缩写，更新原打包文件中的文件（了解）

​	           -t，查看打包的文件内容（了解）

替换c

替换f      

注意：此处打包后的文件名叫做 abc.tar.gz，其中.gz表示使用gzip压缩的tar文件，目的是方便运维人员识别文件



```powershell
用法二：tar -jcvf 文件名 文件1 文件2 文件3
示例代码：
#tar -jcvf abc.tar.bz2 a.txt b.txt c.txt
含义：将当前目录下的a.txt b.txt c.txt 使用bz2压缩打包成abc.tar.bz2文件，是压缩后的大小
```





```powershell
用法三：tar -Jcvf 文件名 文件1 文件2 文件3
示例代码：
#tar -Jcvf abc.tar.xz a.txt b.txt c.txt
含义：将当前目录下的a.txt b.txt c.txt 使用xz压缩打包成abc.tar.xz文件，是压缩后的大小
```





注意：bz2,gzip,xz三种工具的压缩比不同，实际工作中最常用的是gzip，换句话说，大家==最常见到的压缩打包文件是 .tar.gz==



### 3）解压

解压的时候，把压缩命令中的 ==c== 换成 ==x== 即可

```powershell
用法一：tar -zxvf 文件名
示例代码：
#tar -zxvf abc.tar.gz
含义：将abc.tar.gz文件，解压缩

用法二：tar -jxvf 文件名
示例代码：
#tar -jxvf abc.tar.bz2
含义：将abc.tar.bz2文件，解压缩

用法三：tar -Jxvf 文件名
示例代码：
#tar -Jxvf abc.tar.xz
含义：将abc.tar.xz文件，解压缩

```



通用解压缩参数(记住这个)

```powershell
用法四：tar -xvf 文件名
示例代码：
#tar -xvf abc.tar.xz
含义：系统将自动识别压缩格式，并自动选择相应工具，解压缩
```





思考题：

如果我把abc.tar.gz 文件名改成abc.tar.1

tar -xvf abc.tar.1

能不能正确的解压缩





## 5、zip压缩与解压缩（了解）

#### 1）zip压缩

命令：zip

作用：兼容类unix与windows，可以压缩多个文件或目录

语法：# zip   [参数] 压缩后的文件   需要压缩的文件(可以是多个文件)

参数选项：-r 递归压缩（压缩文件夹）

> 注意：zip压缩默认压缩后的格式就是.zip，当然也可以加后缀.zip，一般都加上



==用法一：文件压缩==

```powershell
用法一：zip 压缩后的文件名 要压缩的文件（一个或多个）
示例代码：
#zip 1.zip 1.txt
含义：将1.txt 压缩成1.zip

#zip 1dao4.zip 1.txt 2.txt 3.txt 4.txt
含义：将1.txt,2.txt,3.txt,4.txt四个文件压缩成一个1dao4.zip文件

# zip readme.zip readme.txt
```



==用法二：文件夹压缩==

```BASH
# zip -r shop.zip shop
```



#### 2）unzip解压缩

命令：unzip

作用：解压文件

语法：unzip   要解压的压缩文件   [-d]   解压目录

选项：-d，directory缩写，代表解压文件到指定目录下

==用法一：解压到当前目录==

```bash
# unzip readme.zip
```



==用法二：解压到指定目录==

```bash
unzip shop.zip -d /tmp/
```





### zip命令总结



zip是压缩

unzip是解压缩

```powershell
#zip 3.zip 3.txt

#unzip 3.zip

#unzip 3.zip -d /tmp/
```





# 三、VIM文件编辑器概述

​        Vim文本编辑器，是由 vi 发展演变过来的文本编辑器，使用简单、功能强大、是 Linux 众多发行版的默认文本编辑器

## 1、vi编辑器

​		 vi（visual editor）编辑器通常被简称为vi，它是Linux和Unix系统上最基本的文本编辑器，类似于Windows 系统下的notepad（记事本）编辑器。

## 2、vi与Vim编辑器

​        Vim(Vi improved)是vi编辑器的加强版，比vi更容易使用。vi的命令几乎全部都可以在vim上使用。



## 3、Vim编辑器安装

​        Centos通常都已经默认安装好了 vi 或 Vim 文本编辑器

​        当命令行中输入“Vim”显示如下 所示的画面时，视为 Vim 安装成功



​        如果在命令行模式下输入“vim”，输出结果为“Command not found”，则表示此系统中未安装 Vim。



错误信息：command not found...

含义：找不到这条命令，通常表示没有安装这条命令或者可能敲错了命令



​        如果没有安装，可通过以下命令进行安装

```powershell
#yum install vim
```

​        后面会详细介绍关于yum的使用，这里大家默认都已经安装了vim。



## 4、Vim编辑器四种工作模式



Vim 中存在四种模式：

​        命令模式
​        编辑模式（输入/插入模式）
​        可视化模式
​        末行模式（尾行模式）

​        ①命令模式：使用VIM编辑器时，==默认处于命令模式。==在该模式下可以移动光标位置，可以通过==快捷键==对文件==内容==进行复制、粘贴、删除等操作。

​        ②编辑模式：在该模式下可以对文件的内容进行编辑

​        ③末行模式：可以在==末行输入命令==来对文件进行查找、替换、保存、退出等操作

​        ④可视化模式：可以做一些列选操作

**四种模式之间的关系：**

![image-20221114221923317](03Linux文件管理(上).assets/image-20221114221923317.png)

# 四、Vim使用

## 1、Vim打开文件

命令：vim

作用：编辑文件

语法：vim  文件名

```powershell
用法一：vim 文件名
示例代码：
#vim 1.txt
含义：用vim编辑器，打开1.txt文件，如果1.txt文件不存在，则新建一个空文件1.txt,保存退出编辑器时会自动创建这个文件
```



## 2、Vim保存文件并退出

​        在任何模式下，都可以按两下ESC回到命令模式，在命令模式输入:wq 按回车键



## 3、Vim不保存文件并退出

​          在任何模式下，都可以按两下ESC回到命令模式，在命令模式输入:q! 按回车键



## 4、Vim命令模式操作（重点）

### 4.1、进入命令模式

问：如何进入命令模式？

答：



### 4.2、光标快速移动操作

#### ☆ 光标移动到首与尾

光标移动到文件第一行的行首，按键：`gg`

光标移动到文件最后一行的行首，按键：G [Capslk 再加 G 键] / [Shift + G 键]



#vim /var/log/boot.log-20200219





#### ☆ 翻屏

向上    翻屏，按键：`ctrl + b （before） 或 PgUp`

向下    翻屏，按键：`ctrl + f （after）  或 PgDn`

向上翻半屏，按键：`ctrl + u （up）`

向下翻半屏，按键：`ctrl + d （down）`

#### ☆ 快速定位到指定行（重点）

数字 + G

150G

注意：常用于错误定位



#vim /var/log/boot.log-20200219



### 4.3、复制

① 复制光标所在行

按键：yy

粘贴：在想要粘贴的地方按下p 键【将粘贴在光标所在行的下一行】,如果想粘贴在光标所在行之前，则使用P键

② 以光标所在行为准（包含当前行），向下复制指定的行数

按键：数字yy，如5yy





### 4.4、剪切/删除

① 剪切/删除光标所在行

按键：dd （删除之后下一行上移）

注意：dd 严格意义上说是剪切命令，但是如果剪切了不粘贴就是删除的效果。

② 剪切/删除光标所在行为准（包含当前行），向下删除/剪切指定的行

按键：数字dd （删除之后下一行上移）

③ 剪切/删除光标所在的当前行（光标所在位置）之后的内容，但是删除之后下一行不上移

按键：D （删除之后当前行会变成空白行）



### 4.5、撤销/恢复

撤销：u（undo）

恢复：ctrl + r 恢复（取消）之前的撤销操作【重做，redo】



## 5、Vim末行模式操作（重点）

#### 5.1、进入末行模式

进入方式：由命令模式进入，按下`:`或者`/`（表示查找）即可进入末行模式

退出方式：

① 按下Esc键

② 连按 2 次Esc键

③ 删除末行全部输入字符

那末行模式有哪些作用？我们能使用末行模式做什么呢？

### 5.2、末行模式相关功能

#### ① 保存操作（write）

输入：`:w`  保存文件  （了解）

输入：`:w 路径` 另存为（了解）



#### ② 退出（quit）

输入：`:q` 退出文件（了解）

默认情况下，退出的时候需要对已经进行修改的文件进行保存`:w`，然后才能退出



#### ③ 保存并退出（掌握，常用）

输入：`:wq` 保存并且退出



#### ④ 强制（!）（掌握，常用）

输入：`:q!` 表示强制退出，刚才做的修改操作不做保存

备注：以后我们在更改系统配置文件时，很多时候不想保存之前的更改，甚至我们只想查看，没想更改。这时候一律使用q!退出，可以保证我们的文件不被误更改



#### ⑤ 搜索/查找

输入：`/关键词`，再按下回车 【按下/也是进入末行模式的方式之一】

在搜索结果中切换上/下一个结果：N/n （大写N代表上一个结果，小写n代表next）

如果需要取消高亮，则需要在末行模式中输入：`:noh`【no highlight】



#### ⑥替换（了解）

通常在修改配置文件的时候，我个人很少使用批量替换，避免替换了一些自己不知道的内容

`:s/搜索的关键词/新的内容` 			替换==光标所在行==的第一处符合条件的内容(只替换1次)





`:s/搜索的关键词/新的内容/g` 		替换==光标所在行==的全部符合条件的内容





`:%s/搜索的关键词/新的内容` 	       替换==整个文档中每行==第一个符合条件的内容





`:%s/搜索的关键词/新的内容/g`		替换==整个文档中所有==符合条件的内容





#### ⑦ 显示行号

输入：`:set nu`，nu代表number



如果想取消显示，则输入：`:set nonu`



#### ⑧ set paste与set nopaste（了解）

为什么要使用paste模式？

问题：在终端Vim中粘贴代码时，发现插入的代码会有多余的缩进，而且会逐行累加。原因是终端把粘贴的文本存入键盘缓存（Keyboard Buffer）中，Vim则把这些内容作为用户的键盘输入来处理。导致在遇到换行符的时候，如果Vim开启了自动缩进，就会默认的把上一行缩进插入到下一行的开头，最终使代码变乱。

在粘贴数据之前，输入下面命令开启paste模式
:set paste

粘贴完毕后，输入下面命令关闭paste模式
:set nopaste



## 6、编辑模式操作

### 6.1进入和退出编辑模式

​        按字母i进入编辑模式，按ESC键退出编辑模式，回到命令模式

​        





## 7、可视化模式下复制

按键：ctrl + v（可视块）或V（可视行）或v（可视），然后按下↑  ↓  ←  →方向键来选中需要

复制的区块，按下y 键进行复制（不要按下yy），最后按下p 键粘贴

退出可视模式按下Esc

### 1）.添加多行注释：（重点）

A 每行前面都加#

B 把所有行都删了





步骤1：首先按esc进入命令行模式下，按下Ctrl + v，进入列（也叫区块）模式;

![image-20221114222333338](03Linux文件管理(上).assets/image-20221114222333338.png)

步骤2：在行首使用上下键选择需要注释的多行;

![image-20221114222342393](03Linux文件管理(上).assets/image-20221114222342393.png)



步骤3：按下键盘（大写）“I”键，进入插入模式；

![image-20221114222404801](03Linux文件管理(上).assets/image-20221114222404801.png)



步骤4：然后输入注释符（“#”）;

![image-20221114222436056](03Linux文件管理(上).assets/image-20221114222436056.png)





步骤5：最后按 两下“Esc”键。

![image-20221114222455970](03Linux文件管理(上).assets/image-20221114222455970.png)







### 2）.删除多行注释：（重点）

步骤1：首先按esc进入命令行模式下，按下Ctrl + v, 进入列模式;

步骤2：选定要取消注释的多行的第一列

![image-20221114222516929](03Linux文件管理(上).assets/image-20221114222516929.png)

步骤3：按del键即可









## 8、Vim的一些实用功能

### 8.1、代码着色

之前说过vim 是vi 的升级版本，其中比较典型的区别就是vim 更加适合coding，因为vim比vi 多一个代码着色的功能，这个功能主要是为程序员提供编程语言升的语法显示效果，如下：

```powershell
#vim index.php
在文件中添加以下内容：

<?php
    echo 'hello world';
?>

末行模式输入:syntax off和syntax on可看到效果
```





在实际应用中，我们如何控制着色显示与否？

> syntax：语法，临时调整

开启显示：`:syntax on`

关闭显示：`:syntax off`



### 8.2、异常退出（重点）

什么是异常退出：在编辑文件之后并没有正常的去wq（保存退出），而是遇到突然关闭终端或者断电的情况，则会显示下面的效果，这个情况称之为异常退出：



==解决办法：将交换文件（在编程过程中产生的临时文件）删除掉即可【在上述提示界面按下D 键，或者使用rm 指令删除交换文件】==

```bash
# rm -rf .1.php.swp
```





### 8.3、退出方式

回顾：在vim中，退出正在编辑的文件可以使用`:q`或者`:wq`

除了上面的这个语法之外，vim 还支持另外一个保存退出(针对内容)方法`:x`

说明：

① `:x`在文件没有修改的情况下，表示直接退出（等价于:q），在文件修改的情况下表

示保存并退出（:wq）

② 如果文件没有被修改，但是使用wq 进行退出的话，则文件的修改时间会被更新；但是如果文件没有被修改，使用x 进行退出的话，则文件修改时间不会被更新的；主要是会混淆用户对文件的修改时间的认定。



问：我们该用x还是wq或者q!退出编辑器？

答：

A   X

B   WQ/Q!







# Linux文件管理(下)

# 一、文本处理命令

## 1、查看文件内容

### ①cat查看及合并

命令：cat

作用：查看文件内容

语法：#cat  文件名称

​            #cat 文件1 文件2 > 文件3

```powershell
用法一：cat 文件名
示例代码：
#cat 1.txt
含义：显示1.txt文件的内容
特别注意：cat 命令用于查看文件内容时，不论文件内容有多少，都会一次性显示。如果文件非常大，那么文件开头的内容就看不到了。cat 命令适合查看不太大的文件。
```



```powershell
用法二：cat 文件1 文件2 > 文件3
示例代码：
#cat 1.txt 2.txt > 3.txt
含义：将1.txt和2.txt文件内容合并后，输出到3.txt
```





### ②more分屏显示文件

命令：more

作用：分屏查看文件

语法：#more  文件名

==流程：more在读取文件时，默认已经加载文件的全部内容。==

```powershell
用法一：more 文件名
示例代码：
#more /var/log/boot.log
含义：分页显示/var/log/boot.log文件的内容
```



more 命令的执行会打开一个交互界面，下面是一些常用交互命令：

| 回车键   | 向下移动一行。               |
| -------- | ---------------------------- |
| d        | 向下移动半页。               |
| 空格键   | 向下移动一页。               |
| b        | 向上移动一页。               |
| / 字符串 | 搜索指定的字符串。           |
| :f       | 显示当前文件的文件名和行号。 |
| q 或 Q   | 退出   more。                |





### ③less分屏显示文件

命令：less

作用：分屏查看文件

语法：# less  文件名

==流程：不是加载整个文件，而是一点一点进行加载，相对而言，读取大文件时，效率比较高。==

示例代码：使用less命令查看/var/log/boot.log的文件内容



```powershell
用法一：less 文件名
示例代码：
#less /var/log/boot.log
含义：分页显示/var/log/boot.log文件的内容
```



less 命令的执行也会打开一个交互界面，下面是一些常用交互命令（和more相同）：

| 回车键   | 向下移动一行。               |
| -------- | ---------------------------- |
| d        | 向下移动半页。               |
| 空格键   | 向下移动一页。               |
| b        | 向上移动一页。               |
| / 字符串 | 搜索指定的字符串。           |
| :f       | 显示当前文件的文件名和行号。 |
| q 或 Q   | 退出   more。                |



cat,more,less三者的对比

|            | cat                  | more                   | less                   |
| ---------- | -------------------- | ---------------------- | ---------------------- |
| 作用       | 显示小文件(一屏以内) | 显示大文件（超过一屏） | 显示大文件（超过一屏） |
| 交互命令   | 无                   | 有                     | 有                     |
| 上下键翻行 | 无                   | 无                     | 有                     |





### ④head显示文件开头

命令：head

作用：查看一个文件的前n 行，如果不指定n，则默认显示前10 行。

语法：#head  [参数选项]   文件名

常见参数：-n  表示显示前n行的内容，n等于行数

```powershell
用法一：head 文件名
示例代码：
#head /var/log/boot.log
含义：显示/var/log/boot.log文件的内容，默认为前10行

用法二：head -n 文件名
示例代码：
#head -3 /var/log/boot.log
含义：显示/var/log/boot.log文件的前3行内容
```





### ⑤tail显示文件结尾（重点）



命令：tail

作用：查看一个文件的最后n 行，如果n 不指定默认显示最后10 行

语法：# tail   -n   文件路径 【n 表示数字】

常见参数：-n  显示最后n行的内容，n等于行数

​                    -f  输出文件变化后新增加的数据

```powershell
用法一：tail 文件名
示例代码：
#tail /var/log/boot.log
含义：显示/var/log/boot.log文件的内容，默认为最后10行

用法二：tail -n 文件名
示例代码：
#tail -5 /var/log/boot.log
含义：显示/var/log/boot.log文件的最后5行内容
```



```powershell
用法二：tail -f 文件名
示例代码：
#tail -f /var/log/messages
含义：显示/var/log/messages文件中，执行tail -f 命令后，新增的数据。
注意：作用相当于查看一个文件动态变化的内容，一般用于查看系统的日志的变化
     按下ctrl+c可以退出查看状态
```



注意：ctrl+c 键，在命令行中c 不再表示copy，而表示cancel（取消），在程序执行过程中，==通常都可以使用ctrl+c来终止程序运行或者退出程序==



## 2、统计文件信息

### ①wc统计文件内容数量

命令：wc，wc = word count

作用：用于统计文件内容信息（包含行数、单词数、字节数）

语法：# wc   [参数选项]   文件名

常见参数：

-l：表示lines，行数（以回车/换行符为标准）

-w：表示words，单词数 依照空格来判断单词数量

-c：表示bytes，   字节数（空格，回车，换行）

```powershell
用法一：wc -lwc 文件名
示例代码：
#wc -lwc /var/log/boot.log
含义：统计/var/log/boot.log文件的行数，单词数，字节数
注意：wc命令选项可以混在一起搭配使用，但选项的顺序不影响输出结果，第一个是行数，第二个是单词数，第三个数字节数。
```



### ②du统计文件大小

命令：du

作用：查看文件或目录(会递归显示子目录)占用磁盘空间大小

语法：# du  [参数选项]  文件名或目录名

常见参数：-s ：summaries，只显示汇总的大小，统计文件夹的大小

​        	   -h：表示以高可读性的形式进行显示，如果不写-h，默认以KB的形式显示文件大小



```powershell
用法一：du 文件名
示例代码：
#du /var/log/boot.log
含义：统计/var/log/boot.log文件的大小

用法二：du -h 文件名
示例代码：
#du -h /var/log/boot.log
含义：统计/var/log/boot.log文件的大小,以高可读性显示
```



示例代码：统计 /var/log 目录大小

```powershell
用法三：du 目录名
示例代码：
#du /var/log/
含义：统计/var/log/目录的大小，包含目录下每一个单独文件的大小

用法四：du -s 目录名
示例代码：
#du -s /var/log/
含义：统计/var/log/boot.log文件的大小,汇总只显示目录大小

用法五：du -sh 目录名
示例代码：
#du -sh /var/log/
含义：统计/var/log/boot.log文件的大小,汇总只显示目录大小,并采用高可读性
```





## 3、文本处理

### ①find文件查找（重点）

命令：find

作用：用于查找文档（其选项有55 个之多）

语法：# find  路径范围 选项1 选项1的值  [选项2  选项2 的值…]

常用参数：

-name：按照文档名称进行搜索（支持模糊搜索）

> \* ： 通配符，匹配任意个任意字符

-type：按照文档的类型进行搜索，文档类型的值，f（file)表示文件，d(directory)表示文件夹





```powershell
用法一：find 路径范围 选项1 选项1的值 选项2 选项2的值
示例代码：
#find /var/ -name boot.log -type f
含义：在/var/目录下，查找名称等于boot.log，类型是文件的文档
```





A var表示要查找的目录名字

B var表示，在var目录内查找



```powershell
用法二：find 路径范围 选项1 选项1的值使用通配符 选项2 选项2的值
示例代码：
#find /var/log -name "*.log" -type f
含义：在/var/log目录下，查找所有.log结尾，类型是文件的文档，*.log需要用引号引起来。
```





```powershell
用法一：find 路径范围 选项1 选项1的值
示例代码：
#find /var/log -type d
含义：在/var/log目录下，查找所有文件夹
```





### ②grep搜索文件内容 （重要） 

命令：grep

作用：在文件中直接找到包含指定信息的那些行，并把这些信息显示出来

语法：#grep 要查找的内容 文件名

```powershell
用法一：grep 查找的内容 文件名
示例代码：
#grep network boot.log
含义：在boot.log文件中，查找包含network的行
```





```powershell
用法二：grep 查找的内容 多个文件
示例代码：
#grep network /var/log/*
含义：在/var/log目录下的所有文件中，查找包含network的行
```





### ③输出重定向

场景：一般命令的输出都会显示在终端中，有些时候需要将一些命令的执行结果想要保存到文件中进行后续的分析/统计，则这时候需要使用到的输出重定向技术。

\>：标准输出重定向 :覆盖输出，会覆盖掉原先的文件内容

\>>：追加重定向 :追加输出，不会覆盖原始文件内容，会在原始内容末尾继续添加

语法：#有输出的命令 重定向符号 文件名

```powershell
用法一：使用 > 进行覆盖输出
示例代码：
#ll > llroot.txt
含义：将ll命令输出的内容，写入到llroot.txt文件中，如果llroot.txt文件中有其他内容，则先清空，在写入
注意：文件路径中的文件可以是不存在的文件，例如llroot.txt可以不存在，执行命令时会自动创建这个文件
```





```powershell
用法二：使用 >> 进行追加输出
示例代码：
#ll >> llroot.txt
含义：将ll命令输出的内容，追加写入到llroot.txt文件中
注意：文件路径中的文件可以是不存在的文件，例如llroot.txt可以不存在，执行命令时会自动创建这个文件
```



