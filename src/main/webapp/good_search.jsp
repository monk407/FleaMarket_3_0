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
    <title>搜索结果</title>
    <link rel="stylesheet" href="css/Good_List1.css" />
    <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" type="text/css" href="static/iconfont.css" >
    <link rel="stylesheet" href="css/navigation1.css">
    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/navigation.js"></script>
</head>
<body>
<!-- 导航条 -->
<jsp:include page="navigation.jsp"/>
<%--<div class="header">--%>
<%--    <div class="wrap">--%>
<%--        <div class="logo">--%>
<%--            <img src="img/image4.png"/>--%>
<%--        </div>--%>
<%--        <div class="nav">--%>
<%--            <ul class="header-left">--%>
<%--                <li class="first"><a href="index.jsp" >首页</a><span></span></li>--%>
<%--                <li class="navli"><a href="#">商品分类<i class="iconfont">&#xe87e</i></a><!-- <span></span> -->--%>
<%--                    <ul class="ulson typeNav">--%>
<%--                        &lt;%&ndash;            <li class="lison"><a href="goods/sort.do?type=all">全部商品</a><span></span></li><br>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;            <li class="lison"><a href="goods/sort.do?type=1">计算机类</a><span></span></li><br>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;            <li class="lison"><a href="goods/sort.do?type=2">历史类</a><span></span></li><br>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;            <li class="lison"><a href="#">运动器材</a><span></span></li><br>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;            <li class="lison"><a href="#">书籍周刊</a><span></span></li><br>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;            <li class="lison"><a href="#">家用电器</a><span></span></li><br>&ndash;%&gt;--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--                <li class="search-container">--%>
<%--                    &lt;%&ndash;          <form>&ndash;%&gt;--%>
<%--                    <input type="text" placeholder="搜索" name="search" id="searchInput">--%>
<%--                    <a href="#"><i class="iconfont" id="searchBtn">&#xe86e</i></a>--%>
<%--                    &lt;%&ndash;          </form>&ndash;%&gt;--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--            <ul class="header-right">--%>
<%--                <li class="MyGoods"><a href="MyGoods.jsp">我的商品</a><span></span></li>--%>
<%--                <li class="GoodOrders"><a href="GoodsOrders.jsp">我卖的</a><span></span></li>--%>
<%--                <li class="order"><a href="order.jsp">我买的</a><span></span></li>--%>
<%--                <li><a href="login.jsp">登录|注册</a><span></span></li>--%>
<%--                <li class="cart">--%>
<%--                    &lt;%&ndash;          <a href="shoppingCart.jsp"><i class="iconfont">&#xe63f</i>购物车(0)</a>&ndash;%&gt;--%>
<%--                    <c:if test="${!empty sessionScope.order}">--%>
<%--                        <a href="javascript:;" id="shopCartNumber"><i class="iconfont">&#xe63f</i> 购物车(<c:out value="${fn:length(sessionScope.order.itemMap)}"></c:out>)</a>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${empty sessionScope.order}">--%>
<%--                        <a href="javascript:;" id="shopCartNumber"><i class="iconfont">&#xe63f</i> 购物车(0)</a>--%>
<%--                    </c:if>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<!-- <jsp:include page="navigation.jsp"/> -->--%>
<!--<div class="header">-->
<!--    <div class="wrap">-->
<!--        <div class="logo">-->
<!--            <img src="img/image4.png"/>-->
<!--        </div>-->
<!--        <div class="nav">-->
<!--            <ul class="header-left">-->
<!--                <li class="first"><a href="index.html" >首页</a><span></span></li>-->
<!--                <li class="navli"><a href="#">商品分类<i class="iconfont">&#xe87e</i></a><span></span>-->
<!--                    <ul class="ulson">-->
<!--                        <li class="lison"><a href="#">数码产品</a><span></span></li><br>-->
<!--                        <li class="lison"><a href="#">女生衣服</a><span></span></li><br>-->
<!--                        <li class="lison"><a href="#">男生衣服</a><span></span></li><br>-->
<!--                        <li class="lison"><a href="#">运动器材</a><span></span></li><br>-->
<!--                        <li class="lison"><a href="#">书籍周刊</a><span></span></li><br>-->
<!--                        <li class="lison"><a href="#">家用电器</a><span></span></li><br>-->
<!--                    </ul>-->
<!--                </li>-->
<!--                <li class="search-container">-->
<!--                    <form>-->
<!--                        <input type="text" placeholder="搜索" name="search">-->
<!--                        <a href="#"><i class="iconfont">&#xe86e</i></a>-->
<!--                    </form>-->
<!--                </li>-->
<!--            </ul>-->
<!--            <ul class="header-right">-->
<!--                <li><a href="MyGoods.html">我的商品</a><span></span></li>-->
<!--                <li><a href="#">我的订单</a><span></span></li>-->
<!--                <li><a href="login.jsp">登录|注册</a><span></span></li>-->
<!--                <li class="cart">-->
<!--                    <a href="#"><i class="iconfont">&#xe63f</i>购物车(0)</a>-->
<!--                </li>-->
<!--            </ul>-->
<!--        </div>-->
<!--    </div>-->
<!--</div>-->

<div class="main">
    <div class="cart-filter-bart">
        搜索“${sessionScope.searchInput}”的结果
    </div>
    <center>
        <table class="cart-table" ></table>
        <tr>
            <div class="show_commodity">
                <c:forEach var="goods" items="${sessionScope.searchGoodsList}" varStatus="status">
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
<%--                <ul>--%>
<%--                    <li class="commodity1">--%>
<%--                        <div class="img-rounded commodity_pic">--%>
<%--                            <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                        </div>--%>
<%--                        <div class="commodity_text">--%>
<%--                            <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="commodity2">--%>
<%--                        <div class="commodity_pic">--%>
<%--                            <img src="img/1.jpg" class="img-responsive" alt="Responsive image" />--%>
<%--                        </div>--%>
<%--                        <div class="commodity_text">--%>
<%--                            <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="commodity3">--%>
<%--                        <div class="commodity_pic">--%>
<%--                            <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                        </div>--%>
<%--                        <div class="commodity_text">--%>
<%--                            <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--                <ul>--%>
<%--                    <li class="commodity1">--%>
<%--                        <div class="commodity_pic">--%>
<%--                            <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                        </div>--%>
<%--                        <div class="commodity_text">--%>
<%--                            <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="commodity2">--%>
<%--                        <div class="commodity_pic">--%>
<%--                            <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                        </div>--%>
<%--                        <div class="commodity_text">--%>
<%--                            <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="commodity3">--%>
<%--                        <div class="commodity_pic">--%>
<%--                            <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                        </div>--%>
<%--                        <div class="commodity_text">--%>
<%--                            <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--                <ul>--%>
<%--                    </li>--%>
<%--                    <li class="commodity1">--%>
<%--                        <div class="commodity_pic">--%>
<%--                            <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                        </div>--%>
<%--                        <div class="commodity_text">--%>
<%--                            <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="commodity2">--%>
<%--                        <div class="commodity_pic">--%>
<%--                            <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                        </div>--%>
<%--                        <div class="commodity_text">--%>
<%--                            <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="commodity3">--%>
<%--                        <div class="commodity_pic">--%>
<%--                            <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                        </div>--%>
<%--                        <div class="commodity_text">--%>
<%--                            <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--                <ul>--%>
<%--                    </li>--%>
<%--                    <li class="commodity1">--%>
<%--                        <div class="commodity_pic">--%>
<%--                            <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                        </div>--%>
<%--                        <div class="commodity_text">--%>
<%--                            <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="commodity2">--%>
<%--                        <div class="commodity_pic">--%>
<%--                            <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                        </div>--%>
<%--                        <div class="commodity_text">--%>
<%--                            <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="commodity3">--%>
<%--                        <div class="commodity_pic">--%>
<%--                            <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                        </div>--%>
<%--                        <div class="commodity_text">--%>
<%--                            <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                </ul>--%>
            </div>
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