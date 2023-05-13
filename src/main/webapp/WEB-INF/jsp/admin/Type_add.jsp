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
    <title>添加商品类型</title>
    <link rel="stylesheet" href="../../../css/common/reset.css">
    <link rel="stylesheet" href="../../../css/Type_add.css">
    <link rel="stylesheet" href="../../../bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="../../../js/jquery-3.4.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../../js/Type_add.js" charset="GB2312"></script>
</head>

<body>
<div id="admin">
    <jsp:include page="../common/navigation%20_left.jsp"/>
    <div id="navBar">
        <ul class="navWrap">
            <li><span class="text"><a href="/admin/GoOrderTypeManage.do" style="color: #d9edf7">全部商品类型</a></span></li>
            <li><span class="text"><a href="/admin/GoAddOrderType.do" style="color: #d9edf7">添加商品类型</a></span></li>
        </ul>
        <!--        <div class="search">-->
        <!--            <input type="text">-->
        <!--            <button>-->
        <!--                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>-->
        <!--            </button>-->
        <!--        </div>-->
    </div>

    <div class="right">
        <div class="pos">
            <form class="type_add_form">
                <ul>
                    <label for="typename">商品类型名称</label>
                    <input class="text" id="typename" placeholder="请输入新的商品类型名称">
                </ul>
                <ul>
                    <div class="button_pos">
                        <button class="GetBackBtn" type="button">返回</button>
                        <button class="AddUserBtn" type="button">添加</button>
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
