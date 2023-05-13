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
    <title>用户信息修改</title>
    <link rel="stylesheet" href="../../../css/common/reset.css">
    <link rel="stylesheet" href="../../../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../../../css/User_edit.css">
    <script type="text/javascript" src="../../../js/jquery-3.4.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../../js/User_edit.js" charset="GB2312"></script>
</head>

<body>
<div id="admin">
    <jsp:include page="../common/navigation%20_left.jsp"/>
    <div id="navBar">
        <ul class="navWrap">
            <li><span class="text">用户信息修改</span></li>
        </ul>
    </div>

</div>

<div class="right">
    <div id="warap">
        <p>
            <input type="hidden" id="userid" value="${user.id}">
            <label for="username">用户名</label>
            <%-- 我加了disabled="true" ，表示不能编辑 --%>
            <input class="text" id="username" placeholder="请输入用户名" value="${user.username}" disabled="disabled">
        </p>
        <p>
            <label for="maibox">邮箱</label>
            <input class="text" id="maibox" placeholder="请输入邮箱" value="${user.email}" disabled="disabled">

        </p>
        <p>
            <label for="password">密码</label>
            <input class="text" id="password" placeholder="请输入密码" value="${user.password}" disabled="disabled">
        </p>
        <p>
            <label for="addressname">收货人</label>
            <input class="text" id="addressname" placeholder="请输入收货人" value="${user.name}" disabled="disabled">

        </p>
        <p>
            <label for="phone">电话</label>
            <input class="text" id="phone" placeholder="请输入电话" value="${user.phone}" disabled="disabled">

        </p>
        <p>
            <label for="address">地址</label>
            <input class="text" id="address" placeholder="请输入地址" value="${user.address}" disabled="disabled">

        </p>
        <p>
            <label>管理员NO</label>
            <input type="hidden" id="judge" name="judge" value="${user.isadmin}">
<%--            <input type="text"  value="${user.isadmin}">--%>
            <label for="yes">
                <input type="radio" name="isAdmin" id="yes" value="true" style="width: 36px"/><span>YES</span>
<%--                ${user.isadmin}--%>
            </label>
            <label for="no">
                <input type="radio" name="isAdmin" id="no" value="false" style="width: 36px"/><span>NO</span>
            </label>
        </p>
        <div class="button_pos">
            <button class="GetBackBtn" type="button">返回</button>
            <button class="UpdateUserBtn" type="button">修改</button>
        </div>
    </div>
    <!-- 页脚 -->
    <div class="foot_font">
        <p>www.FleaMarket.com © All rights Reserved</p>
    </div>
</div>


</body>

</html>