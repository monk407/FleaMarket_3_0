<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <title>test4</title>
    <base href="<%=basePath%>" />
</head>
<body>


<h3>test4====</h3>
<h3>${msg4}</h3>
<h3>姓名：${name}</h3>
<h3>年龄：${age}</h3>


</body>
</html>
