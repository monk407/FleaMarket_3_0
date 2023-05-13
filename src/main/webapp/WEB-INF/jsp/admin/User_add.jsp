<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String basePath = request.getScheme() + "://" +
request.getServerName() + ":" + request.getServerPort() +
request.getContextPath() + "/";
%>
<base href="<%=basePath%>"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加用户</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/User_add.css">
<%--    <link rel="stylesheet" href="../../../css/common/reset.css">--%>
    <link rel="stylesheet" href="../../../bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="../../../js/jquery-3.4.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../../js/User_add.js" charset="GB2312"></script>
</head>

<body>
<div id="admin">
    <jsp:include page="../common/navigation%20_left.jsp"/>
    <div id="navBar">
        <ul class="navWrap">
            <li><span><a href="/admin/AdmingetUserPage.do?pageNum=1" style="color: #d9edf7">全部用户</a></span></li>
            <li><span><a href="/admin/GoUserAdd.do" style="color: #d9edf7">添加用户</a></span></li>
        </ul>
    </div>

</div>

<div class="right">
    <div id="user_add_form">
        <p>
            <label for="username">用户名</label>
            <input type="text" id="username" placeholder="请输入用户名">
<%--            <span class="tips">请输入正确的用户名</span>--%>
        </p>
        <p>
            <label  for="maibox">邮箱</label>
            <input type="text" id="maibox" placeholder="请输入邮箱">
<%--            <span class="tips">请输入正确的邮箱</span>--%>
        </p>
        <p>
            <label for="password">密码</label>
            <input type="text" id="password" placeholder="请输入密码">
<%--            <span class="tips">请输入正确的密码</span>--%>
        </p>
        <p>
            <label for="addressname">收货人</label>
            <input type="text" id="addressname" placeholder="请输入收货人">
<!--            <span class="tips">请输入正确的收货人</span>-->
        </p>
        <p>
            <label for="phone">电话</label>
            <input type="text" id="phone" placeholder="请输入电话">
<%--            <span class="tips">请输入正确的电话</span>--%>
        </p>
        <p>
            <label for="address">地址</label>
            <input type="text" id="address" placeholder="请输入地址">
<!--            <span class="tips">请输入正确的地址</span>-->
        </p>
        <%--<div>
            <span style="width: 25px;height: 28px">管理员
            <input id="yes" type="radio" name="isAdmin" value="true"><label for="yes">YES</label>
            <input id="no" type="radio" name="isAdmin" value="false"><label for="no">NO</label>
            </span>
            <button class="AddUserBtn">添加</button>
        </div>--%>
        <p>
            <label>是否为管理员</label>
            <label for="yes">
                <input type="radio" name="isAdmin" id="yes" value="true" style="width: 36px"/><span>YES</span>
            </label>
            <label for="no">
                <input type="radio" name="isAdmin" id="no" value="false" style="width: 36px"/><span>NO</span>
            </label>
        </p>
        <div class="button_pos">
            <button class="GetBackBtn" type="button">返回</button>
            <button class="AddUserBtn" type="button">添加</button>
        </div>
    </div>
    <!-- 页脚 -->
    <div class="foot_font">
        <p>www.FleaMarket.com © All rights Reserved</p>
    </div>
</div>

</body>

</html>