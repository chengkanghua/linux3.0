typora-copy-images-to: ./media
# 运维概述与Linux系统安装
# 学习目标
1、了解运维的基本概念
2、了解企业的运行模式
3、了解操作系统发展史以及作用
4、掌握虚拟机软件安装
5、新建虚拟机以及CentOS系统安装
# 一、运维概述
## 1、运维岗位收入情况（职友集）
数据来源：[职友集](https://www.jobui.com/salary/?cityKw=%E5%8C%97%E4%BA%AC&jobKw=%E8%BF%90%E7%BB%B4)
## 2、运维岗位的定义
**什么是运维？**
在技术人员（写代码的）之间，一致对运维有一个开玩笑的认知：运维就是修电脑的、装网线的、背锅的岗位。
**IT运维管理**是指为了保障企业IT系统及网络的可用性、安全性、稳定性，保障业务的连续性，通过专业技术手段，对计算机网络、应用系统、电信网络、软硬件环境及运维服务流程等进行的综合管理。
随着企业数字化转型升级进程加快，企业IT系统架构越来越复杂，软件更新迭代越来越快。企业信息化建设使得大量业务和数据需要依靠信息系统来完成，稳定可用的IT系统是企业业务发展的基础条件，IT运维管理随之成为企业信息化建设的重要环节。
近年来，因为IT系统突然出现故障导致业务瘫痪甚至造成巨额损失的现象频出不穷。而大型数据中心由于对系统、数据的高度依赖，IT风险更大，对IT运维管理的重视也就更高。
运维领域经常看到的技术及概念
**1）云计算架构**
云计算 = 公有云(阿里云、百度云、华为云) + 私有云（OpenStack） + 混合云
云服务器是由云服务厂商提供的性能卓越、稳定可靠、弹性扩展的IaaS（Infrastructure as a Service）级别云计算服务。云服务器免去了采购IT硬件的前期准备，让企业像使用水、电、天然气等公共资源一样便捷、高效地使用服务器，实现计算资源的即开即用和弹性伸缩。
**2） DevOps运维开发工程师** DevOps（Development和Operations的组合词），它是一组过程、方法与系统的统称，主要用于促进开发和运营保障团队之间的协作与沟通，从而提高应用程序和服务的交付响应速度。 大概6:4 = 6运维:4开发（Python/Go）
DevOps把原本独立的开发和运营工作融合到一起，运营团队时刻了解开发人员的进展，并与他们形成互动，共同监控IT业务进展。在运维方面，DevOps可以打通从需求到结果运行的所有环节，以提高业务价值为目标
**3） AIOps** 2016年，Gartner提出利用AI技术的新一代IT运维，即AIOps（智能运维），可以解决未来企业可能遭遇的因IT故障而导致的业务中断，AIOps是ITOM的升级和进步，它结合了大数据和机器算法、机器学习技术，通过海量信息的搜集和处理，发现、预测、解决故障，进一步推动了IT运维自动化，减少了人力成本。
**4）CI/CD** CI/CD 是一种通过在应用开发阶段引入自动化来频繁向客户交付应用的方法。CI/CD 的核心概念是持续集成、持续交付和持续部署。作为一个面向开发和运营团队的解决方案，CI/CD 主要针对在集成新代码时所引发的问题
**5）Docker容器化技术** Docker 是一个开源的应用容器引擎，通常包括客户端、守护进程、镜像、容器，让开发者可以打包他们的应用以及依赖包到一个可移植的镜像中，再发布出去。类似于一个集装箱，可以把货物规整的摆放起来。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411221973-108e11b0-f7a5-4052-a7a4-8a8790f3548a.png#averageHue=%2394c361&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=793&id=u6b6f60b5&margin=%5Bobject%20Object%5D&name=image.png&originHeight=793&originWidth=792&originalType=binary&ratio=1&rotation=0&showTitle=false&size=552680&status=done&style=none&taskId=u6fea6908-894c-4c3c-b1f7-60010522445&title=&width=792)
## 3、运维的诞生
从最早的网管开始，九十年代初期，互联网欠发达的时候，还少有服务器的概念，电脑价格昂贵，大多数人并不具备在家上网的条件，网吧应运而生。
早期计算机没有硬盘=>软驱=>软盘，1万多块钱 = 8-10万
网吧的电脑、猫等设备需要进行日常维护，于是“网管”岗位应运而生，这就是早期运维的雏形。
## 4、90年代初网吧图
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411241343-3a94d067-33c9-4562-ad71-c0823b68b570.png#averageHue=%23f9f8f8&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=489&id=ud2009581&margin=%5Bobject%20Object%5D&name=image.png&originHeight=489&originWidth=788&originalType=binary&ratio=1&rotation=0&showTitle=false&size=116662&status=done&style=none&taskId=u17693e83-fd4a-4234-8ef6-7707f2e7900&title=&width=788)
## 5、运维行业背景
① 从行业角度来看，随着==中国互联网的高速发展(BAT)==、网站规模越来越来大、架构越来越复杂，对专职网站运维工程师、网站架构师的要求会越来越急迫，特别是对有经验的优秀运维人才需求量大，而且是越老越值钱。
② 从个人角度，运维工程师技术含量及要求会越来越高，同时也是对公司应用、架构最了解最熟悉的人，==越来越得到重视==。
③ 运维工作的相关经验将会变得非常重要，而且也将成为个人的核心竞争力，==优秀的运维工程师具备很好的各层面问题的解决能力及方案提供、全局思考的能力等==。
④ 由于运维岗位所接触的知识面非常广阔，==更容易培养或发挥出个人某些方面的特长或爱好==，如内核、网络、开发、数据库等方面，可以做得非常深入精通、成为这方面的专家。
⑤ ==当前国内外对运维人才的需求非常迫切，运维工程师的薪资也水涨船高==，与研发、测试等技术部门持平，甚至超出。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411258551-9d1ba0dd-90cf-4eda-8100-6003ad4552ea.png#averageHue=%23f4f4f4&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=649&id=u11c278f3&margin=%5Bobject%20Object%5D&name=image.png&originHeight=649&originWidth=851&originalType=binary&ratio=1&rotation=0&showTitle=false&size=70471&status=done&style=none&taskId=ud479f0fc-caaa-4306-9efe-3769bf31231&title=&width=851)
# 二、企业运行模式
## 1、铁三角
==铁三角 = 产品 + 研发 + 运维==
流程走向：产品设计 → 项目研发 → 项目测试 → 项目上线 → 系统运维
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411273615-dc03f1c0-a662-46ef-a218-651693418270.png#averageHue=%23c3e4a8&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=727&id=uca15f026&margin=%5Bobject%20Object%5D&name=image.png&originHeight=727&originWidth=734&originalType=binary&ratio=1&rotation=0&showTitle=false&size=181453&status=done&style=none&taskId=u51ceee99-5d56-45d1-bb53-66fff2ed5d3&title=&width=734)
研发 = 前端（HTML+CSS+JavaScript） + 后端（Java/Python/Go）
运维：产品上线、后期的运行与维护工作都属于运维工程师范畴
## 2、部门与部门职责 
产品部门（PM、UI、UE，3-5 个）：设计产品的需求，确定需要做的项目的功能和细节问题
研发部门（5-7 个）：根据产品部门/测试部门提供的项目模块需求进行编程
测试部门（2 个左右即可）：对于研发部门提供的代码进行运行测试，检查是否存在bug和一些需要改善的体验
运维部门（3-4 个）：负责项目环境部署、上线、架构的搭建等等
## 3、上线与生产
成熟企业中的系统环境：
开发环境： 根据系统要求，设计和搭建系统环境
测试环境：搭建系统环境，实现自动化发布
准生产环境：搭建系统环境，沟通第三方厂商，自动化发布，监控
生产环境：搭建系统环境，沟通第三方厂商，自动化发布，监控，发起持续改进
**上线**：发布项目的过程，包含准生产上线，生产上线等。内测/公测 → 开服
**生产**：正式提供对外服务的环境，叫生产环境，需要运维重点关注。
在项目的从无到有的过程中，可以将其分为两个阶段：研发/测试阶段、生产运行阶段。
运维工作贯穿了开发，测试，生产的各个阶段，是其中重要的一环。
## 4、网站的概念
简单地说，网站是一种沟通工具，人们可以通过网站来发布自己想要公开的资讯，或者利用网站来提供相关的网络服务。人们可以通过网页浏览器来访问网站，获取自己需要的资讯或者享受网络服务。
网站开发 = 前端开发 + 后端开发（ASP/PHP/JSP）
```

扩展：了解网站的分类
根据网站所用编程语言分类：例如ASP/PHP/JSP网站等；
根据网站的用途分类：例如门户网站、行业网站、娱乐网站等
根据网站的功能分类：例如单一网站（企业网站）、多功能网站（网络商城）等
根据网站的持有者分类：例如个人网站、商业网站、政府网站、教育网站等
根据网站的商业目的分类：营利型网站（企业/行业网站）、非营利性型网站（政府网站/教育网站）
根据网站的面向终端的分类：Web网站（电脑端或PC端）和 WAP网站（手机端）
```
## 5、网站运行模式（重点）
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411316124-2697d23e-4791-4fe8-be52-55f74ee610a6.png#averageHue=%23fcfaf5&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=495&id=uc311cfd7&margin=%5Bobject%20Object%5D&name=image.png&originHeight=495&originWidth=786&originalType=binary&ratio=1&rotation=0&showTitle=false&size=161474&status=done&style=none&taskId=u4caa2b83-3475-46e7-962b-e5c6c4e6883&title=&width=786)
DNS 作用：将域名转换成IP 地址。
从上图中可以看出如果一个网站项目需要正常的运行，则需要的前提条件有：
① 域名（方便用户记忆）
② 需要对域名和ip 的关系进行关联（DNS 服务器）
③ 服务器
④ 服务器的项目运行环境
## 6、几个重要概念
### **① 服务器**
就是给用户提供服务的机器（电脑）。服务器可以分为四大类：塔式服务器、机式服务器、刀片服务器、柜式服务器。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411333670-f2f5cf0d-687d-42d8-921d-f0e714946ecc.png#averageHue=%23d3d1cc&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=189&id=u16bf844c&margin=%5Bobject%20Object%5D&name=image.png&originHeight=189&originWidth=817&originalType=binary&ratio=1&rotation=0&showTitle=false&size=141989&status=done&style=none&taskId=u78f9304d-c577-4798-888b-13da18affa7&title=&width=817)
#### 问题一：普通台式机/笔记本能否充当服务器来使用？
标准的回答：如果从提供服务的实现角度来考虑的话的确是可以，但是如果要想稳定、高效的提供服务，则在这个角度考虑家用电脑和笔记就无法取代服务器地位。
家用台式机/笔记本从系统角度来看，一般都会使用Windows 系统（易用），并不适合作为服务器来使用。
家用台式机/笔记本硬件和专门的服务器相比标准不统一。
#### 问题二：服务器有哪些特性？
高性能特性 + 标准化统一特性。
### **② IP地址**
形式ipv4（常见）、ipv6（不考虑）。Ipv4 形式：x.x.x.x，x 有取值范围（第1 位x取值1-223，从第二位开始0-255）。由于资源有限为了保证全球这么多台电脑都可以使用，ip 可以分为公网/外网ip 和私网/内网ip 地址。
0.0.0.0，表示任意地方，anywhere...
### **③ 域名**
就是在浏览器地址栏中输入的那一串字母和数字的组合，例如：[www.baidu.com](https://www.baidu.com)，这个就是域名，域名主要是方便用户记忆。
问：[www.baidu.com](https://www.baidu.com) 这个域名是几级的域名？二级域名，看域名的级别只要看有几个"."，日常所说的注册域名指的是注册顶级域名（一级）】
额外购买：中国万网（已经被阿里云收购），域名属于有限资源，先买先得（按年付费）
### **④ 公网**
www（万维网），全世界都可以互相访问的网。 
### **⑤ 局域网**
局域网/内网/私网：在某个单元内部（家庭/教室/公司）能够进行互相访问的网络，红色警戒游戏对战平台。
## 7、服务器的重要结构组成
家用电脑组成： CPU、主板、内存条、显卡、硬盘、电源、风扇、网卡、显示器、机箱、键盘鼠标等等。
### 1）CPU
CPU是电脑的大脑，如下图所示：
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411362443-6b145402-80ee-4286-98a5-09c2b916e2eb.png#averageHue=%23a79e94&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=435&id=u0e606076&margin=%5Bobject%20Object%5D&name=image.png&originHeight=435&originWidth=554&originalType=binary&ratio=1&rotation=0&showTitle=false&size=385629&status=done&style=none&taskId=uae6a67b4-d1b3-49a4-90dc-87f7bf37f67&title=&width=554)
CPU发展史：
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411373172-f00f981c-cde4-4d3e-9756-3a11a159aa00.png#averageHue=%23f7f6f5&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=419&id=u854f172a&margin=%5Bobject%20Object%5D&name=image.png&originHeight=419&originWidth=838&originalType=binary&ratio=1&rotation=0&showTitle=false&size=238432&status=done&style=none&taskId=ued183123-e308-42cb-ab81-008b7d50a05&title=&width=838)
32 位CPU：最大的内存寻址地址2^32，大约4G的大小。
CPU很傻，只认识0和1
32位的CPU，其支持的内存最大值 = 2的32次方 ≈ 3.80G，大约4G的大小
64位的CPU，其支持的内存最大值 = 2的64次方
> 聊聊2的32次方怎么算？
> 1T = 1024GB 1GB = 1024MB 1MB = 1024KB 1KB = 1024B
> 2^32B = 2^32 /1024/1024 /1024 = 4GB

CPU i3、i5、i7、i9、志强系列（移动工作站或者企业级服务器），现在买计算机，看CPU还要看几代的。i5，十代U
### 2）内存
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411448487-47f785f2-44b0-451d-9793-801552d4901a.png#averageHue=%2330653a&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=519&id=uca2e2299&margin=%5Bobject%20Object%5D&name=image.png&originHeight=519&originWidth=806&originalType=binary&ratio=1&rotation=0&showTitle=false&size=722980&status=done&style=none&taskId=ua9b349e3-6185-4e2f-a8dd-493eb8d3801&title=&width=806)
内存也是电脑必需组件之一。
计算机是一个商铺：CPU相当于人，内存相当于仓库。商品必须上架才能显示。
### 3）风扇
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411456760-0fe88b9a-d103-40c0-a6a9-497a423726be.png#averageHue=%23787c81&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=536&id=u956be551&margin=%5Bobject%20Object%5D&name=image.png&originHeight=536&originWidth=798&originalType=binary&ratio=1&rotation=0&showTitle=false&size=618965&status=done&style=none&taskId=u04c89890-338b-4987-99bc-1ccf501172a&title=&width=798)
### 4）电源
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411466960-2cb2c388-3ad1-4908-bb68-3e29a7335478.png#averageHue=%233a3b3f&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=451&id=u09947080&margin=%5Bobject%20Object%5D&name=image.png&originHeight=451&originWidth=688&originalType=binary&ratio=1&rotation=0&showTitle=false&size=237691&status=done&style=none&taskId=ub26a1605-1f19-4c5d-a0f0-9ebe9496fcb&title=&width=688)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411481566-c4b425e4-ccd9-4470-9458-19651be9b75a.png#averageHue=%236e7071&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=468&id=u6eba2b02&margin=%5Bobject%20Object%5D&name=image.png&originHeight=468&originWidth=803&originalType=binary&ratio=1&rotation=0&showTitle=false&size=324018&status=done&style=none&taskId=uabf6c040-8a8f-4343-8282-63a77a600af&title=&width=803)
### 5）硬盘
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411491260-e4b39088-29e1-43d7-a411-967654f61d1f.png#averageHue=%23bbbcc1&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=495&id=u7b18b224&margin=%5Bobject%20Object%5D&name=image.png&originHeight=495&originWidth=781&originalType=binary&ratio=1&rotation=0&showTitle=false&size=521403&status=done&style=none&taskId=ue1d9700c-aa35-41a6-b0b5-e33faf61664&title=&width=781)
硬盘的作用：存储数据。
硬盘可以分为机械硬盘、固态硬盘。
机械硬盘与固态硬盘的区别？
① 速度：固态硬盘更快，不受转速影响
② 安全性：机械硬盘的安全性较高，即使损坏了，也有80%以上的恢复概率
企业级固态硬盘（安全性也有所提高）
扩展：固态硬盘（价格千差万别，因为使用的芯片不一样）
QLC(很差) < TLC(一般) < MLC(最好)，芯片不同有何影响
一方面是速度不一样，另外一方面安全性和寿命不同
### 6）主板
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411501030-be3b51a1-9604-42c0-afbe-2f6b5d8b2954.png#averageHue=%233f6561&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=587&id=u0df4f0c0&margin=%5Bobject%20Object%5D&name=image.png&originHeight=587&originWidth=787&originalType=binary&ratio=1&rotation=0&showTitle=false&size=929300&status=done&style=none&taskId=u1e1151dc-b29b-48b1-9fd3-ae8fd5cc817&title=&width=787)
主要的作用：
自身包含了一些集成电路，负责各个不同的功能和数据通信。
主板上有很多空的插槽，插槽的作用在于扩展外部的硬件设备。
# 三、操作系统概述
## 1、计算机发展史
第一台计算机是1946 年2 月14 日诞生日，第一台名称ENIAC。体积一间屋子的大小，重量高达28t。
第一代：1946 – 1958 => 12 年 （电子管）
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411513460-ec0efedc-f941-4a39-831c-a054ccdf9fb3.png#averageHue=%23646364&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=678&id=u6a6e4c5f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=678&originWidth=793&originalType=binary&ratio=1&rotation=0&showTitle=false&size=787801&status=done&style=none&taskId=uc3109f64-ac18-411b-9b1b-2a5b292b092&title=&width=793)
第二代：1958 – 1964 => 6 年 （晶体管）
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411519922-7ac65b84-37c9-4170-9b0b-cb952f6f1828.png#averageHue=%23787778&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=441&id=u33fdf28f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=441&originWidth=804&originalType=binary&ratio=1&rotation=0&showTitle=false&size=487083&status=done&style=none&taskId=ub5ba2cda-3baa-4bc0-8a11-8fbe39e9ec3&title=&width=804)
第三代：1964 – 1970 => 6 年 （集成电路）
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411526742-4e5651be-9a38-462a-b4a9-61263388f6c5.png#averageHue=%23747374&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=599&id=u72dd0b07&margin=%5Bobject%20Object%5D&name=image.png&originHeight=599&originWidth=806&originalType=binary&ratio=1&rotation=0&showTitle=false&size=623379&status=done&style=none&taskId=u27833e9e-b38e-48e9-aa1e-1a63bf67833&title=&width=806)
第四代：1970 – 至今 （大规模集成电路）
## 2、计算机组成
CPU、内存、风扇、硬盘、显示器、主板、电源、声卡、网卡、显卡、鼠标、键盘等
## 3、计算机资源（重点）
计算机资源分为2 部分：==硬件资源、软件资源==
硬件：一般硬件是指计算机的物理组成，由==真实（看得见，摸得着）==的设备组成的
软件：软件==一般是指应用程序==，应用程序程序是由开发人员去按照编程语言的特定的规则去
编写的程序。除了上述的应用程序之外，==操作系统也属于软件资源的范畴，它属特殊的软件==。
问题：为什么在打开一个应用程序之后（吃鸡游戏），当玩家在敲击键盘和移动鼠标的时候里
面人物会有对应的行为表现呢？
答：用户敲击键盘/移动鼠标（硬件操作） → 硬件的驱动（软件资源） → 操作系统（软件） → 硬件支持（cpu） → 操作系统（软件） → 驱动（显卡驱动） → 显示在屏幕上（硬件）
所以由此可知，==操作系统==是软件资源与硬件资源之间的桥梁。
## 4、操作系统
常见操作系统有：==Windows、MacOS、Unix/Linux==。 类UNIX
Windows：其是微软公司研发的收费操作系统（闭源）。
Windows 系统体系分为两类：用户操作系统、Server 操作系统。
用户操作系统：win 95、win 98、win NT、win Me、win xp、vista、win7、win8、win10。
MacOS：==其是由苹果公司开发的一款收费（变相收费，买电脑送系统）操作系统==。该系统从
终端角度来看分为：watch OS、IOS、MacOS。其表现突出的地方：底层优化实现的很好、安全性要更加高点（闭源）。
Linux：==Linux 是目前全球使用量最多的服务器操作系统（开源）==。其体系很强大，其分支有很多（数不胜数），其目前主要的分支有：RedHat（红帽）、CentOS、Debian、乌班图（ubuntu）
等等。其在世界范围最大的使用分支是安卓。
闭源：不开放源代码，用户是没有办法看到软件的底层实现（闭源≠收费）。
开源：表示开放源代码（开源≠免费）。
## 5、为什么需要Linux操作系统
问题：windows 既然可以使用傻瓜式的方式进行操作，例如使用ctrl+c 表示复制，ctrl+v 表示粘贴等，为什么还需要使用/学习Linux 系统？
① 性能问题，Windows 服务器操作系统不如Linux 高；
② 稳定性问题：
底层架构：Linux 更加稳定，其开机时间可以达到好几年不关机；
开源：因为开源，人人都可以看到源代码，就可以为其提供自己的补丁，补丁可以提高稳定性和安全性；
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411549361-38dfb0c3-de25-440a-aec7-2cfb18a6b857.png#averageHue=%2317129b&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=433&id=u030c6df3&margin=%5Bobject%20Object%5D&name=image.png&originHeight=433&originWidth=794&originalType=binary&ratio=1&rotation=0&showTitle=false&size=436651&status=done&style=none&taskId=uc0736648-f72a-40c1-95d3-e7620248af4&title=&width=794)
③ 安全性问题：
Linux 操作系统，相对于Windows 操作系统要更加安全；
④ 远程管理方面：
Windows 不及Linux 操作高效。
⑤ 服务器价格昂贵的，需要对资源进行充分利用，充分把计算机资源用到项目上（访问并发、性能），而不是把资源浪费在图形化界面或者方便程度上；
# 四、Linux发展史
## 1、Linux 起源
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411561276-36cbcd7f-7c45-48b8-b943-17923bd7c312.png#averageHue=%23f4fafb&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=330&id=u7958b78f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=330&originWidth=827&originalType=binary&ratio=1&rotation=0&showTitle=false&size=383802&status=done&style=none&taskId=u097d24b0-8e17-4938-ae64-28e24f20cb4&title=&width=827)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411567920-a8aedb50-c62d-4f41-b7c9-dde3860e49a6.png#averageHue=%238f9ba8&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=483&id=u3ff7f581&margin=%5Bobject%20Object%5D&name=image.png&originHeight=483&originWidth=820&originalType=binary&ratio=1&rotation=0&showTitle=false&size=626189&status=done&style=none&taskId=u3f6ad093-5eb5-467a-b1c6-30b02d0a5c8&title=&width=820)
**Linus(林纳斯·托瓦兹)**：Linux 的开发作者，被称为Linux 之父，Linux 诞生时是芬兰赫尔辛基大学的在校大学生。**Stallman 斯特曼**：开源文化的倡导人。
## 2、Linux 的含义
狭义：由Linus 编写的一段内核代码。
广义：广义上的Linux 是指由Linux内核衍生的各种Linux发行版本。（CentOS、Ubuntu）
注意：以后提及到的Linux 都是广义上的Linux
## 3、Linux特点
开放性（开源）、多用户、多任务、良好的用户界面、优异的性能与稳定性
多用户多任务：
单用户：一个用户，在登录计算机（操作系统），只能允许同时登录一个用户；
单任务：一个任务，允许用户同时进行的操作任务数量；
多用户：多个用户，在登录计算机（操作系统），允许同时登录多个用户进行操作；
多任务：多个任务，允许用户同时进行多个操作任务；
Windows 属于：单用户、多任务。
而Linux系统则属于：多用户、多任务。
## 4、Linux分支(Linux衍生版：Linux厂商基于Linux内核)
分支：Linux 分支有很多，现在比较有名的redhat、ubuntu、debian、centos（Community Enterprise Operating System）、suse 等等。
redhat红帽（redhat企业版、centos社区版）、ubuntu（乌班图）、debian、suse
中国Linux系统：红旗（Redflag）、麒麟、深度OS（推荐，和Windows基本一致）
XP操作系统（番茄家园、雨林木风xp.com、深度家园）=> Linux操作系统
CentOS7.6
# 五、Linux系统安装
## 1、Linux系统安装方式
目前安装操作系统方式有2 种：真机安装、虚拟机安装。
真机安装：使用真实的电脑进行安装，像安装windows 操作系统一样，真机安装的结果就是替换掉当前的windows 操作系统；（缺点：对系统进行格式化，重新安装）
虚拟机安装：通过一些特定的手段，来进行模拟安装，并不会影响当前计算机的真实操作系统；
如果是学习或者测试使用，强烈建议使用虚拟机安装方式。
## 2、虚拟机概念
什么是虚拟机？
虚拟机，有些时候想模拟出一个真实的电脑环境，碍于使用真机安装代价太大，因此而诞生的一款可以模拟操作系统运行的软件。
虚拟机目前有2 个比较有名的产品：==vmware 出品的vmware workstation==、oracle 出品的virtual Box。
## 3、虚拟机的安装
第一步：双击打开VMware安装程序
第二步：进行下一步安装

第三步：同意许可协议，单击下一步

第四步：根据需要决定是否需要更改软件的安装位置（建议放置于除C盘以外任意盘符下）
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411607229-ed9459f3-5d37-49e1-8096-be5a772ce176.png#averageHue=%23f1eff1&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=621&id=ua7f95278&margin=%5Bobject%20Object%5D&name=image.png&originHeight=621&originWidth=813&originalType=binary&ratio=1&rotation=0&showTitle=false&size=264777&status=done&style=none&taskId=u0510116e-2fb3-4b1f-975a-fcd811d4e42&title=&width=813)
第五步：更改成功后，单击确定，下一步继续安装：
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411617994-42607cf2-6e8e-4536-abaa-68dc3a600873.png#averageHue=%23e9e8ea&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=623&id=u0532a25d&margin=%5Bobject%20Object%5D&name=image.png&originHeight=623&originWidth=804&originalType=binary&ratio=1&rotation=0&showTitle=false&size=301240&status=done&style=none&taskId=u81e60eab-52ea-4624-9283-3a4ad60380f&title=&width=804)
注意：所有软件的安装目录最好在安装的时候是空的
第六步：用户体验设置，如下图所示，单击下一步继续安装
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411626087-777293d6-733f-4595-8773-054f4f3499bb.png#averageHue=%23e9e7e9&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=626&id=ue18f2a45&margin=%5Bobject%20Object%5D&name=image.png&originHeight=626&originWidth=802&originalType=binary&ratio=1&rotation=0&showTitle=false&size=309492&status=done&style=none&taskId=ucdfc08e6-7551-44c2-bdf2-ba160159099&title=&width=802)
第七步：快捷方式设置，单击下一步继续安装
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411633376-b3426578-5606-4b60-8d47-e077cd2367cc.png#averageHue=%23eceaec&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=620&id=u409b498f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=620&originWidth=803&originalType=binary&ratio=1&rotation=0&showTitle=false&size=224824&status=done&style=none&taskId=u69c56fb7-0873-4cb2-a1a4-24e2c23d402&title=&width=803)
第八步：单击安装按钮
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411641172-38ff357d-d35f-454b-951f-a7f2c1c31a95.png#averageHue=%23ebeae9&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=610&id=u26801f25&margin=%5Bobject%20Object%5D&name=image.png&originHeight=610&originWidth=797&originalType=binary&ratio=1&rotation=0&showTitle=false&size=170067&status=done&style=none&taskId=uf60c51bb-d128-494d-bd7c-98dc9ba9ea4&title=&width=797)
第九步：安装结束后，单击完成按钮

==注意事项：最重要的地方，在安装完之后需要检查，检查虚拟机软件是否有安装2 个虚拟网卡==
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411662479-470a43f0-448f-472f-887c-c032f4830117.png#averageHue=%23c6d9ef&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=112&id=uf1685c1d&margin=%5Bobject%20Object%5D&name=image.png&originHeight=112&originWidth=808&originalType=binary&ratio=1&rotation=0&showTitle=false&size=93137&status=done&style=none&taskId=u12368c1b-f301-4d51-8706-3777450ab2d&title=&width=808)
Windows7与Windows10可能显示网络名称有所不同，但是底部虚拟机网络是一致的。
## 4、Linux系统环境部署
Linux系统版本选择：CentOS7.6 x64，【镜像一般都是CentOS*.iso文件】
问题：为什么不选择最新版的8 版本？
7.x 目前依然是主流
7.x 的各种系统操作模式是基础
官网：[https://www.centos.org/](https://www.centos.org/) ，从官网下载得到的镜像文件：
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411674306-edb420c7-9d07-43fa-9f49-cba6a8e6d7df.png#averageHue=%23d7d7d7&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=387&id=ub69c05ce&margin=%5Bobject%20Object%5D&name=image.png&originHeight=387&originWidth=809&originalType=binary&ratio=1&rotation=0&showTitle=false&size=117861&status=done&style=none&taskId=u84e2656f-0b24-4a6a-8fcb-4e256ea1a5a&title=&width=809)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411686174-9442a09d-4b87-445c-a76e-2aec5a15e787.png#averageHue=%23f9f9f9&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=201&id=u1a284806&margin=%5Bobject%20Object%5D&name=image.png&originHeight=201&originWidth=816&originalType=binary&ratio=1&rotation=0&showTitle=false&size=94355&status=done&style=none&taskId=u7af4ebf8-8347-48e1-95ab-392b0f577fb&title=&width=816)Centos7.6版本下载地址：
[http://vault.centos.org/7.6.1810/isos/x86_64/CentOS-7-x86_64-Everything-1810.iso](http://vault.centos.org/7.6.1810/isos/x86_64/CentOS-7-x86_64-Everything-1810.iso)
第一步：新建虚拟机，点击=="文件"==菜单，选择=="新建虚拟"==选项，选择=="自定义"==点击下一步：
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411695041-272ef7e4-55c1-405e-b8b3-922c06e65369.png#averageHue=%23c4c8c4&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=685&id=ue080d408&margin=%5Bobject%20Object%5D&name=image.png&originHeight=685&originWidth=806&originalType=binary&ratio=1&rotation=0&showTitle=false&size=298336&status=done&style=none&taskId=ub1a80f9f-f11a-4150-8784-c117c64a4e4&title=&width=806)
第二步：选择兼容性，默认即可，单击下一步：
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411709381-37d84544-2ce8-4e11-a4c7-4bd5f32a590c.png#averageHue=%23e8e7e7&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=693&id=u59d1f58f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=693&originWidth=809&originalType=binary&ratio=1&rotation=0&showTitle=false&size=220488&status=done&style=none&taskId=u4c52aa82-04dd-40f6-a4a9-fff3dc01a11&title=&width=809)
第三步：选择镜像文件的时候选择“稍后安装操作系统”，点击下一步
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411775644-cea8713b-1e01-4c7d-9c60-f7639c36ac21.png#averageHue=%23e7e7e7&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=669&id=u712db535&margin=%5Bobject%20Object%5D&name=image.png&originHeight=669&originWidth=805&originalType=binary&ratio=1&rotation=0&showTitle=false&size=167949&status=done&style=none&taskId=ue032955b-0125-455f-b0a7-275cd0f28b8&title=&width=805)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411786656-12773a0e-9cc6-455f-8d97-8738ba95d5d3.png#averageHue=%23e9e9e9&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=671&id=u85b5a4df&margin=%5Bobject%20Object%5D&name=image.png&originHeight=671&originWidth=805&originalType=binary&ratio=1&rotation=0&showTitle=false&size=150163&status=done&style=none&taskId=u0ac78de4-d2a4-4564-8b60-a82a93e45f5&title=&width=805)
第四步：设置虚拟机的名称（名称将会后期出现在左侧）和设置虚拟系统的安装位置
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411795420-40c7a591-cfa2-43a6-9f12-2a2400dea0d7.png#averageHue=%23f3f2f4&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=472&id=u33ad7605&margin=%5Bobject%20Object%5D&name=image.png&originHeight=472&originWidth=813&originalType=binary&ratio=1&rotation=0&showTitle=false&size=124093&status=done&style=none&taskId=ubbdef95d-344d-40b7-aed7-8eb920be558&title=&width=813)
第五步：CPU设置，提示：根据自身电脑配置选择CPU设置，一般默认即可，1*1
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411804819-5d2cad35-3eb3-4689-9fc9-de465663cc0b.png#averageHue=%23eaeaea&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=672&id=ub818db9a&margin=%5Bobject%20Object%5D&name=image.png&originHeight=672&originWidth=810&originalType=binary&ratio=1&rotation=0&showTitle=false&size=111654&status=done&style=none&taskId=uccef811c-7f13-47de-a7d2-8030c621dc7&title=&width=810)
第六步：分配虚拟机内存
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411812195-09830fc0-75ef-4e0d-b3df-7e6f233e4382.png#averageHue=%23e2dbd4&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=691&id=u97ae9f09&margin=%5Bobject%20Object%5D&name=image.png&originHeight=691&originWidth=814&originalType=binary&ratio=1&rotation=0&showTitle=false&size=336554&status=done&style=none&taskId=u36eafa98-1392-47c6-9e77-0c9b5cda94d&title=&width=814)
第七步：选择虚拟机网络类型，默认选择NAT即可。
NAT：配置好之后windows 即可和虚拟机进行互相通信，但是教室内的其他同学是访问不了的，只有自己可以访问虚拟机中的操作系统。
桥接：配置好之后其他同学也可以访问你的虚拟机操作系统。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411818283-ce479639-3bb4-469e-8b48-d4de78819561.png#averageHue=%23e1d3cf&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=692&id=u8df63ff8&margin=%5Bobject%20Object%5D&name=image.png&originHeight=692&originWidth=807&originalType=binary&ratio=1&rotation=0&showTitle=false&size=284238&status=done&style=none&taskId=u716fa7f8-c8c2-46dc-9ec7-76b724f1583&title=&width=807)
第八步：后续默认的步骤，直接下一步
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411827859-678c1e35-8249-4f33-9ae6-76a7d0632a08.png#averageHue=%23eaeae9&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=688&id=u8f401899&margin=%5Bobject%20Object%5D&name=image.png&originHeight=688&originWidth=807&originalType=binary&ratio=1&rotation=0&showTitle=false&size=205624&status=done&style=none&taskId=u72b31d41-ffa4-47d6-9446-1ce725e731c&title=&width=807)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411838372-84d41caa-57a3-40a2-a258-30dd4af7a9fc.png#averageHue=%23ecebeb&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=689&id=uaaac4c0f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=689&originWidth=808&originalType=binary&ratio=1&rotation=0&showTitle=false&size=137693&status=done&style=none&taskId=ufbecb828-9e5a-44f1-b4a7-71f73f0004a&title=&width=808)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411845323-7adbf4a9-c892-4fcc-879b-140f9f318d83.png#averageHue=%23e4e3e3&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=683&id=ud5536a5c&margin=%5Bobject%20Object%5D&name=image.png&originHeight=683&originWidth=799&originalType=binary&ratio=1&rotation=0&showTitle=false&size=239454&status=done&style=none&taskId=ube388d9a-e136-4da6-9a3d-5bef6c46604&title=&width=799)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411852785-4359281f-a547-4859-b0f0-abe99caf16c8.png#averageHue=%23e1d4cf&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=689&id=u174b57cc&margin=%5Bobject%20Object%5D&name=image.png&originHeight=689&originWidth=809&originalType=binary&ratio=1&rotation=0&showTitle=false&size=294146&status=done&style=none&taskId=u2420f516-ab3a-4c3c-ba74-ca095fe1446&title=&width=809)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411862091-30264ed6-a45d-44bd-9b2d-1a5e3c098073.png#averageHue=%23e0cdc8&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=421&id=u09375d98&margin=%5Bobject%20Object%5D&name=image.png&originHeight=421&originWidth=803&originalType=binary&ratio=1&rotation=0&showTitle=false&size=149493&status=done&style=none&taskId=ubb4db9c3-db0c-432f-ab27-0f1c8650b15&title=&width=803)
安装完毕后，单击完成：
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411872696-29f09efe-5d3d-4b64-9fe5-6eaf057708f7.png#averageHue=%23efeeee&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=854&id=ub6279934&margin=%5Bobject%20Object%5D&name=image.png&originHeight=854&originWidth=812&originalType=binary&ratio=1&rotation=0&showTitle=false&size=289782&status=done&style=none&taskId=u40f5fe6e-548f-4ea7-ba07-f40cd28f6c7&title=&width=812)
## 5、CentOS系统安装配置
第一步：选择CentOS系统安装镜像【*.iso文件】
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411890395-74782abc-f8a2-41c0-86c0-05ec259d9a80.png#averageHue=%23b9b9b9&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=471&id=u7b2e5bbe&margin=%5Bobject%20Object%5D&name=image.png&originHeight=471&originWidth=817&originalType=binary&ratio=1&rotation=0&showTitle=false&size=145247&status=done&style=none&taskId=u64b1ca97-5ebe-4eb4-a5d0-c17a0d9703a&title=&width=817)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411898474-260213c1-2e36-4a35-9503-fd762582a8b4.png#averageHue=%23f8f8f8&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=439&id=u995cf074&margin=%5Bobject%20Object%5D&name=image.png&originHeight=439&originWidth=803&originalType=binary&ratio=1&rotation=0&showTitle=false&size=165814&status=done&style=none&taskId=ua5e8cdf5-d1b0-43d8-9daa-6eb73f0a01b&title=&width=803)
第二步：开启虚拟机，进行系统安装
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411905066-22b9c5fc-0348-4aaa-afd1-d7757fd9f92a.png#averageHue=%23eeede6&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=312&id=ube1280cc&margin=%5Bobject%20Object%5D&name=image.png&originHeight=312&originWidth=676&originalType=binary&ratio=1&rotation=0&showTitle=false&size=113980&status=done&style=none&taskId=u26ba4463-be71-41e7-bb55-ddc459a2017&title=&width=676)
注意：如果开机之后鼠标点进去虚拟机出不来，则可以按下组合快捷键"Ctrl + Alt"
第三步：如果启动之后出现类似提示框（不是错误框）则勾选不再提示，并且确定即可：
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411911297-56109c0f-61fa-4bda-aa8d-88974f6a76ae.png#averageHue=%23dfdeda&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=495&id=u7822a585&margin=%5Bobject%20Object%5D&name=image.png&originHeight=495&originWidth=806&originalType=binary&ratio=1&rotation=0&showTitle=false&size=226744&status=done&style=none&taskId=ub18f2bfb-922d-486f-aacb-dafb8dc83a5&title=&width=806)
特别注意：如果在启动时候出现下述错误，则说明电脑没有开启cpu 的虚拟化，如果需要开启，则需要重启计算机，并且在开启的时候进入主板的BIOS 设置开启虚拟化，然后保存设置重启电脑：
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411919809-c1f4b9f7-4beb-4ea5-9540-5c9ea5386127.png#averageHue=%23dadad4&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=569&id=u229e2e25&margin=%5Bobject%20Object%5D&name=image.png&originHeight=569&originWidth=799&originalType=binary&ratio=1&rotation=0&showTitle=false&size=377253&status=done&style=none&taskId=u1bc44fca-3274-48a4-8d85-9100e01ba44&title=&width=799)
第四步：选择安装centos7（通过↑ 或 ↓方向键进行选择），确认后，按下回车
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411934639-0b46a40f-855f-4036-999b-afe06e27eace.png#averageHue=%23090909&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=388&id=u1a0b28cf&margin=%5Bobject%20Object%5D&name=image.png&originHeight=388&originWidth=817&originalType=binary&ratio=1&rotation=0&showTitle=false&size=105335&status=done&style=none&taskId=u1107480c-e640-4acf-80c6-fe347f90d67&title=&width=817)
第五步：等待一会儿后，将弹出欢迎使用CENTOS 7的界面，选择中文，简体中文（中国），点击继续
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411956462-b03430be-571d-4448-918e-4b1b6ba2efa4.png#averageHue=%23dcdbd1&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=619&id=uc7db35c6&margin=%5Bobject%20Object%5D&name=image.png&originHeight=619&originWidth=814&originalType=binary&ratio=1&rotation=0&showTitle=false&size=239536&status=done&style=none&taskId=u6b5a9254-058a-44a8-b1bf-07792a01a76&title=&width=814)
第六步：在安装信息摘要界面，点击软件安装，进入软件选择界面
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411965245-15c11a7b-dbc7-4d98-ad9f-a4e1a7336598.png#averageHue=%23eeba7a&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=604&id=u41b75688&margin=%5Bobject%20Object%5D&name=image.png&originHeight=604&originWidth=812&originalType=binary&ratio=1&rotation=0&showTitle=false&size=252379&status=done&style=none&taskId=u552e8c6a-e4ff-496a-a67c-e7ba7bd0fa1&title=&width=812)
第七步：在软件选择界面，选中左侧GNOME Desktop，勾选右侧所有项目，点击完成，回到安装信息摘要界面。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411975518-d6f7ed63-2721-40ec-b74d-5596130b21da.png#averageHue=%23e9e9e7&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=565&id=u0d987c6e&margin=%5Bobject%20Object%5D&name=image.png&originHeight=565&originWidth=812&originalType=binary&ratio=1&rotation=0&showTitle=false&size=380776&status=done&style=none&taskId=ub5896f85-d4df-41e4-bd05-5dedbc678f9&title=&width=812)
点击INSTALLATION DESTINATION
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411985151-a2f7af24-6327-422c-a405-108482ccd583.png#averageHue=%23ecbb7e&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=603&id=u1f02ea99&margin=%5Bobject%20Object%5D&name=image.png&originHeight=603&originWidth=814&originalType=binary&ratio=1&rotation=0&showTitle=false&size=284873&status=done&style=none&taskId=u20713a8e-8ba6-415e-8d18-567d7ab2429&title=&width=814)
进入磁盘配置页面，直接点Done，不需要做其他更改，只是确认使用自动分区
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668411995753-db6f47f9-5c1b-4e9a-9f88-7ba76dfab760.png#averageHue=%23e3e3e3&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=605&id=u4bc4966c&margin=%5Bobject%20Object%5D&name=image.png&originHeight=605&originWidth=813&originalType=binary&ratio=1&rotation=0&showTitle=false&size=240780&status=done&style=none&taskId=u7bc34d3b-f503-436d-8c0b-257cc50d21b&title=&width=813)
第八步：点击开始安装
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412004055-6e53d127-feca-473e-b62c-2b5035e284ca.png#averageHue=%23d7d5c8&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=611&id=u84ae826a&margin=%5Bobject%20Object%5D&name=image.png&originHeight=611&originWidth=810&originalType=binary&ratio=1&rotation=0&showTitle=false&size=253383&status=done&style=none&taskId=u0520712e-a941-4e6b-8e86-6b898609a2f&title=&width=810)
第九步：进入安装进度页面
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412015965-7c903cea-7a51-46df-b746-d28093fbc4ca.png#averageHue=%23b6b7b1&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=608&id=uf355bda4&margin=%5Bobject%20Object%5D&name=image.png&originHeight=608&originWidth=810&originalType=binary&ratio=1&rotation=0&showTitle=false&size=327095&status=done&style=none&taskId=u50a7d0b7-5254-4414-abd8-6c452c3041f&title=&width=810)
第十步：点击ROOT密码，进入密码设置页面，输入两次ROOT账户的密码，例如1234。
第一次点击完成，会提示Too short，密码太短，再点击一次完成，确定使用简单密码。（生产环境要设置足够复杂的密码）![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412026136-75b26f7c-f62a-4d2a-bdf0-2adf3be577c8.png#averageHue=%23e6e7e5&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=243&id=u40416fc8&margin=%5Bobject%20Object%5D&name=image.png&originHeight=243&originWidth=814&originalType=binary&ratio=1&rotation=0&showTitle=false&size=112198&status=done&style=none&taskId=u0936ef43-7835-4aac-93ce-01ca336d4be&title=&width=814)
第十一步：回到安装进度页面，显示已经设置了ROOT密码，等待安装完成即可。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412037794-b0cb1fcf-bdd2-4fb0-adc7-23baf36e23cf.png#averageHue=%23c2c3bc&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=604&id=u5c93eaf4&margin=%5Bobject%20Object%5D&name=image.png&originHeight=604&originWidth=807&originalType=binary&ratio=1&rotation=0&showTitle=false&size=272151&status=done&style=none&taskId=ucc8a3bbb-e4f1-433d-81ed-2d50d94f6f2&title=&width=807)
第十二步：安装完成后，右下角会出现重启按钮，点击重启
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412060710-362ea932-f326-4b52-b3ab-42cd4f75ed88.png#averageHue=%23efd3b1&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=613&id=u18457a33&margin=%5Bobject%20Object%5D&name=image.png&originHeight=613&originWidth=814&originalType=binary&ratio=1&rotation=0&showTitle=false&size=186835&status=done&style=none&taskId=ubf3830e3-23f9-40e3-b02d-ef334503807&title=&width=814)
第十三步：重启之后，来到初始设置页面，点击license information
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412105593-c69ecb31-79b7-4d0d-a248-1e9b66c0e28b.png#averageHue=%23e4e1dd&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=490&id=u978f6e42&margin=%5Bobject%20Object%5D&name=image.png&originHeight=490&originWidth=811&originalType=binary&ratio=1&rotation=0&showTitle=false&size=109863&status=done&style=none&taskId=u28fc26ad-772b-4e63-a126-66fc6593c2e&title=&width=811)
第十四步：勾选我同意许可协议，点击左上角完成，回到初始设置页面
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412113017-74c3cd8d-fa68-44f3-a53a-26ac87d9dcb2.png#averageHue=%23f3f3f3&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=430&id=u0de198e3&margin=%5Bobject%20Object%5D&name=image.png&originHeight=430&originWidth=813&originalType=binary&ratio=1&rotation=0&showTitle=false&size=47494&status=done&style=none&taskId=u7e9ef5ac-0488-457c-a59c-452a0fb2de5&title=&width=813)
第十五步：网络和主机名，创建用户都不用操作，直接点击右下角完成配置
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412120820-1134153e-309b-4e6d-ae49-7ae7bf504808.png#averageHue=%23d9d7cd&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=486&id=u2e8e913b&margin=%5Bobject%20Object%5D&name=image.png&originHeight=486&originWidth=812&originalType=binary&ratio=1&rotation=0&showTitle=false&size=104262&status=done&style=none&taskId=uc563bd3a-4803-4579-aec8-d7c5d50efa8&title=&width=812)
第十六步：进入到欢迎页面，点击前进
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412128671-55008b14-f606-4e90-8745-fab76f74470f.png#averageHue=%23eaeaea&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=375&id=uebe3fcd9&margin=%5Bobject%20Object%5D&name=image.png&originHeight=375&originWidth=813&originalType=binary&ratio=1&rotation=0&showTitle=false&size=37751&status=done&style=none&taskId=u25bf0302-4aa1-45a0-8099-ebe0682c16b&title=&width=813)
第十七步：输入页面，默认汉语，点击前进
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412137358-79853cd1-0f24-40cb-b902-64704b5abb5f.png#averageHue=%23e9e9e9&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=299&id=u2c624652&margin=%5Bobject%20Object%5D&name=image.png&originHeight=299&originWidth=811&originalType=binary&ratio=1&rotation=0&showTitle=false&size=48963&status=done&style=none&taskId=udfd70da6-5b7a-40cc-9307-5dc3ada697b&title=&width=811)
第十八步：隐私，位置服务，默认开启，点击前进
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412144839-b010d19c-4cbf-41f5-a5af-e75a182d3df2.png#averageHue=%23e4e3e5&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=279&id=ua03fecec&margin=%5Bobject%20Object%5D&name=image.png&originHeight=279&originWidth=810&originalType=binary&ratio=1&rotation=0&showTitle=false&size=44497&status=done&style=none&taskId=ub5e9ec8d-de7f-49d1-908a-d205387edb8&title=&width=810)
第十九步：时区，在对话框中输入shanghai，会自动联想出对应时区，点击右上角前进。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412152194-74a3029a-ff28-4c7f-b961-a39196e154f4.png#averageHue=%23afc1a3&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=456&id=u2879e9d1&margin=%5Bobject%20Object%5D&name=image.png&originHeight=456&originWidth=811&originalType=binary&ratio=1&rotation=0&showTitle=false&size=200895&status=done&style=none&taskId=ucc7629ea-4b14-46db-a83b-a891b7c4d66&title=&width=811)
第二十步：在线账号，选择跳过
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412160217-e423b3ce-c2bd-475f-a59e-c79ac95d3c07.png#averageHue=%23e8e8e8&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=232&id=u9f847c74&margin=%5Bobject%20Object%5D&name=image.png&originHeight=232&originWidth=810&originalType=binary&ratio=1&rotation=0&showTitle=false&size=40492&status=done&style=none&taskId=u7e51856b-3a1b-4f27-9489-b5ceddf30b0&title=&width=810)
第二十一步：全名任意填写，用户名默认和全名一致，此处的用户名，是一个普通的账户，区别于ROOT账户。点击前进。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412172239-3b011ef8-275e-445a-ae94-c0628ea4be9a.png#averageHue=%23e5e4e6&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=279&id=u83843b60&margin=%5Bobject%20Object%5D&name=image.png&originHeight=279&originWidth=811&originalType=binary&ratio=1&rotation=0&showTitle=false&size=42967&status=done&style=none&taskId=u73e81dc7-b6e3-4ca5-9c8a-f958fc8e1fe&title=&width=811)
第二十二步：填写密码，注意需要包含数字，字母，特殊字符，此处密码是前面创建的itheima这个账户的密码
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412180205-282b9258-f566-41bf-83f8-b0d1b831d335.png#averageHue=%23e6e6e6&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=235&id=u4b2de917&margin=%5Bobject%20Object%5D&name=image.png&originHeight=235&originWidth=814&originalType=binary&ratio=1&rotation=0&showTitle=false&size=36921&status=done&style=none&taskId=ue1958c9b-e474-4b41-8894-55bb7936d09&title=&width=814)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412190206-d1bb8417-0a1c-480a-a49e-a782f72a4779.png#averageHue=%23e4e3e3&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=567&id=u7a56ee1d&margin=%5Bobject%20Object%5D&name=image.png&originHeight=567&originWidth=807&originalType=binary&ratio=1&rotation=0&showTitle=false&size=81388&status=done&style=none&taskId=u2940d541-417a-4e6c-97be-53da3eddfef&title=&width=807)
## 6、安装后配置
为了试验方便，取消centos的屏幕锁定
点击桌面右上角的电源标志，在弹出菜单下方，点击设置按钮![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412200965-f3cb7957-822c-4968-a34e-3e5301a06f16.png#averageHue=%23d6d8d7&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=398&id=u45244db3&margin=%5Bobject%20Object%5D&name=image.png&originHeight=398&originWidth=805&originalType=binary&ratio=1&rotation=0&showTitle=false&size=153254&status=done&style=none&taskId=ub8183763-1819-431b-af64-5cca14d4bd7&title=&width=805)
选择左侧的Power（电源）按钮，右侧选择Never（从不），这样Centos就不会每五分钟自动锁屏了，方便大家操作。
注意：自动锁屏是出于安全考虑，工作环境尽量不要关闭。
![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412218745-db9bff64-beba-4883-9b81-df3f34a52b69.png#averageHue=%23ebebeb&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=519&id=u051833cf&margin=%5Bobject%20Object%5D&name=image.png&originHeight=519&originWidth=817&originalType=binary&ratio=1&rotation=0&showTitle=false&size=81851&status=done&style=none&taskId=u035c9cdf-1564-4fb6-9d83-ebdc8f00f85&title=&width=817)
选中后，直接点击右上角关闭即可，系统会自动保存配置

![image.png](https://cdn.nlark.com/yuque/0/2022/png/194754/1668412225622-e60647d9-e72b-4635-895a-4e3ba4deb1b4.png#averageHue=%23e8e7e8&clientId=uf4a994f2-99fa-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=326&id=ud32b59a5&margin=%5Bobject%20Object%5D&name=image.png&originHeight=326&originWidth=813&originalType=binary&ratio=1&rotation=0&showTitle=false&size=56142&status=done&style=none&taskId=uef65cfee-a926-45b9-a72b-78ac8763df0&title=&width=813)
