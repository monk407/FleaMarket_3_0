<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<base href="<%=basePath%>" />

<html>
<head>
    <meta charset="utf-8">
    <title>首页</title>

    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=ege">
    <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" type="text/css" href="static/iconfont.css" >
    <link rel="stylesheet" href="css/navigation1.css">
    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
<%--    <script type="text/javascript" src="js/navigation.js"></script>--%>
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
<%--                <li class="navli"><a href="#">商品分类<i class="iconfont">&#xe87e</i></a><span></span>--%>
<%--                    <ul class="ulson">--%>
<%--                        <li class="lison"><a href="#">数码产品</a><span></span></li><br>--%>
<%--                        <li class="lison"><a href="#">女生衣服</a><span></span></li><br>--%>
<%--                        <li class="lison"><a href="#">男生衣服</a><span></span></li><br>--%>
<%--                        <li class="lison"><a href="#">运动器材</a><span></span></li><br>--%>
<%--                        <li class="lison"><a href="#">书籍周刊</a><span></span></li><br>--%>
<%--                        <li class="lison"><a href="#">家用电器</a><span></span></li><br>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--                <li class="search-container">--%>
<%--                    <form>--%>
<%--                        <input type="text" placeholder="搜索" name="search">--%>
<%--                        <a href="#"><i class="iconfont">&#xe86e</i></a>--%>
<%--                    </form>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--            <ul class="header-right">--%>
<%--                <li><a href="MyGoods.jsp">我的商品</a><span></span></li>--%>
<%--                <li><a href="#">我的订单</a><span></span></li>--%>
<%--                <li><a href="login.jsp">登录|注册</a><span></span></li>--%>
<%--                <li class="cart">--%>
<%--                    <a href="#"><i class="iconfont">&#xe63f</i>购物车(0)</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<c:if test="${!empty sessionScope.user}">
    <div class="">

        <div class="">
            <p class="">欢迎您，${sessionScope.user.username} 先生/女生</p>

        </div>

    </div>
</c:if>
<div class="container">

<%--    <div class="box">--%>
<%--        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">--%>
<%--            <!-- Indicators -->--%>
<%--            <ol class="carousel-indicators">--%>
<%--                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>--%>
<%--                <li data-target="#carousel-example-generic" data-slide-to="1"></li>--%>
<%--                <li data-target="#carousel-example-generic" data-slide-to="2"></li>--%>
<%--                <li data-target="#carousel-example-generic" data-slide-to="3"></li>--%>
<%--            </ol>--%>

<%--            <!-- Wrapper for slides -->--%>
<%--            <div class="carousel-inner" role="listbox">--%>
<%--                <div class="item active divSize">--%>
<%--                    <a href="goods/goodsDetail.do?goodsid=${sessionScope.lunBo.get(0).id}">--%>
<%--                        <img style="width: 1100px;height: 300px;" src="${fn:substring(sessionScope.lunBo.get(0).image,1,fn:length(sessionScope.lunBo.get(0).image))}" alt="...">--%>
<%--                    </a>--%>
<%--                    <div class="carousel-caption indexCakeWordDiv">--%>
<%--                        ${sessionScope.lunBo.get(0).name}--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="item divSize">--%>
<%--                    <a href="goods/goodsDetail.do?goodsid=${sessionScope.lunBo.get(1).id}">--%>
<%--                        <img style="width: 1100px;height: 300px;"  src="${fn:substring(sessionScope.lunBo.get(1).image,1,fn:length(sessionScope.lunBo.get(1).image))}" alt="...">--%>
<%--                    </a>--%>
<%--                    <div class="carousel-caption indexCakeWordDiv">--%>
<%--                        ${sessionScope.lunBo.get(1).name}--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="item divSize">--%>
<%--                    <a href="goods/goodsDetail.do?goodsid=${sessionScope.lunBo.get(2).id}">--%>
<%--                        <img style="width: 1100px;height: 300px;" src="${fn:substring(sessionScope.lunBo.get(2).image,1,fn:length(sessionScope.lunBo.get(2).image))}" alt="...">--%>
<%--                    </a>--%>
<%--                    <div class="carousel-caption indexCakeWordDiv">--%>
<%--                        ${sessionScope.lunBo.get(2).name}--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="item divSize">--%>
<%--                    <a href="goods/goodsDetail.do?goodsid=${sessionScope.lunBo.get(3).id}">--%>
<%--                        <img style="width: 1100px;height: 300px;" src="${fn:substring(sessionScope.lunBo.get(3).image,1,fn:length(sessionScope.lunBo.get(3).image))}" alt="...">--%>
<%--                    </a>--%>
<%--                    <div class="carousel-caption indexCakeWordDiv">--%>
<%--                        ${sessionScope.lunBo.get(3).name}--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--            </div>--%>

<%--            <!-- Controls -->--%>
<%--            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">--%>
<%--                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>--%>
<%--                <span class="sr-only">Previous</span>--%>
<%--            </a>--%>
<%--            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">--%>
<%--                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>--%>
<%--                <span class="sr-only">Next</span>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="picture">
            <img src="img/welcome.jpg" width="1000px" height="120px">
    </div>
<%--    </div>--%>
    <!-- 商品 -->
    <div class="show_commodity">

        <ul id="recommendGoods">
<%--            <h2>推荐商品</h2>--%>
<%--            <li class="commodity1">--%>
<%--                <div class="img-rounded commodity_pic">--%>
<%--                    <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                </div>--%>
<%--                <div class="commodity_text">--%>
<%--                    <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--            <li class="commodity2">--%>
<%--                <div class="commodity_pic">--%>
<%--                    <img src="img/1.jpg" class="img-responsive" alt="Responsive image" />--%>
<%--                </div>--%>
<%--                <div class="commodity_text">--%>
<%--                    <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--            <li class="commodity3">--%>
<%--                <div class="commodity_pic">--%>
<%--                    <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                </div>--%>
<%--                <div class="commodity_text">--%>
<%--                    <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                </div>--%>
<%--            </li>--%>
        </ul>
<%--        <ul>--%>
<%--            <li class="commodity1">--%>
<%--                <div class="commodity_pic">--%>
<%--                    <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                </div>--%>
<%--                <div class="commodity_text">--%>
<%--                    <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--            <li class="commodity2">--%>
<%--                <div class="commodity_pic">--%>
<%--                    <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                </div>--%>
<%--                <div class="commodity_text">--%>
<%--                    <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--            <li class="commodity3">--%>
<%--                <div class="commodity_pic">--%>
<%--                    <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                </div>--%>
<%--                <div class="commodity_text">--%>
<%--                    <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--        </ul>--%>
        <li id="hotGoodsLi">
<%--            <h2>热销商品</h2>--%>
<%--            <ul>--%>
<%--                <li class="commodity1">--%>
<%--                    <div class="commodity_pic">--%>
<%--                        <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                    </div>--%>
<%--                    <div class="commodity_text">--%>
<%--                        <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                    </div>--%>
<%--                </li>--%>
<%--                <li class="commodity2">--%>
<%--                    <div class="commodity_pic">--%>
<%--                        <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                    </div>--%>
<%--                    <div class="commodity_text">--%>
<%--                        <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                    </div>--%>
<%--                </li>--%>
<%--                <li class="commodity3">--%>
<%--                    <div class="commodity_pic">--%>
<%--                        <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                    </div>--%>
<%--                    <div class="commodity_text">--%>
<%--                        <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                    </div>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--            <ul>--%>
<%--                </li>--%>
<%--                <li class="commodity1">--%>
<%--                    <div class="commodity_pic">--%>
<%--                        <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                    </div>--%>
<%--                    <div class="commodity_text">--%>
<%--                        <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                    </div>--%>
<%--                </li>--%>
<%--                <li class="commodity2">--%>
<%--                    <div class="commodity_pic">--%>
<%--                        <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                    </div>--%>
<%--                    <div class="commodity_text">--%>
<%--                        <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                    </div>--%>
<%--                </li>--%>
<%--                <li class="commodity3">--%>
<%--                    <div class="commodity_pic">--%>
<%--                        <img src="img/1.jpg" class="img-responsive" alt="Responsive image"/>--%>
<%--                    </div>--%>
<%--                    <div class="commodity_text">--%>
<%--                        <a href="#" class="word_size">【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</a>--%>
<%--                    </div>--%>
<%--                </li>--%>
<%--            </ul>--%>
        </li>
    </div>

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
</body>
</html>