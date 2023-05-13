<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>navigation _left</title>
  <link rel="stylesheet" href="../../../css/common/reset.css">
  <link rel="stylesheet" href="../../../css/HomePage.css">
</head>
<body>
<div class="left">
  <img src="../../../img/admin_logo.png" alt="">
  <ul>
    <li><span class="iconfont"></span><a href="/admin/GoHomeManage.do" style="color: #d9edf7">管理员首页</a> </li>
    <li><span class="iconfont"></span><a href="/admin/AdmingetGoodPage.do?pageNum=1&type=0" style="color: #d9edf7">商品管理</a></li>
    <li><span class="iconfont"></span><a href="/admin/AdmingetUserPage.do?pageNum=1" style="color: #d9edf7">用户管理</a></li>
    <li><span class="iconfont"></span><a href="/admin/AdminGetOrderPage.do?pageNum=1&status=0" style="color: #d9edf7">订单管理</a></li>
    <li><span class="iconfont"></span><a href="/admin/GoOrderTypeManage.do" style="color: #d9edf7">商品类型管理</a></li>
    <li class="bot"><span class="iconfont"><a href="/login.jsp" style="color: #d9edf7">退出</a></span></li>
  </ul>
</div>
</body>
</html>
