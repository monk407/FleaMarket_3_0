<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String basePath = request.getScheme() + "://" +
			request.getServerName() + ":" + request.getServerPort() +
			request.getContextPath() + "/";
%>
<base href="<%=basePath%>"/>
<!--<!DOCTYPE html>-->
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=ege">

	<link rel="stylesheet" type="text/css" href="static/iconfont.css">
	<link rel="stylesheet" href="css/navigation1.css">
	<link rel="stylesheet" href="css/GoodsOrders.css"/>
	<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/navigation.js"></script>
	<script type="text/javascript" src="js/GoodsOrders.js"></script>
	<title>商品订单</title>
</head>
<body>
<%--导航条--%>
<%--<jsp:include page="navigation.jsp"/>--%>
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

<%--	<jsp:include page="navigation.jsp"/>--%>
<%--		<div class="header">--%>
<%--			<div class="wrap">--%>
<%--				<div class="logo">--%>
<%--					<img src="img/image4.png"/>--%>
<%--				</div>--%>
<%--				<div class="nav">--%>
<%--					<ul class="header-left">--%>
<%--						<li class="first"><a href="#" >首页</a><span></span></li>--%>
<%--						<li class="navli"><a href="#">商品分类<i class="iconfont">&#xe87e</i></a><span></span>--%>
<%--							<ul class="ulson">--%>
<%--								<li class="lison"><a href="#">数码产品</a><span></span></li><br>--%>
<%--								<li class="lison"><a href="#">女生衣服</a><span></span></li><br>--%>
<%--								<li class="lison"><a href="#">男生衣服</a><span></span></li><br>--%>
<%--								<li class="lison"><a href="#">运动器材</a><span></span></li><br>--%>
<%--								<li class="lison"><a href="#">书籍周刊</a><span></span></li><br>--%>
<%--								<li class="lison"><a href="#">家用电器</a><span></span></li><br>--%>
<%--							</ul>--%>
<%--						</li>--%>
<%--						<li class="search-container">--%>
<%--							<form>--%>
<%--								<input type="text" placeholder="搜索" name="search">--%>
<%--								<a href="#"><i class="iconfont">&#xe86e</i></a>--%>
<%--							</form>--%>
<%--						</li>--%>
<%--					</ul>--%>
<%--					<ul class="header-right">--%>
<%--						<li><a href="#">我的商品</a><span></span></li>--%>
<%--						<li><a href="#">我的订单</a><span></span></li>--%>
<%--						<li><a href="login.jsp">登录|注册</a><span></span></li>--%>
<%--						<li class="cart">--%>
<%--							<a href="#"><i class="iconfont">&#xe63f</i>购物车(0)</a>--%>
<%--						</li>--%>
<%--					</ul>	--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<c:if test="${!empty sessionScope.user}">
	<div class="">

		<div class="">
			<p class="" style="text-align: left">欢迎您，${sessionScope.user.username} 先生/女生</p>
		</div>

	</div>
</c:if>
<div class="container w">
	<!-- 商品导航条 -->
	<h2>商品订单</h2>
	<div class="line"></div>
	<div class="show_goodorders_nav">
		<ul>
			<li>
				<div class="good_id_nav">
					<p>ID</p>
				</div>
			</li>
			<li>
				<div class="good_price_nav">
					<p>价格</p>
				</div>
			</li>
			<li>
				<div class="good_info_nav">
					<p>商品详情</p>
				</div>
			</li>
			<li>
				<div class="user_info_nav">
					<p>收货信息</p>
				</div>
			</li>
			<li>
				<div class="order_type_nav">
					<p>订单状态</p>
				</div>
			</li>
			<li>
				<div class="order_username_nav">
					<p>下单用户</p>
				</div>
			</li>
			<li>
				<div class="order_time_nav">
					<p>下单时间</p>
				</div>
			</li>
			<li>
				<div class="goodorders_operation_nav">
					<p>操作</p>
				</div>
			</li>
		</ul>
	</div>
	<!-- 商品详情 -->
<div id="mySellOrderDiv">
<%--	<div class="show_goodorders">--%>
<%--		<ul>--%>
<%--			<li>--%>
<%--				<div class="good_id">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="good_price">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="good_info">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="user_info">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="order_type">--%>
<%--					<p>已付款</p>--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="order_username">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="order_time">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="goodorders_operation">--%>
<%--					<button type="submit" class="shipping">发货</button>--%>
<%--					<br/>--%>
<%--					<button type="submit" class="delete"></a>删除</button>--%>
<%--				</div>--%>
<%--			</li>--%>
<%--		</ul>--%>
<%--	</div>--%>

<%--	<div class="show_goodorders">--%>
<%--		<ul>--%>
<%--			<li>--%>
<%--				<div class="good_id">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="good_price">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="good_info">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="user_info">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="order_type">--%>
<%--					<p>已发货</p>--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="order_username">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="order_time">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="goodorders_operation">--%>
<%--					<button type="submit" class="shipping">完成</button>--%>
<%--					<br/>--%>
<%--					<button type="submit" class="delete"></a>删除</button>--%>
<%--				</div>--%>
<%--			</li>--%>
<%--		</ul>--%>
<%--	</div>--%>
<%--	<div class="show_goodorders">--%>
<%--		<ul>--%>
<%--			<li>--%>
<%--				<div class="good_id">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="good_price">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="good_info">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="user_info">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="order_type">--%>
<%--					<p>已完成</p>--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="order_username">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="order_time">--%>
<%--					<!-- <p></p> -->--%>
<%--				</div>--%>
<%--			</li>--%>
<%--			<li>--%>
<%--				<div class="goodorders_operation">--%>
<%--					<button type="submit" class="delete"></a>删除</button>--%>
<%--				</div>--%>
<%--			</li>--%>
<%--		</ul>--%>
<%--	</div>--%>
</div>
	<!-- 页脚 -->
	<div class="container foot_font">
		<p>www.FleaMarket.com © All rights Reserved</p>
	</div>
</div>

</body>
</html>