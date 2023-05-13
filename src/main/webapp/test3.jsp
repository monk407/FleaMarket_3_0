
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <title>test3</title>
    <base href="<%=basePath%>" />
</head>
<body>
<h3>test3</h3>
<img src="picture/test.jpg">
<h3>用户名：${param.username}</h3>
<h3>用户年龄：${param.userAge}</h3>
<%--<h3>：<%=request.getParameter("username")%></h3>--%>
<%--<h3>：<%=request.getParameter("userAge")%></h3>--%>



</body>
</html>
