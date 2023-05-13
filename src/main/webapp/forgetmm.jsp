<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String basePath = request.getScheme() + "://" +
request.getServerName() + ":" + request.getServerPort() +
request.getContextPath() + "/";
%>
<base href="<%=basePath%>" />
<html>
	<head>
		<meta charset="utf-8">
		<title>忘记密码</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=ege">
		<link rel="stylesheet" href="css/forgetmm.css">
		<style>
		   .i-inner{
		    	height: 100%;
				width: 100%;
				overflow: hidden;
				margin: 0;
				padding: 0;
				background: url(img/image1.jpg) no-repeat 0px 0px;
				background-repeat: no-repeat;
				background-size: 100% 100%;
				-moz-background-size: 100% 100%;
		    }
		</style>
		
		<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
		<script type="text/javascript" src="js/forgetmm.js" charset="GB2312"></script>
	</head>
	<body>
		<div class="header">
		    <div class="wrap">
				<div class="logo">
					<img src="img/image1.png"/>
				</div>
			<h1>找 回 密 码 !</h1>
			</div>
		</div>	
		<div class="container">
			<div class="login-wrap">
				<div class="login-banner">
					<div class="w">
						<div class="i-inner">
							<div class="login-form">
								<br>
								<h1>找回密码</h1>
								<label for="username">用户名</label><br>
								<input type="text" name="username" id="username" class="input" value="" placeholder="请输入用户名"><br>
								<label for="email">邮箱</label><br>
								<input type="text" name="email" id="email" class="input" value="" placeholder="请输入邮箱"><br>
								<label for="pwd1">新密码</label><br>
								<input type="password" name="password" id="pwd1" class="input" value="" placeholder="请输入密码"><br>
								<label for="pwd2">确认密码</label><br>
								<input type="password" name="password" id="pwd2" class="input" value="" placeholder="再次输入输入密码"><br>
								<button type="button" class="submit" id="Modifybtn">确认修改</button>
								<br>
								<a href="login.jsp" class="left">开始登录</a>
								<a href="register.jsp" class="right">注册账号</a>
							</div>
						</div>
						<div class="w">
							<div class="footer">www.FleaMarket.com © All rights Reserved</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</body>
</html>