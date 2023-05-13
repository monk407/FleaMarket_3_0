<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  String basePath = request.getScheme() + "://" +
          request.getServerName() + ":" + request.getServerPort() +
          request.getContextPath() + "/";
%>
<base href="<%=basePath%>"/>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta charset="utf-8">
  <title>用户管理</title>
  <link rel="stylesheet" href="../../../css/common/reset.css">
  <link rel="stylesheet" href="../../../css/User_list.css">
  <link rel="stylesheet" href="../../../bootstrap/css/bootstrap.css">
  <script type="text/javascript" src="../../../js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="../../../js/User_list.js" charset="GB2312"></script>
</head>

<body>
<div id="admin">
  <jsp:include page="../common/navigation%20_left.jsp"/>
  <div id="navBar">
    <ul class="navWrap">
      <li><span class="text allUser" id="allUser"><a href="/admin/AdmingetUserPage.do?pageNum=1" style="color: #d9edf7">全部用户</a></span></li>
      <li><span class="text"><a href="/admin/GoUserAdd.do" style="color: #d9edf7">添加用户</a></span></li>
    </ul>
    <div class="search">
      <input id="searchValue" type="text" placeholder="请输入搜索内容">
      <button type="button" class="searchBtn">
        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
      </button>
    </div>
  </div>
  <div class="right">
    <form id="aaa"></form>
    <div class="user_table">
      <div class="show_user_nav">
        <ul>
          <li>
            <div class="user_id_nav">
              <p>ID</p>
            </div>
          </li>
          <li>
            <div class="user_name_nav">
              <p>用户名</p>
            </div>
          </li>
          <li>
            <div class="user_eml_nav">
              <p>邮箱</p>
            </div>
          </li>
          <li>
            <div class="user_consignee_nav">
              <p>收件人</p>
            </div>
          </li>
          <li>
            <div class="user_phone_nav">
              <p>联系电话</p>
            </div>
          </li>
          <li>
            <div class="user_address_nav">
              <p>收货地址</p>
            </div>
          </li>
          <li>
            <div class="user_operation_nav">
              <p>操作</p>
            </div>
          </li>
        </ul>
      </div>
      <c:forEach var="user" items="${users}" varStatus="statu">
        <!-- 商品详情 -->
        <div class="show_user">
          <ul>
            <li>
              <div class="user_id">
                <p>${user.id}</p>
              </div>
            </li>
            <li>
              <div class="user_name">
                <p>${user.username}</p>
              </div>
            </li>
            <li>
              <div class="user_eml">
                <p>${user.email}</p>
              </div>
            </li>
            <li>
              <div class="user_consignee">
                <p>${user.name}</p>
              </div>
            </li>
            <li>
              <div class="user_phone">
                <p>${user.phone}</p>
              </div>
            </li>
            <li>
              <div class="user_address">
                <p>${user.address}</p>
              </div>
            </li>

            <li>
              <div class="user_operation">
                <button type="button" class="btn_reset" id="${user.id}">重置密码</button>
                <button type="button" class="btn_update" id="${user.id}">修改权限</button>
                <button type="button" class="btn_delete" id="${user.id}">删除</button>
              </div>
            </li>
          </ul>
        </div>
      </c:forEach>

      <!-- 页脚 -->
      <div class="foot_font">
        <p>www.FleaMarket.com © All rights Reserved</p>
      </div>
    </div>
  </div>
</div>
</body>
</html>