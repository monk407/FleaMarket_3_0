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
    <title>管理员首页</title>
    <link rel="stylesheet" href="../../../css/common/reset.css">
    <link rel="stylesheet" href="../../../css/HomePage.css">

</head>

<body>
    <div id="admin">

        <jsp:include page="../common/navigation%20_left.jsp"/>

        <div id="navBar">
            <ul class="navWrap">
                <li><span class="text">管理员首页</span></li>
            </ul>
            <ul>
                <li><span class="text">--欢迎您 尊贵的管理员--</span></li>
            </ul>
        </div>

        <div class="right">
            <dl class="table">
                <dt>平台数据</dt>
                <dd>
                    <div>
                        <strong>${sessionScope.goods_column}</strong>
                        <span>商品数量</span>
                    </div>
                </dd>
                <dd>
                    <div>
                        <strong>${sessionScope.user_column}</strong>
                        <span>用户数量</span>
                    </div>
                </dd>
                <dd>
                    <div>
                        <strong>${sessionScope.order_column}</strong>
                        <span>订单数量</span>
                    </div>
                </dd>
            </dl>
            <!-- 页脚 -->
            <div class="foot_font">
                <p>www.FleaMarket.com © All rights Reserved</p>
            </div>
        </div>
    </div>
</body>

</html>