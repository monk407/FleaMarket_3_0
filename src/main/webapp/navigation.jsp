<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
  String basePath = request.getScheme() + "://" +
          request.getServerName() + ":" + request.getServerPort() +
          request.getContextPath() + "/";
%>
<base href="<%=basePath%>" />
<%-- <!DOCTYPE html>--%>
<html>
	
<head>
    <title>Title</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=ege">
  <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
<%--  <link rel="stylesheet" href="css/index.css"/>--%>
  <link rel="stylesheet" type="text/css" href="static/iconfont.css" >
  <link rel="stylesheet" href="css/navigation1.css">
  <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/navigation.js"></script>
</head>
<body>
<div class="header">
  <div class="wrap">
    <div class="logo">
      <img src="img/image4.png"/>
    </div>
    <div class="nav">
      <ul class="header-left">
        <li class="first"><a href="index.jsp" >首页</a><span></span></li>
        <li class="navli"><a href="#">商品分类<i class="iconfont">&#xe87e</i></a><!-- <span></span> -->
          <ul class="ulson typeNav">

          </ul>
        </li>
        <li class="search-container">
<%--          <form>--%>
            <input type="text" placeholder="搜索" name="search" id="searchInput">
            <a href="#"><i class="iconfont" id="searchBtn">&#xe86e</i></a>
<%--          </form>--%>
        </li>
      </ul>
      <ul class="header-right">
<%--        <li class="MyGoods"><a href="/goods/GetMyGoodsPage.do?userid=${sessionScope.user.id}&pageNum=1">我的商品</a><span></span></li>--%>
<%--        <li class="GoodOrders"><a href="GoodsOrders.jsp" id="MySellOrder">我卖的</a><span></span></li>--%>
<%--        <li class="order"><a href="MyOrder.jsp" id="MyBuyGoods">我买的</a><span></span></li>--%>
        <c:if test="${sessionScope.user == null}">
            <li><a href="login.jsp">登录|注册</a><span></span></li>
        </c:if>
        <c:if test="${sessionScope.user != null}">
            <li>
                <div class="dropdown_box">
                    <div class="dropdown_button">
                        <a>个人中心</a>
                    </div>
                    <ul class="dropdown_content">
                        <li><a href="/user/MyIfro.do?userid=${sessionScope.user.id}" style="color: #0f0f0f">我的资料</a></li>
                        <li class="MyGoods"><a href="/goods/GetMyGoodsPage.do?userid=${sessionScope.user.id}&pageNum=1" style="color: #0f0f0f">我的商品</a></li>
                        <li class="GoodOrders"><a href="GoodsOrders.jsp" id="MySellOrder" style="color: #0f0f0f">我卖的</a></li>
                        <li class="order"><a href="MyOrder.jsp" id="MyBuyGoods" style="color: #0f0f0f">我买的</a></li>
                        <li><a href="/user/UserLogout.do" style="color: #0f0f0f">退出登录</a></li>
                    </ul>
                </div>
            </li>
        </c:if>
        <li class="cart">
<%--          <a href="shoppingCart.jsp"><i class="iconfont">&#xe63f</i>购物车(0)</a>--%>
          <c:if test="${!empty sessionScope.order}">
              <a href="javascript:;" id="shopCartNumber"><i class="iconfont">&#xe63f</i> 购物车(<c:out value="${fn:length(sessionScope.order.itemMap)}"></c:out>)</a>
          </c:if>
          <c:if test="${empty sessionScope.order}">
              <a href="javascript:;" id="shopCartNumber"><i class="iconfont">&#xe63f</i> 购物车(0)</a>
          </c:if>
        </li>
      </ul>
    </div>
  </div>
</div>
</body>

</html>
