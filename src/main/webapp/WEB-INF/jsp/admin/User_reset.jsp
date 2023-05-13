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
    <title>重置密码</title>
    <link rel="stylesheet" href="../../../css/User_reset.css">
    <script type="text/javascript" src="../../../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../../../js/User_reset.js" charset="GB2312"></script>
</head>
<body>
    <div class="popup">
        <p class="popup_title">提示</p>
        <p class="popup_content">是否该用户密码重置为6个0（000000）</p>
        <div class="popup_btn">
            <button class="cancelBtn" type="button" >取消</button>
<%--            <button class="cancelBtn" ><a href="/admin/AdmingetUserPageTmp.do">取消</a></button>--%>
            <button class="confirmBtn" type="button" >确认</button>
        </div>
    </div>
</body>
</html>