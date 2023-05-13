<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String basePath = request.getScheme() + "://" +
			request.getServerName() + ":" + request.getServerPort() +
			request.getContextPath() + "/";
%>
<base href="<%=basePath%>" id="mybase"/>
<!--<!DOCTYPE html>-->
<html>
<head>
	<meta charset="utf-8">
	<title>我的商品上架</title>

	<link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
	<link rel="stylesheet" href="css/mygoods.css"/>
	<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=ege">
	<link rel="stylesheet" type="text/css" href="static/iconfont.css" >
	<link rel="stylesheet" href="css/navigation1.css">
	<script type="text/javascript" src="js/navigation.js"></script>
	<script type="text/javascript" src="js/MyGoods.js"></script>
</head>
<body>
<!-- 导航条 -->
<jsp:include page="navigation.jsp"/>
<%--<div class="header">
	<div class="wrap">
		<div class="logo">
			<img src="img/image4.png"/>
		</div>
		<div class="nav">
			<ul class="header-left">
				<li class="first"><a href="index.jsp" >首页</a><span></span></li>
				<li class="navli"><a href="#">商品分类<i class="iconfont">&#xe87e</i></a><!-- <span></span> -->
					<ul class="ulson typeNav">
						&lt;%&ndash;            <li class="lison"><a href="goods/sort.do?type=all">全部商品</a><span></span></li><br>&ndash;%&gt;
						&lt;%&ndash;            <li class="lison"><a href="goods/sort.do?type=1">计算机类</a><span></span></li><br>&ndash;%&gt;
						&lt;%&ndash;            <li class="lison"><a href="goods/sort.do?type=2">历史类</a><span></span></li><br>&ndash;%&gt;
						&lt;%&ndash;            <li class="lison"><a href="#">运动器材</a><span></span></li><br>&ndash;%&gt;
						&lt;%&ndash;            <li class="lison"><a href="#">书籍周刊</a><span></span></li><br>&ndash;%&gt;
						&lt;%&ndash;            <li class="lison"><a href="#">家用电器</a><span></span></li><br>&ndash;%&gt;
					</ul>
				</li>
				<li class="search-container">
					&lt;%&ndash;          <form>&ndash;%&gt;
					<input type="text" placeholder="搜索" name="search" id="searchInput">
					<a href="#"><i class="iconfont" id="searchBtn">&#xe86e</i></a>
					&lt;%&ndash;          </form>&ndash;%&gt;
				</li>
			</ul>
			<ul class="header-right">
				<li class="MyGoods"><a href="MyGoods.jsp">我的商品</a><span></span></li>
				<li class="GoodOrders"><a href="GoodsOrders.jsp">我卖的</a><span></span></li>
				<li class="order"><a href="order.jsp">我买的</a><span></span></li>
				<li><a href="login.jsp">登录|注册</a><span></span></li>
				<li class="cart">
					&lt;%&ndash;          <a href="shoppingCart.jsp"><i class="iconfont">&#xe63f</i>购物车(0)</a>&ndash;%&gt;
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
</div>--%>


<%-- <jsp:include page="navigation.jsp"/>--%>
<%--<div class="header">--%>
<%--	<div class="wrap">--%>
<%--		<div class="logo">--%>
<%--			<img src="img/image4.png"/>--%>
<%--		</div>--%>
<%--		<div class="nav">--%>
<%--			<ul class="header-left">--%>
<%--				<li class="first"><a href="index.html" >首页</a><span></span></li>--%>
<%--				<li class="navli"><a href="#">商品分类<i class="iconfont">&#xe87e</i></a><span></span>--%>
<%--					<ul class="ulson">--%>
<%--						<li class="lison"><a href="#">数码产品</a><span></span></li><br>--%>
<%--						<li class="lison"><a href="#">女生衣服</a><span></span></li><br>--%>
<%--						<li class="lison"><a href="#">男生衣服</a><span></span></li><br>--%>
<%--						<li class="lison"><a href="#">运动器材</a><span></span></li><br>--%>
<%--						<li class="lison"><a href="#">书籍周刊</a><span></span></li><br>--%>
<%--						<li class="lison"><a href="#">家用电器</a><span></span></li><br>--%>
<%--					</ul>--%>
<%--				</li>--%>
<%--				<li class="search-container">--%>
<%--					<form>--%>
<%--						<input type="text" placeholder="搜索" name="search">--%>
<%--						<a href="#"><i class="iconfont">&#xe86e</i></a>--%>
<%--					</form>--%>
<%--				</li>--%>
<%--			</ul>--%>
<%--			<ul class="header-right">--%>
<%--				<li><a href="MyGoods.jsp">我的商品</a><span></span></li>--%>
<%--				<li><a href="#">我的订单</a><span></span></li>--%>
<%--				<li><a href="login.jsp">登录|注册</a><span></span></li>--%>
<%--				<li class="cart">--%>
<%--					<a href="#"><i class="iconfont">&#xe63f</i>购物车(0)</a>--%>
<%--				</li>--%>
<%--			</ul>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--</div>--%>
<c:if test="${!empty sessionScope.user}">
	<div class="">

		<div class="">
			<p class="">欢迎您，${sessionScope.user.username} 先生/女生</p>

		</div>

	</div>
</c:if>
<!-- 商品信息 -->
<div class="container w">
	<input type="hidden" id="Myid" name="${sessionScope.user.id}">
	<ul>
		<h3>全部商品</h3>
	</ul>

	<div class="line"></div>
	<!-- 商品导航条 -->
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
				<div class="good_pic_nav">
					<p>图片</p>
				</div>
			</li>
			<li>
				<div class="good_price_nav">
					<p>价格</p>
				</div>
			</li>
			<li>
				<div class="good_info_nav">
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
				<div class="good_operation_nav">
					<p>操作</p>
				</div>
			</li>
		</ul>
	</div>
	<c:forEach var="good" items="${mygoodspage.list}" varStatus="statu">
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
					<div class="good_pic">
						<img src="../..${good.image}" class="img-responsive" alt="Responsive image"/>

					</div>
				</li>
				<li>
					<div class="good_price">
						<p>${good.price}</p>
					</div>
				</li>
				<li>
					<div class="good_info">
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
					<div class="good_operation">
						<a href="/goods/editGoodLoadType.do?goodsId=${good.id}"><button type="button" class="editBtn">修改</button></a>
						<button class="btn_delete" id="${good.id}">删除</button>
					</div>
				</li>
			</ul>
		</div>
	</c:forEach>
	<!-- 商品上架按钮 -->
	<a href="/goods/GoGoodAdd.do" style="color: #d9edf7"><button class="good_btn">添加商品</button></a>

	<br>
	<div style="text-align: center;">
		<c:if test="${mygoodspage.hasPreviousPage}"><a href="/goods/GetMyGoodsPage.do?userid=${mygoodspage.list[0].user.id}&pageNum=1">首页</a></c:if>
		<c:if test="${mygoodspage.hasPreviousPage}"><a
				href="/goods/GetMyGoodsPage.do?userid=${mygoodspage.list[0].user.id}&pageNum=${mygoodspage.prePage}">上一页</a></c:if>
		<c:forEach var="num" items="${mygoodspage.navigatepageNums}">
			<c:if test="${mygoodspage.pageNum == num}">
				<a style="color: red" href="/goods/GetMyGoodsPage.do?userid=${mygoodspage.list[0].user.id}&pageNum=${num}">[${num}]</a>
			</c:if>
			<c:if test="${mygoodspage.pageNum != num}">
				<a href="/goods/GetMyGoodsPage.do?userid=${mygoodspage.list[0].user.id}&pageNum=${num}">[${num}]</a>
			</c:if>
		</c:forEach>
		<c:if test="${mygoodspage.hasNextPage}"><a
				href="/goods/GetMyGoodsPage.do?userid=${mygoodspage.list[0].user.id}&pageNum=${mygoodspage.nextPage}">下一页</a>
		</c:if>
		<c:if test="${mygoodspage.hasNextPage}"><a
				href="/goods/GetMyGoodsPage.do?userid=${mygoodspage.list[0].user.id}&pageNum=${mygoodspage.pages}">尾页</a>
		</c:if>

		<input style="width: 40px; border: 1px" type="text" name="${mygoodspage.list[0].user.id}" id="goPage" class="input" value="1"
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
</body>
</html>