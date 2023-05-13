<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<base href="<%=basePath%>"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta charset="utf-8">
    <title>商品类型管理</title>
    <link rel="stylesheet" href="../../../css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Type_list.css">
    <link rel="stylesheet" href="../../../bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="../../../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../../../js/Type_list.js" charset="GB2312"></script>
</head>

<body>
<div id="admin">
    <jsp:include page="../common/navigation%20_left.jsp"/>
    <div id="navBar">
        <ul class="navWrap">
            <li><span class="text"><a href="/admin/GoOrderTypeManage.do" style="color: #d9edf7">全部商品类型</a></span></li>
            <li><span class="text"><a href="/admin/GoAddOrderType.do" style="color: #d9edf7">添加商品类型</a></span></li>
        </ul>
        <!--        <div class="search">-->
        <!--            <input type="text">-->
        <!--            <button>-->
        <!--                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>-->
        <!--            </button>-->
        <!--        </div>-->
    </div>

    <div class="right">
        <div class="type_table">
            <div class="show_type_nav">
                <ul>
                    <li>
                        <div class="type_id_nav">
                            <p>ID</p>
                        </div>
                    </li>
                    <li>
                        <div class="type_name_nav">
                            <p>商品类型名称</p>
                        </div>
                    </li>
                    <li>
                        <div class="type_operation_nav">
                            <p>操作</p>
                        </div>
                    </li>
                </ul>
            </div>
            <c:forEach var="type" items="${typeList}" varStatus="statu">
                <c:if test="${type.id==1}">
                    <!-- 商品详情 -->
                    <div class="show_type">
                        <ul>
                            <li>
                                <div class="type_id">
                                    <p>${type.id}</p>
                                </div>
                            </li>
                            <li>
                                <div class="type_name">
                                    <p>${type.name}</p>
                                </div>
                            </li>
                            <li>
                                <div class="type_operation">
                                    <button class="btn_update" type="button" id="${type.id}" disabled>修改</button>
                                    <button class="btn_delete" type="button" id="${type.id}" disabled>删除</button>
                                </div>
                            </li>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${type.id!=1}">
                    <!-- 商品详情 -->
                    <div class="show_type">
                        <ul>
                            <li>
                                <div class="type_id">
                                    <p>${type.id}</p>
                                </div>
                            </li>
                            <li>
                                <div class="type_name">
                                    <p>${type.name}</p>
                                </div>
                            </li>
                            <li>
                                <div class="type_operation">
                                    <button class="btn_update" type="button" id="${type.id}">修改</button>
                                    <button class="btn_delete" type="button" id="${type.id}">删除</button>
                                </div>
                            </li>
                        </ul>
                    </div>
                </c:if>

            </c:forEach>

            <!-- 页脚 -->
            <div class="foot_font">
                <p>www.FleaMarket.com © All rights Reserved</p>
            </div>
        </div>
    </div>

</div>
</body>
</html>