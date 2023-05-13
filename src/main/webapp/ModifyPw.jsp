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
    <link rel="stylesheet" href="css/ModifyPw.css">
    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/navigation.js"></script>
    <script type="text/javascript" src="js/ModifyPw.js"></script>

    <title>修改密码</title>
</head>
<body>
<!-- 导航条 -->
<jsp:include page="navigation.jsp"/>
<div class="form_body">
    <div class="form_header">
        <span>修改密码</span>
    </div>
    <div class="line"></div>
    <div class="mpw_from">
        <p>
            <label for="oldPw">旧密码</label>
            <input type="hidden" id="password" value="${sessionScope.user.password}">
            <input type="password" class="text" id="oldPw" placeholder="请输入旧密码">
        </p>
        <p>
            <label for="newPw">新密码</label>
            <input type="password" class="text" id="newPw" placeholder="请输入新密码">
        </p>
        <input type="hidden" id="userid" value="${sessionScope.user.id}">
        <div class="button_position">
            <button class="GetBackBtn">返&nbsp&nbsp&nbsp回</button>
            <button style="margin-left: 100px" class="UpdatePasswordBtn">提&nbsp&nbsp&nbsp交</button>
        </div>
    </div>
    <!-- 页脚 -->
    <div class="form_font">
        <p>www.FleaMarket.com © All rights Reserved</p>
    </div>
</div>
</body>
</html>
