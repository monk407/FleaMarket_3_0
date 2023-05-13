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
    <title>修改商品类型</title>
    <link rel="stylesheet" href="../../../css/common/reset.css">
    <link rel="stylesheet" href="../../../css/Type_edit.css">
    <link rel="stylesheet" href="../../../bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="../../../js/jquery-3.4.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../../js/Type_edit.js" charset="GB2312"></script>
</head>

<body>
<div id="admin">
    <jsp:include page="../common/navigation%20_left.jsp"/>
    <div id="navBar">
        <ul class="navWrap">
            <li><span class="text">商品类型修改</span></li>
        </ul>
    </div>

    <div class="right">
        <div class="pos">
            <form class="type_edit_form">
                <ul>
                    <label for="typeid">商品类型id</label>
                    <input class="text" id="typeid" disabled="true" value="${type.id}">
                </ul>
                <ul>
                    <label for="typename">商品类型名称</label>
                    <input class="text" id="typename" value="${type.name}">
                </ul>
                <ul>
                    <div class="button_pos">
                        <button class="GetBackBtn" type="button">返回</button>
                        <button class="UpdateBtn" type="button">修改</button>
                    </div>
                </ul>
            </form>
            <!-- 页脚 -->
            <div class="foot_font">
                <p>www.FleaMarket.com © All rights Reserved</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
