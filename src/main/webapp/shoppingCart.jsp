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
        <title>购物车</title>
        <link rel="stylesheet" href="./css/shoppingCart.css" />
        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
		<link rel="stylesheet" href="css/index.css"/>
		<link rel="stylesheet" type="text/css" href="static/iconfont.css" >
		<link rel="stylesheet" href="css/navigation1.css">
        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="js/shoppingCart.js"></script>
        <script type="text/javascript" src="js/navigation.js"></script>
    </head>
    <body>
    <!-- 导航条 -->
    <jsp:include page="navigation.jsp"/>
<%--    <div class="header">--%>
<%--        <div class="wrap">--%>
<%--            <div class="logo">--%>
<%--                <img src="img/image4.png"/>--%>
<%--            </div>--%>
<%--            <div class="nav">--%>
<%--                <ul class="header-left">--%>
<%--                    <li class="first"><a href="index.jsp" >首页</a><span></span></li>--%>
<%--                    <li class="navli"><a href="#">商品分类<i class="iconfont">&#xe87e</i></a><!-- <span></span> -->--%>
<%--                        <ul class="ulson typeNav">--%>
<%--                            &lt;%&ndash;            <li class="lison"><a href="goods/sort.do?type=all">全部商品</a><span></span></li><br>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;            <li class="lison"><a href="goods/sort.do?type=1">计算机类</a><span></span></li><br>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;            <li class="lison"><a href="goods/sort.do?type=2">历史类</a><span></span></li><br>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;            <li class="lison"><a href="#">运动器材</a><span></span></li><br>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;            <li class="lison"><a href="#">书籍周刊</a><span></span></li><br>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;            <li class="lison"><a href="#">家用电器</a><span></span></li><br>&ndash;%&gt;--%>
<%--                        </ul>--%>
<%--                    </li>--%>
<%--                    <li class="search-container">--%>
<%--                        &lt;%&ndash;          <form>&ndash;%&gt;--%>
<%--                        <input type="text" placeholder="搜索" name="search" id="searchInput">--%>
<%--                        <a href="#"><i class="iconfont" id="searchBtn">&#xe86e</i></a>--%>
<%--                        &lt;%&ndash;          </form>&ndash;%&gt;--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--                <ul class="header-right">--%>
<%--                    <li class="MyGoods"><a href="MyGoods.jsp">我的商品</a><span></span></li>--%>
<%--                    <li class="GoodOrders"><a href="GoodsOrders.jsp">我卖的</a><span></span></li>--%>
<%--                    <li class="order"><a href="order.jsp">我买的</a><span></span></li>--%>
<%--                    <li><a href="login.jsp">登录|注册</a><span></span></li>--%>
<%--                    <li class="cart">--%>
<%--                        &lt;%&ndash;          <a href="shoppingCart.jsp"><i class="iconfont">&#xe63f</i>购物车(0)</a>&ndash;%&gt;--%>
<%--                        <c:if test="${!empty sessionScope.order}">--%>
<%--                            <a href="javascript:;" id="shopCartNumber"><i class="iconfont">&#xe63f</i> 购物车(<c:out value="${fn:length(sessionScope.order.itemMap)}"></c:out>)</a>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${empty sessionScope.order}">--%>
<%--                            <a href="javascript:;" id="shopCartNumber"><i class="iconfont">&#xe63f</i> 购物车(0)</a>--%>
<%--                        </c:if>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <!-- <jsp:include page="navigation.jsp"/> -->--%>
<%--        <div class="header">--%>
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
		<div class="main">
            <div class="cart-filter-bart">
                我的购物车
            </div>
            <table class="cart-table" >
                <!-- 首行 -->
                <tr>
                    <td style="width:5vw"><input type="checkbox" id="checkboxAll" name="" class="choose_all"></td>
                    <td style="width:10vw"><span style="margin-left: -10px;">全选</span></td>
                    <td style="width:38vw">商品信息</td>
                    <td style="width:13vw">单价（元）</td>
                    <td style="width:13vw">数量</td>
                    <td style="width:13vw">金额（元）</td>
                    <td style="width:8vw">操作</td>
                </tr>

                <!-- 商品信息 -->
                <c:forEach var="orderitem" items="${sessionScope.order.itemMap}">
                    <tr class="cart-table-tr cartTr">
                        <td><input type="checkbox" class="singleCheckbox"></td>
                        <td class="tal"><a href="#" class="pic"><img src="images/pic02.jpg" alt=""></a></td>
                        <td class="tal"><a href="#">${orderitem.value.goodsName}</a></td>
                        <td>
                            <b class="unit oiSinglePrice">${orderitem.value.price}</b>
                        </td>
                        <td>
                            <div class="amount">
                                <button href="#" class="Increase addOiCount">+</button>
                                <input type="text" value="${orderitem.value.amount}" class="unum goodsCountInCart">
                                <input class='hiddenInputCart' type='hidden' name='goodsid' value='${orderitem.value.goods.id}'>
                                <input class="hiddenGoodsSaleUserId" type="hidden" name="saleUserId" value="${orderitem.value.goods.user.id}">
                                <input class="nowGoodsCountInCart" type="hidden" value="${orderitem.value.amount}">
                                <button href="#" class="Reduce subOiCount">-</button>
                            </div>
                        </td>
                        <td><b class="u-price orderitemPrice oiPrice">${orderitem.value.amount*orderitem.value.price}</b></td>
                        <td><button href="#" class="good_operation delCartBtn">删除</button></td>
                    </tr>
                </c:forEach>
<%--                <tr class="cart-table-tr">--%>
<%--                    <td><input type="checkbox" checked></td>--%>
<%--                    <td class="tal"><a href="#" class="pic"><img src="images/pic02.jpg" alt=""></a></td>--%>
<%--                    <td class="tal"><a href="#">凌美Lamy Safari钢笔/签字笔T52黑色墨水</a></td>--%>
<%--                    <td>--%>
<%--                        <b class="unit">129.00</b>--%>
<%--                    </td>--%>
<%--                    <td>--%>
<%--                        <div class="amount">--%>
<%--                            <button href="#" class="Increase">+</button>--%>
<%--                            <input type="text" value="1" class="unum">--%>
<%--                            <button href="#" class="Reduce">-</button>--%>
<%--                        </div>--%>
<%--                    </td>--%>
<%--                    <td><b class="u-price">129.00</b></td>--%>
<%--                    <td><button href="#" class="good_operation">删除</button></td>--%>
<%--                </tr>--%>
<%--                <tr class="cart-table-tr">--%>
<%--                    <td><input type="checkbox" checked></td>--%>
<%--                    <td class="tal"><a href="#" class="pic"><img src="images/pic02.jpg" alt=""></a></td>--%>
<%--                    <td class="tal"><a href="#">凌美Lamy Safari钢笔/签字笔T52黑色墨水</a></td>--%>
<%--                    <td>--%>
<%--                        <b class="unit">129.00</b>--%>
<%--                    </td>--%>
<%--                    <td>--%>
<%--                        <div class="amount">--%>
<%--                            <button href="#" class="Increase">+</button>--%>
<%--                            <input type="text" value="1" class="unum">--%>
<%--                            <button href="#" class="Reduce">-</button>--%>
<%--                        </div>--%>
<%--                    <td><b class="u-price">129.00</b></td>--%>
<%--                    <td><button href="#" class="good_operation">删除</button></td>--%>
<%--                </tr>--%>
<%--                <tr class="cart-table-tr">--%>
<%--                    <td><input type="checkbox" checked></td>--%>
<%--                    <td class="tal"><a href="#" class="pic"><img src="images/pic02.jpg" alt=""></a></td>--%>
<%--                    <td class="tal"><a href="#">凌美Lamy Safari钢笔/签字笔T52黑色墨水</a></td>--%>
<%--                    <td>--%>
<%--                        <br>--%>
<%--                        <b class="unit">129.00</b>--%>
<%--                    </td>--%>
<%--                    <td>--%>
<%--                        <div class="amount">--%>
<%--                            <button href="#" class="Increase">+</button>--%>
<%--                            <input type="text" value="1" class="unum">--%>
<%--                            <button href="#" class="Reduce">-</button>--%>
<%--                        </div>--%>
<%--                    </td>--%>
<%--                    <td><b class="u-price">129.00</b></td>--%>
<%--                    <td><button href="#" class="good_operation">删除</button></td>--%>
<%--                </tr>--%>
                <tr class="count">
                    <td colspan="7">
                        <div class="jiesuan clearfix">
                            <div class="left fl">
<%--                                <p><input type="checkbox" id="checkboxDelAll" name="" class="choose_all"> 全选&nbsp;&nbsp;&nbsp;--%>
                                    <a href="javascript:;" class="del_check delSomeCartGood">删除选中商品</a>
<%--                                </p>--%>
                            </div>
                            <div class="right fr clearfix">
<%--                                <p>商品总计：￥465.00</p>--%>
<%--                                <p>活动优惠：-￥0.00</p>--%>
<%--                                <p>已选商品<span class="red t-number"> 0 </span>件 总价(不含运费、税费)：<span class="red t-price">￥0.00</span></p>--%>
                                <p>已选商品<span class="red t-number oiCount"> 0 </span>件 总价 ：<span class="red t-price orderPrice">￥0.00</span></p>
                                <!-- <div><a href="#" class="btn pay">结算</a></div> -->
                                <a href="javascript:;" class="btn pay fr" id="submitShopCartBtn">结算</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
