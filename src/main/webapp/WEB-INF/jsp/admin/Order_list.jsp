<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>订单管理</title>
    <link rel="stylesheet" href="../../../css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Order_list.css">
    <link rel="stylesheet" href="../../../bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="../../../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../../../js/Order_list.js" charset="GB2312"></script>
</head>

<body>
<div id="admin">
    <jsp:include page="../common/navigation%20_left.jsp"/>
    <div id="navBar">
        <ul class="navWrap">
            <li><span class="text"><a href="/admin/AdminGetOrderPage.do?pageNum=1&status=0" style="color: #d9edf7">全部订单</a></span></li>
            <li><span class="text"><a href="/admin/AdminGetOrderPage.do?pageNum=1&status=1" style="color: #d9edf7">已付款</a></span></li>
            <li><span class="text"><a href="/admin/AdminGetOrderPage.do?pageNum=1&status=2" style="color: #d9edf7">配送中</a></span></li>
            <li><span class="text"><a href="/admin/AdminGetOrderPage.do?pageNum=1&status=3" style="color: #d9edf7">已完成</a></span></li>
        </ul>
        <div class="search">
            <input type="text" id="searchValue" placeholder="请输入搜索内容">
            <button type="button" class="searchBtn">
                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
            </button>
        </div>
    </div>
    <div class="right">
        <div class="order_table">
            <div class="show_order_nav">
                <ul>
                    <li>
                        <div class="order_id_nav">
                            <p>ID</p>
                        </div>
                    </li>
                    <li>
                        <div class="order_price_nav">
                            <p>总价</p>
                        </div>
                    </li>
                    <li>
                        <div class="order_detail_nav">
                            <p>商品详情</p>
                        </div>
                    </li>
                    <li>
                        <div class="order_info_nav">
                            <p>收货信息</p>
                        </div>
                    </li>
                    <li>
                        <div class="order_state_nav">
                            <p>订单状态</p>
                        </div>
                    </li>
                    <li>
                        <div class="order_buyer_nav">
                            <p>下单用户</p>
                        </div>
                    </li>
                    <li>
                        <div class="order_time_nav">
                            <p>下单时间</p>
                        </div>
                    </li>
                    <li>
                        <div class="order_seller_nav">
                            <p>卖家</p>
                        </div>
                    </li>
                    <li>
                        <div class="order_operation_nav">
                            <p>操作</p>
                        </div>
                    </li>
                </ul>
            </div>
            <%--订单详细信息,遍历获取到的订单列表，将迭代到的数据保存到order中--%>
            <c:forEach items="${sessionScope.orderpage.list}" var="order">
                <!-- 商品详情 -->
                <div class="show_order">
                    <ul>
                        <li>
                            <div class="order_id">
                                <p>${order.id}</p>
                            </div>
                        </li>
                        <li>
                            <div class="order_price">
                                <p>${order.total}</p>
                            </div>
                        </li>
                        <li>
                            <div class="order_detail">
                                <c:forEach items="${order.itemList}" var="item">
                                    <p>${item.goodsName}(${item.price}) x ${item.amount}</p>
                                </c:forEach>
                            </div>
                        </li>
                        <li>
                            <div class="order_info">
                                <p>${order.name}</p>
                                <p>${order.phone}</p>
                                <p>${order.address}</p>
                            </div>
                        </li>
                        <li>
                            <div class="order_state">
                                <p>
                                    <c:if test="${order.status==1}"><span style="color:red;">已付款</span></c:if>
                                    <c:if test="${order.status==2}"><span style="color:goldenrod;">配送中</span></c:if>
                                    <c:if test="${order.status==3}"><span style="color:green;">已完成</span></c:if>
                                </p>
                            </div>
                        </li>
                        <li>
                            <div class="order_buyer">
                                <p>${order.buyUser.username}</p>
                            </div>
                        </li>
                        <li>
                            <div class="order_time">
                                <p>${order.datetime}</p>
                            </div>
                        </li>
                        <li>
                            <div class="order_seller">
                                <%-- end="0"这里代表我只输出列表中的一个数据 因为是按一个同时下单的情况下，
                                     一个卖家生成一个订单在执行 所以通个订单的订单是一样的 所以只用输出一个即可 --%>
                                <c:forEach items="${order.itemList}" var="item" end="0">
                                    <p>${item.goods.user.username}</p>
                                </c:forEach>
                            </div>
                        </li>
                        <li>
                            <div class="order_operation">
                                    <%--                                <input hidden id="pageNum" value="${sessionScope.orderpage.pageNum}">--%>
                                    <%--                                <input hidden id="status" value="${sessionScope.status}">--%>
                                <button type="button" class="btn_delete" id="${order.id}" value="${sessionScope.orderpage.pageNum}" name="${sessionScope.status}" >删除</button>
                            </div>
                        </li>
                    </ul>
                </div>
            </c:forEach>


            <!--分页条-->
            <br>
            <div style="text-align: center;">
                <c:if test="${sessionScope.orderpage.hasPreviousPage}"><a href="/admin/AdminGetOrderPage.do?pageNum=1&status=${sessionScope.status}">首页</a></c:if>
                <c:if test="${sessionScope.orderpage.hasPreviousPage}"><a
                        href="/admin/AdminGetOrderPage.do?pageNum=${sessionScope.orderpage.prePage}&status=${sessionScope.status}">上一页</a></c:if>
                <c:forEach var="num" items="${sessionScope.orderpage.navigatepageNums}">
                    <c:if test="${sessionScope.orderpage.pageNum == num}">
                        <a style="color: red" href="/admin/AdminGetOrderPage.do?pageNum=${num}&status=${sessionScope.status}">[${num}]</a>
                    </c:if>
                    <c:if test="${sessionScope.orderpage.pageNum != num}">
                        <a href="/admin/AdminGetOrderPage.do?pageNum=${num}&status=${sessionScope.status}">[${num}]</a>
                    </c:if>
                </c:forEach>
                <c:if test="${sessionScope.orderpage.hasNextPage}"><a
                        href="/admin/AdminGetOrderPage.do?pageNum=${sessionScope.orderpage.nextPage}&status=${sessionScope.status}">下一页</a></c:if>
                <c:if test="${sessionScope.orderpage.hasNextPage}"><a
                        href="/admin/AdminGetOrderPage.do?pageNum=${sessionScope.orderpage.pages}&status=${sessionScope.status}">尾页</a></c:if>

                <input style="width: 50px" type="text" id="goPage" class="input" name="${status}"  value="1"
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