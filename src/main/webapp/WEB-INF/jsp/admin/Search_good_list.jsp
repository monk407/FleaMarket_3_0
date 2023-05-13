<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<base href="<%=basePath%>"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/good_list.css">
    <link rel="stylesheet" href="../../../css/common/reset.css">

    <link rel="stylesheet" href="../../../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/iconfont.css">
    <script type="text/javascript" src="../../../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../../../js/good_list.js" charset="GB2312"></script>
</head>

<body>
<div id="admin">
    <jsp:include page="../common/navigation%20_left.jsp"/>
    <div id="navBar">
        <ul class="navWrap">
            <li><a href="/admin/AdmingetGoodPage.do?pageNum=1&type=0" style="color: #d9edf7">全部商品</a></li>


        </ul>
        <div class="search">
            <input id="searchValue" type="text" placeholder="请输入商品名字">
            <button type="button" class="searchBtn">
                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
            </button>
        </div>
    </div>
    <div class="right">
        <div class="good_table">
            <div class="show_good_nav">
                <ul>
                    <li>
                        <div class="good_id_nav">
                            <p>ID</p>
                        </div>
                    </li>
                    <li>
                        <div class="good_name_nav">
                            <p>名称</p>
                        </div>
                    </li>
                    <li>
                        <div class="good_img_nav">
                            <p>图片</p>
                        </div>
                    </li>
                    <li>
                        <div class="good_price_nav">
                            <p>价格</p>
                        </div>
                    </li>
                    <li>
                        <div class="good_introduce_nav">
                            <p>介绍</p>
                        </div>
                    </li>
                    <li>
                        <div class="good_stock_nav">
                            <p>库存</p>
                        </div>
                    </li>
                    <li>
                        <div class="good_type_nav">
                            <p>类别</p>
                        </div>
                    </li>
                    <li>
                        <div class="good_seller_nav">
                            <p>卖家</p>
                        </div>
                    </li>
                    <li>
                        <div class="good_operation_nav">
                            <p>操作</p>
                        </div>
                    </li>
                </ul>
            </div>
            <c:forEach var="good" items="${goods}" varStatus="statu">
                <!-- 商品详情 -->
                <div class="show_good">
                    <ul>
                        <li>
                            <div class="good_id">
                                <p>${good.id}</p>
                            </div>
                        </li>
                        <li>
                            <div class="good_name">
                                <p>${good.name}</p>
                            </div>
                        </li>
                        <li>
                            <div class="good_img">
                                    <%--                            image--%>
                                <img src="../../..${good.image}" class="img-responsive" alt="Responsive image"/>
                            </div>
                        </li>
                        <li>
                            <div class="good_price">
                                <p>${good.price}</p>
                            </div>
                        </li>
                        <li>
                            <div class="good_introduce">
                                <p>${good.intro}</p>
                            </div>
                        </li>
                        <li>
                            <div class="good_stock">
                                <p>${good.stock}</p>
                            </div>
                        </li>
                        <li>
                            <div class="good_type">
                                <p>${good.type.name}</p>
                            </div>
                        </li>
                        <li>
                            <div class="good_seller">
                                <p>${good.user.username}</p>
                            </div>
                        </li>
                        <li>
                            <div class="good_operation">
                                    <%--                                <button class="btn_reset" id="${good.id}">修改</button>--%>
                                <button class="btn_delete" name="0" id="${good.id}">删除</button>
                            </div>
                        </li>
                    </ul>
                </div>
            </c:forEach>


            <!-- 页脚 -->
            <div class="foot_font">
                <p>www.FleaMarket.com © All rights Reserved</p>
            </div>
        </div>
    </div>
</div>
</body>

</html>