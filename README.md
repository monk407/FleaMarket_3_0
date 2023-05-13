# FleaMarket_3_0

# 1、介绍

Flea Market系统，是一个二手交易平台，从立项开始，编写软件可行性分析报告，软件需求分析等等，经过一系列的开发过程，Flea Market系统初步开发完毕。
开发软件名称：《Flea Marker》
项目logo：∞

# 2、技术栈

Java、Spring、SpringMVC、Mybatis、js、jsp

# 3、开发环境

数据库：Mysql
运行环境：Edge浏览器、Google浏览器

开发语言：Java、jsp、js、css

所用框架：ssm

开发工具：idea

# 4、需求概述

## （一）角色

### 1.游客

（1）浏览商品，查看商品

（2）查找商品：按分类查询、按价格区间查询、按商品名称查询

（3）注册功能：注册成为普通用户

### 2.普通用户

在该平台上普通用户这一角色可以既能是买家又可以作为卖家，主要有如下权限：

（1）浏览商品，查看商品

（2）查找商品：按分类查询、按价格区间查询、按商品名称查询

（3）将商品加入购物车，修改购物车内容，购买商品，生成订单，查看购物订单

（4）上架商品，查看售卖商品情况

（5）查看售卖订单信息，对售卖订单进行发货处理

（6）修改个人信息

### 3.管理员

在本网站中，管理员是拥有绝对权限的人员，用于维护管理整个网站，确保网站不出现不符合当前法律法规规定的内容，主要有如下权限：

（1）查询用户基本信息，查询商品基本信息，查询订单基本信息

（2）增加用户，增加商品类型

（3）删除违法违规的用户、商品、订单

（4）修改用户

## （二）项目目标

1.平台网站各个功能完整；

2.整个系统可以稳定运行；

3.信息发布和显示迅速、准确；

4.用户权限系统完善；

5.搜索功能完善。

# 5、使用说明

## 1、数据库准备

（1）执行数据库最新

（2）执行测试数据

![输入图片说明](https://foruda.gitee.com/images/1683977379452294481/e8f520a3_9964688.png "屏幕截图")

## 2、服务器准备

-Dfile.encoding=UTF-8

![输入图片说明](https://foruda.gitee.com/images/1683977360356896666/37136e01_9964688.png "屏幕截图")
![输入图片说明](https://foruda.gitee.com/images/1683977406673747926/967c51c9_9964688.png "屏幕截图")
![输入图片说明](https://foruda.gitee.com/images/1683977410738798601/27cfdb24_9964688.png "屏幕截图")

Picture文件导入

![输入图片说明](https://foruda.gitee.com/images/1683977415218702684/30602b82_9964688.png "屏幕截图")
![输入图片说明](https://foruda.gitee.com/images/1683977420125641364/529ef663_9964688.png "屏幕截图")

## 3、pom文件要重新load一下

## 4、注意resource

![输入图片说明](https://foruda.gitee.com/images/1683977424933955499/086c4b37_9964688.png "屏幕截图")

