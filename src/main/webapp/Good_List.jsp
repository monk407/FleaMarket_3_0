<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String basePath = request.getScheme() + "://" +
request.getServerName() + ":" + request.getServerPort() +
request.getContextPath() + "/";
%>
<base href="<%=basePath%>" />
<%--<!DOCTYPE html>--%>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>商品展示</title>
    <link rel="stylesheet" href="css/Good_List1.css" />
    <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" type="text/css" href="static/iconfont.css" >
    <link rel="stylesheet" href="css/navigation1.css">
    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/Good_List1.js"></script>
    <script type="text/javascript" src="js/navigation.js"></script>
</head>
<body>
<!-- 导航条 -->
<jsp:include page="navigation.jsp"/>

<div class="main">
    <div class="cart-filter-bart">
<%--        全部系列--%>
    </div>
    <center>
        <table class="cart-table" ></table>
        <tr>
        <div class="show_commodity">
                <c:forEach var="goods" items="${requestScope.goodsByTypePage.list}" varStatus="status">
                    <c:if test="${status.index%3 == 0}">
                        <ul id="showAllGoods">
                            <li class="commodity1">
                                <div class="img-rounded commodity_pic">
                                    <img src=".${goods.image}" class="img-responsive" alt="Responsive image"/>
                                </div>
                                <div class="commodity_text">
                                    <a href="goods/goodsDetail.do?goodsid=${goods.id}" class="word_size">${goods.name}</a>
                                    <input class='hiddenInput' type='hidden' name='goodsid' value="${goods.id}">
                                </div>
                            </li>
                    </c:if>
                    <c:if test="${status.index%3 == 1}">
                            <li class="commodity2">
                                <div class="commodity_pic">
                                    <img src=".${goods.image}" class="img-responsive" alt="Responsive image" />
                                </div>
                                <div class="commodity_text">
                                    <a href="goods/goodsDetail.do?goodsid=${goods.id}" class="word_size">${goods.name}</a>
                                    <input class='hiddenInput' type='hidden' name='goodsid' value="${goods.id}">
                                </div>
                            </li>
                    </c:if>
                    <c:if test="${status.index%3 == 2}">
                            <li class="commodity3">
                                <div class="commodity_pic">
                                    <img src=".${goods.image}" class="img-responsive" alt="Responsive image"/>
                                </div>
                                <div class="commodity_text">
                                    <a href="goods/goodsDetail.do?goodsid=${goods.id}" class="word_size">${goods.name}</a>
                                    <input class='hiddenInput' type='hidden' name='goodsid' value="${goods.id}">
                                </div>
                            </li>
                        </ul>
                    </c:if>
                </c:forEach>
        </div>
            <!--分页条-->
            <br>
            <div style="text-align: center;">
                <c:if test="${requestScope.goodsByTypePage.hasPreviousPage}"><a href="/goods/sortPage.do?pageNum=1&type=${typeID}">首页</a></c:if>
                <c:if test="${requestScope.goodsByTypePage.hasPreviousPage}"><a
                    href="/goods/sortPage.do?pageNum=${requestScope.goodsByTypePage.prePage}&type=${typeID}">上一页</a></c:if>
                <c:forEach var="num" items="${requestScope.goodsByTypePage.navigatepageNums}">
                <c:if test="${requestScope.goodsByTypePage.pageNum == num}">
                <a style="color: red" href="/goods/sortPage.do?pageNum=${num}&type=${typeID}">[${num}]</a>
                </c:if>
                <c:if test="${requestScope.goodsByTypePage.pageNum != num}">
                <a href="/goods/sortPage.do?pageNum=${num}&type=${typeID}">[${num}]</a>
                </c:if>
                </c:forEach>
                <c:if test="${requestScope.goodsByTypePage.hasNextPage}"><a
                    href="/goods/sortPage.do?pageNum=${requestScope.goodsByTypePage.nextPage}&type=${typeID}">下一页</a>
                </c:if>
                <c:if test="${requestScope.goodsByTypePage.hasNextPage}"><a
                    href="/goods/sortPage.do?pageNum=${requestScope.goodsByTypePage.pages}&type=${typeID}">尾页</a>
                </c:if>

                <input style="width: 50px" type="text" id="goPage" class="input" name="${typeID}"  value="1"
                       placeholder="页号">
                <button name="GO" id="GO" value="GO" type="button">
                    GO
                </button>
        <!-- 页尾 -->
        <div class="foot">
            <ul>
                <li>
                    <div class="foot_info1">
                        <p>服务保障</p>
                        <a href="#">正品保证</a><br />
                        <a href="#">24小时在线客服</a>
                    </div>
                </li>
                <li>
                    <div class="foot_info2">
                        <p>协议规范</p>
                        <a href="#">隐私协议</a><br />
                        <a href="#">用户注册协议</a><br />
                        <a href="#">商家协议</a>
                    </div>
                </li>
                <!-- <li>
                    <div class="foot_info3">

                    </div>
                </li> -->
            </ul>
            <div class="container foot_font">
                <p>www.FleaMarket.com © All rights Reserved</p>
            </div>
        </div>
    </center>
</div>

</body>
</html>