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
	<title>商品上新</title>

	<link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
	<link rel="stylesheet" href="css/good_add.css"/>
	<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=ege">
	<link rel="stylesheet" type="text/css" href="static/iconfont.css" >
	<link rel="stylesheet" href="css/navigation1.css">
	<script type="text/javascript" src="js/Good_add.js"></script>
</head>
<body>
<!-- 导航条 -->
<jsp:include page="navigation.jsp"/>

<div class="container">
	<div class="good">
		<h1>商品上新</h1>

		<form action="/goods/uploadNewGoods.do" method="post" enctype="multipart/form-data">
		<ul>
			<li>
				<p>商品名称*</p>
				<input class="good_textbox" name="goodsName" type="text" id="goodsName" placeholder="请输入商品名称"/>
			</li>
			<li>
				<p>商品详情图片</p>
<%--				<div class="good_img">--%>
<%--					<img style="width:188px; height:216px;"  id="img" src="">--%>
<%--&lt;%&ndash;					<form id="fileForm" name="fileForm" action="" method="post" enctype="multipart/form-data">&ndash;%&gt;--%>
<%--						<input type="file"  onchange="displayimg(this)"  name="myfilename" id="myfilename" >--%>
<%--&lt;%&ndash;					</form>&ndash;%&gt;--%>
<%--				</div>--%>
				<div class="good_img">
					<img style="width:188px; height:216px;" id="showImgFile" src="">
					<input type="file" name="imageFile" id="uploadImgFile" >
				</div>

			</li>
			<li>
				<p>商品价格*</p>
				<input class="good_textbox" type="text" id="goodsPrice" name="goodsPrice" placeholder="请输入商品价格"/>
			</li>
			<li>
				<p>商品信息*</p>
				<input class="good_textbox" type="text" id="goodsIntro" name="goodsIntro" placeholder="请输入商品信息"/>
			</li>
			<li>
				<p>商品库存*</p>
				<input class="good_textbox" type="text" id="goodsStock" name="goodsStock" placeholder="请输入商品库存"/>
			</li>
			<li>
				<p>商品类型*</p>
				<select id="type" name="type"  class="good_opt">
					<%--							<optgroup label="商品类型">--%>
					<c:forEach var="type" items="${sessionScope.types}" varStatus="statu">
						<%--								<option id="${type.id}" name="${type.id}" value="${type.name}" style="color: black;background:ghostwhite;">${type.name}</option>--%>
						<option id="${type.id}" name="${type.id}" value="${type.name}" >${type.name}</option>
					</c:forEach>
					</optgroup>
				</select>
			</li>
		</ul>

		<input  class="save" id="back" type="button" value="返回"/>
		<input type="hidden" id="Myid" name="${sessionScope.user.id}">
		<input  class="submit" id="submit" type="submit" value="提交"/>
		</form>
	</div>
	<div class="container foot_font">
		<p>www.FleaMarket.com © All rights Reserved</p>
	</div>
</div>

</body>
</html>
<script>
	function displayimg(input) {
		//获取第一个文件对象 （如果有多张时可使用循环files数组改变多个<img>的 src值）
		var file = input.files[0];
		//判断当前是否支持使用FileReader
		if (window.FileReader) {
			//创建读取文件的对象
			var fr = new FileReader();
			//以读取文件字符串的方式读取文件 但是不能直接读取file
			//因为文件的内容是存在file对象下面的files数组中的
			//该方法结束后图片会以data:URL格式的字符串（base64编码）存储在fr对象的result中
			fr.readAsDataURL(file);
			fr.onloadend = function () {
				document.getElementById("img").src = fr.result;
			}
		}
	}
</script>