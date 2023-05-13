<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String basePath = request.getScheme() + "://" +
			request.getServerName() + ":" + request.getServerPort() +
			request.getContextPath() + "/";
%>
<base href="<%=basePath%>" />

<%--<!DOCTYPE html>--%>
<html>
	<head>
		<meta charset="utf-8">
		<title>商品详情</title>
		
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=ege">
		<link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
		<link rel="stylesheet" href="css/GoodDetail.css"/>
		<link rel="stylesheet" type="text/css" href="static/iconfont.css" >
		<link rel="stylesheet" href="css/navigation1.css">
		<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/GoodDetail.js"></script>
	</head>
	<body>
		<!-- 导航条 -->
<%--		<div class="header">--%>
<%--			<div class="wrap">--%>
<%--				<div class="logo">--%>
<%--					<img src="img/image4.png"/>--%>
<%--				</div>--%>
<%--				<div class="nav">--%>
<%--					<ul class="header-left">--%>
<%--						<li class="first"><a href="index.jsp" >首页</a><span></span></li>--%>
<%--						<li class="navli"><a href="#">商品分类<i class="iconfont">&#xe87e</i></a><!-- <span></span> -->--%>
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
<%--						<li class="MyGoods"><a href="MyGoods.jsp">我的商品</a><span></span></li>--%>
<%--						<li class="GoodOrders"><a href="GoodsOrders.jsp">我卖的</a><span></span></li>--%>
<%--						<li class="order"><a href="order.jsp">我买的</a><span></span></li>--%>
<%--						<li><a href="login.jsp">登录|注册</a><span></span></li>--%>
<%--						<li class="cart">--%>
<%--							<a href="shoppingCart.jsp" id="shopCartNumber"><i class="iconfont">&#xe63f</i>购物车(0)</a>--%>
<%--						</li>--%>
<%--					</ul>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
			<jsp:include page="navigation.jsp"/>
<%--		<div class="header">--%>
<%--			<div class="wrap">--%>
<%--				<div class="logo">--%>
<%--					<img src="img/image4.png"/>--%>
<%--				</div>--%>
<%--				<div class="nav">--%>
<%--					<ul class="header-left">--%>
<%--						<li class="first"><a href="index.html" >首页</a><span></span></li>--%>
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
<%--						<li><a href="MyGoods.html">我的商品</a><span></span></li>--%>
<%--						<li><a href="#">我的订单</a><span></span></li>--%>
<%--						<li><a href="login.jsp">登录|注册</a><span></span></li>--%>
<%--						<li class="cart">--%>
<%--							<a href="#"><i class="iconfont">&#xe63f</i>购物车(0)</a>--%>
<%--						</li>--%>
<%--					</ul>	--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
		
		<!--主体 -->				
		<div class="center_con clearfix">
			<div class="main_menu fl">
				<img src=".${good.image}" >
			</div>
			<div class="goods_detail_list fr">
<%--				<h3>复原力 里克汉森 著</h3>--%>
				<h3>${good.name}</h3>
<%--				<p>【正版】 复原力 里克汉森 著 积极心理学 脑科学 大众心理学面对逆境书籍</p>--%>
				<p>${good.intro}</p>
				<div class="prize_bar">
<%--					<div class="show_prize fl">￥<em>16.80</em></div>--%>
					<div class="show_prize fl">￥<em id="detailGoodPrice">${good.price}</em></div>
					<div class="show_unit fl">单位：500g</div>
				</div>
				<div class="goods_num clearfix">
					<div class="num_name fl">数量：</div>
					<div class="num_add fl">
						<input id="goodsCountInDetail" type="text" class="num_show fl" value="1">
						<a href="javascript:;" id="addGoodsCount" class="add fr">+</a>
						<a href="javascript:;" id="subGoodsCount" class="minus fr">-</a>
						<input class='hiddenInput' type='hidden' name='goodsid' value='${good.id}'>
						<input id="nowGoodsCountInDetail" type="hidden" value="1">
					</div>
				</div>
<%--				<div class="total">总价：<em>16.80元</em></div>--%>
				<div class="total">总价：<em id="detailTotalPrice">${good.price}元</em></div>
				<div class="operate_btn">
					<!-- <a href="" class="buy_btn">立即购买</a> -->
					<a href="javascript:;" id="insertShopCart" class="add_cart">加入购物车</a>
				</div>
			</div>
		</div>
	</body>
</html>