<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<base href="<%=basePath%>"/>
<%--<!DOCTYPE html>--%>
<html>

<head>
    <meta charset="UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=ege">
    <link rel="stylesheet" href="css/login.css">
    <title>登录界面</title>
    <style>
       .i-inner{
        	height: 100%;
			width: 100%;
			overflow: hidden;
			margin: 0;
			padding: 0;
			background: url(img/image3.jpg) no-repeat 0px 0px;
			background-repeat: no-repeat;
			background-size: 100% 100%;
			-moz-background-size: 100% 100%;
        }
    </style>

    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="js/Login.js" charset="GB2312"></script>
</head>

<body>
	<div class="header">
	    <div class="wrap">
			<div class="logo">
				<img src="img/image1.png"/>
			</div>
		<h1>欢 迎 登 录 !</h1>
		</div>
	</div>	
	<div class="container">
		<div class="login-wrap">
			<div class="login-banner">
				<div class="w">
					<div class="i-inner">
						<div class="login-form">
							<br>
							<h1>用户登录</h1>
							<label for="usernameOrEmail">用户名/邮箱</label><br>
							<input type="text" name="ue" id="usernameOrEmail" class="input" value="" placeholder="请输入用户名"><br>
							<label for="pwd">密码</label><br>
							<input type="password" name="password" id="pwd" class="input" value="" placeholder="请输入密码"><br>
							<p class="yzm">
								<label for="ipt">验证码</label><br>
								<input type="text" name="code" id="ipt" class="code" placeholder="验证码">
								<span class="show">
								<img id="kaptchaImage" src="${pageContext.request.contextPath}/user/getVerifyCode.do"
								onclick="change();">
								</span>
							</p>
						
							<div class="checkbox">
								<a href="forgetmm.jsp" class="forget">忘记密码</a>
							</div>
							<button type="button" class="submit LoginBtn" id="btn">开始登录</button>
							<br>
							<a href="index.jsp" class="left">返回首页</a>
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
<script type="text/javascript">

    function change() {
        $('#kaptchaImage').click(function () {
            $(this).attr('src', '${pageContext.request.contextPath}/user/getVerifyCode.do?' + Math.floor(Math.random() * 100));
        })
    }

</script>
</body>

</html>