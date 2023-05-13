<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<base href="<%=basePath%>"/>
<%--<!DOCTYPE html>--%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" type="text/css" href="static/iconfont.css" >
    <link rel="stylesheet" href="css/navigation1.css">
    <link rel="stylesheet" href="css/MyInfo.css">
    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/navigation.js"></script>
    <script type="text/javascript" src="js/MyIfro.js"></script>

    <title>我的信息</title>
</head>
<body>
<!-- 导航条 -->
<jsp:include page="navigation.jsp"/>
<div class="info_body">
    <div class="info_header">
        <span>我的信息</span>
    </div>
    <div class="line"></div>
    <div class="info_from">
        <input type="hidden" id="userid" value="${sessionScope.user.id}">
        <p>
            <label for="username">用户名</label>
            <input class="text" id="username" placeholder="请输入用户名" value="${sessionScope.user.username}" disabled="disabled">
        </p>
        <p>
            <label for="email">邮箱</label>
            <input class="text" id="email" placeholder="请输入邮箱" value="${sessionScope.user.email}" >
        </p>
        <p>
            <label for="consignee">收货人</label>
            <input class="text" id="consignee" placeholder="请输入收货人" value="${sessionScope.user.name}">
        </p>
        <p>
            <label for="phone">电话</label>
            <input class="text" id="phone" placeholder="请输入电话" value="${sessionScope.user.phone}">
        </p>
        <p>
            <label for="address">地址</label>
            <input class="text" id="address" placeholder="请输入地址" value="${sessionScope.user.address}">
        </p>


        <div class="button_position">
<%--            <button class="GetBackBtn" ><a href="index.jsp">返&nbsp&nbsp&nbsp回</a></button>--%>
            <button class="GetBackBtn" >返&nbsp&nbsp&nbsp回</button>
            <button class="UpdateUserBtn" style="margin-left: 100px">保&nbsp&nbsp&nbsp存</button>
        </div>
        <div class="modify_pw">
            <span><a href="ModifyPw.jsp?userid=${sessionScope.user.id}">修改密码</a></span>
        </div>
    </div>
    <!-- 页脚 -->
    <div class="info_font">
        <p>www.FleaMarket.com © All rights Reserved</p>
    </div>
</div>
</body>
</html>
