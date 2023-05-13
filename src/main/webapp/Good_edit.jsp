
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<title>修改商品信息</title>
		
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=ege">
		<link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
		<link rel="stylesheet" href="css/Good_edit.css"/>
		<link rel="stylesheet" type="text/css" href="static/iconfont.css" >
		<link rel="stylesheet" href="css/navigation1.css">
		<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/Good_edit.js"></script>
	</head>
	<body>
		<!-- 导航条 -->
		<jsp:include page="navigation.jsp"/>

		<!-- 主体 -->
		<div class="container">
			<div class="good">
					<h1>修改商品信息</h1>
				<form action="/goods/editGoods.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="goodsId" value="${requestScope.goodsId}"/>
					<ul>
						<li>
							<p>商品名称*</p>
							<input type="text" name="goodsName" class="good_textbox" value="${sessionScope.edit_good.name}"/>
						</li>
						<li>
							<p>商品图片*</p>
							<div class="good_img">
<%--								<img style="width:188px; height:216px;" id="showEditFile" src="${sessionScope.picturePath}" />--%>
							<img style="width:188px; height:216px;" id="showEditFile" src="picture/${sessionScope.picturePath}" />
							</div>
							<input type="file" name="imageFile" id="editFile">
<%--							<button class="img_btn">选择文件</button>--%>
						</li>

						<li>
							<p>商品价格*</p>
							<input name="goodsPrice" type="text" class="good_textbox" value="${sessionScope.edit_good.price}"/>
						</li>
						<li>
							<p>商品信息*</p>
							<input type="text" name="goodsIntro" class="good_textbox" value="${sessionScope.edit_good.intro}"/>
						</li>
						<li>
							<p>商品库存*</p>
							<input type="text" name="goodsStock" class="good_textbox" value="${sessionScope.edit_good.stock}"/>
						</li>
						<li>
							<p>商品类型*</p>

							<select id="type" name="type" class="good_opt">
								<%--							<optgroup label="商品类型">--%>
								<c:forEach var="type" items="${sessionScope.types}" varStatus="statu">
									<c:if test="${sessionScope.edit_good.type.id == type.id}">
										<option id="${type.id}" name="${type.id}" value="${type.name}" selected>${type.name}</option>
									</c:if>
									<c:if test="${sessionScope.edit_good.type.id != type.id}">
										<option id="${type.id}" name="${type.id}" value="${type.name}">${type.name}</option>
									</c:if>
<%--								<option id="${type.id}" name="${type.id}" value="${type.name}" style="color: black;background:ghostwhite;">${type.name}</option>--%>
<%--									<option id="${type.id}" name="${type.id}" value="${type.name}" >${type.name}</option>--%>
								</c:forEach>
								</optgroup>
							</select>
						</li>
					</ul>
					<input  class="save" id="back" type="button" value="返回"/>
					<input type="hidden" id="Myid" name="${sessionScope.edit_good.user.id}">
					<input  class="save" type="submit" value="提交修改"/>
				</form>
				</div>
				<div class="foot_font">
					<p>www.FleaMarket.com © All rights Reserved</p>
				</div>
			</div>
		</div>
	</body>
</html>