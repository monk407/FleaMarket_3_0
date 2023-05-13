<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<base href="<%=basePath%>" />
<%--<!DOCTYPE html>--%>
<head>
    <meta charset="UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=ege">
    <link rel="stylesheet" href="css/register.css">
    <title>用户注册界面</title>
    <style>
        .i-inner{
            height: 100%;
            width: 100%;
            overflow: hidden;
            margin: 0;
            padding: 0;
            background: url(img/image2.jpg) no-repeat 0px 0px;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            -moz-background-size: 100% 100%;
        }
    </style>
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="js/register.js" charset="GB2312"></script>
</head>
<body>
<div class="header">
    <div class="wrap">
        <div class="logo">
            <img src="img/image1.png"/>
        </div>
        <h1>欢 迎 注 册 !</h1>
    </div>
</div>
<div class="container">
    <div class="login-wrap">
        <div class="login-banner">
            <div class="w">
                <div class="i-inner">
                    <div class="register-form">
                        <br>
                        <h1>新用户注册</h1>
                        <label for="username" style="margin-left: 50px">用户名</label>
                        <span class="p">*</span>
                        <input type="text" name="username" id="username" placeholder="请输入用户名" class="register"><br><br>
                        <label for="email" style="margin-left: 33px">邮箱地址</label>
                        <span class="q">*</span>
                        <input type="text" name="email" id="email" class="register" placeholder="请输入您的邮箱地址"><br><br>
                        <label for="pwd" style="margin-left: 33px">登录密码</label>
                        <span class="q">*</span>
                        <input type="password" name="password" id="pwd" class="register" placeholder="请输入登录密码"><br><br>
                        <!--	  						  <span class="p">*</span>-->
                        <label for="name" style="margin-left: 50px">收货人&nbsp&nbsp</label>
                        <input type="text" name="addressName" id="name" placeholder="请输入收货人姓名（选填）" class="register"><br><br>
                        <!--	  						  <span class="p">*</span>-->
                        <label for="phonenumber" style="margin-left: 50px">手机号&nbsp&nbsp</label>
                        <input type="text" name="phone" id="phonenumber" class="register"placeholder="请输入收货人电话号码（选填）"><br><br>
                        <!--	  						  <span class="q">*</span>-->
                        <label for="address" style="margin-left: 33px">收货地址&nbsp&nbsp</label>
                        <input type="text" name="address" id="address" class="register" placeholder="请输入收货人地址（选填）"><br><br>
                        <p class="yzm" style="padding-bottom: 15px">
                            <label for="ipt" style="margin-left: 50px">验证码</label>
                            <span class="q">*</span>
                            <input type="text" name="code" id="ipt" class="code" placeholder="请输入验证码">
                            <span class="show">
	  					      	<img id="kaptchaImage" src="${pageContext.request.contextPath}/user/getVerifyCode.do"
                                     onclick="change();">
	  					      	</span>
                        </p>
                        <input type="checkbox" class="checkbox" name="">
                        <span style="font-size:15px">我已阅读并同意《用户注册协议》</span>
                        <br>
                        <!-- <%--      <button type="button" name="registerBtn" id="registerBtn" value="同意以上协议并注册" class="submit" onclick="register(this)"></button><br>--%> -->
                        <button type="button" name="registerBtn" id="registerBtn" class="submit">注册</button><br>
                        <a href="index.jsp" class="left">返回首页</a>
                        <a href="login.jsp" class="right">开始登录</a>
                    </div>
                </div>
                <div class="w">
                    <div class="footer">www.FleaMarket.com © All rights Reserved</div>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    function change() {
        $('#kaptchaImage').click(function () {
            $(this).attr('src', '${pageContext.request.contextPath}/user/getVerifyCode.do?' + Math.floor(Math.random() * 100));
        })
    }
</script>
</body>
</html>