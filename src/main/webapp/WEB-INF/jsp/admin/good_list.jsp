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
            <li>
                <select id="type" name="type" style="color: #d9edf7;background:#3f3f3f;border-color: #3f3f3f;" class="dropdown_select">
                    <option id="0" value="allGoods" style="color: black;background:ghostwhite;border-color: #3f3f3f;">类型选择</option>
                    <c:forEach var="type" items="${types}" varStatus="statu">
                        <option id="${type.id}" name="${type.id}" value="${type.name}" style="color: black;background:ghostwhite;">${type.name}</option>
                    </c:forEach>
                </select>
            </li>

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
            <c:forEach var="good" items="${page.list}" varStatus="statu">

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
                        <c:if test="${good.id==1}">
                            <li>
                                <div class="good_operation">
                                        <%--                                <button class="btn_reset" id="${good.id}">修改</button>--%>
                                    <button class="btn_delete" name="${typeID}" id="${good.id}" disabled="true">删除</button>
                                </div>
                            </li>
                        </c:if>
                        <c:if test="${good.id!=1}">
                            <li>
                                <div class="good_operation">
                                        <%--                                <button class="btn_reset" id="${good.id}">修改</button>--%>
                                    <button class="btn_delete" name="${typeID}" id="${good.id}">删除</button>
                                </div>
                            </li>
                        </c:if>
                    </ul>
                </div>

            </c:forEach>

            <!--分页条-->
            <br>
            <div style="text-align: center;">
                <c:if test="${page.hasPreviousPage}"><a href="/admin/AdmingetGoodPage.do?pageNum=1&type=${typeID}">首页</a></c:if>
                <c:if test="${page.hasPreviousPage}"><a
                        href="/admin/AdmingetGoodPage.do?pageNum=${page.prePage}&type=${typeID}">上一页</a></c:if>
                <c:forEach var="num" items="${page.navigatepageNums}">
                    <c:if test="${page.pageNum == num}">
                        <a style="color: red" href="/admin/AdmingetGoodPage.do?pageNum=${num}&type=${typeID}">[${num}]</a>
                    </c:if>
                    <c:if test="${page.pageNum != num}">
                        <a href="/admin/AdmingetGoodPage.do?pageNum=${num}&type=${typeID}">[${num}]</a>
                    </c:if>
                </c:forEach>
                <c:if test="${page.hasNextPage}"><a
                        href="/admin/AdmingetGoodPage.do?pageNum=${page.nextPage}&type=${typeID}">下一页</a>
                </c:if>
                <c:if test="${page.hasNextPage}"><a
                        href="/admin/AdmingetGoodPage.do?pageNum=${page.pages}&type=${typeID}">尾页</a>
                </c:if>

                <input style="width: 50px" type="text" id="goPage" class="input" name="${typeID}"  value="1"
                       placeholder="页号">
                <button name="GO" id="GO" value="GO" type="button">
                    GO
                </button>
            </div>

            <!-- 页脚 -->
            <div class="foot_font">
                <p>www.FleaMarket.com © All rights Reserved</p>
            </div>
        </div>
    </div>
</div>
</body>

</html>