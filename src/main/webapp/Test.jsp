<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<base href="<%=basePath%>" />
<html>
<head>
    <title>test</title>
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="js/Login.js" charset="GB2312"></script>
</head>
<body>
<h2>Hello World!</h2>


<div align="center">
    <h3>test1 , test2</h3>
    <form action="/user/test1.do" method="post">
        <input type="submit" value="查询所有用户">
    </form>
    <br>
    <h3>test3</h3>
    <form action="/user/test3.do" method="post">
        <table>
            <tr>
                <td>姓名：</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>年龄：</td>
                <td><input type="text" name="age"></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><input type="submit" value="注册"></td>
            </tr>
        </table>
    </form>
    <br>


    <h3>test4</h3>
    <form action="/user/test4.do" method="post">
        <table>
            <tr>
                <td>姓名：</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>年龄：</td>
                <td><input type="text" name="age"></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><input type="submit" value="注册2"></td>
            </tr>
        </table>
    </form>

    <br>



</div>

test&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;aaa
<button type="button" class="LoginBtn" style="cursor:pointer">开始登录</button>

<br>
<a href="user/test5.do?msg=123">传参test5</a>

<img src="picture/1-1.jpg">
<p>=====================================</p>
<label>
<input id="sel_1" onchange="selectAll()" type="checkbox" value="1"/>全选/全不选
</label>
<input type="checkbox" value="2"/>
<input type="checkbox" value="3"/>
<input type="checkbox" value="4"/>
<input type="checkbox" value="5"/>
</body>
<script type="text/javascript">
    function selectAll(){
        var isCheck=$("#sel_1").is(':checked');  //获得全选复选框是否选中
        $("input[type='checkbox']").each(function() {
            this.checked = isCheck;       //循环赋值给每个复选框是否选中
        });
    }
</script>

<br>
<p>================================</p>
<div class="box">
    <table border="1" cellspacing="0" cellpadding="5" width="200" align="center">
        <thead>
        <tr>
            <th><input type="checkbox" value="0" id="cbAll"></th>
            <th>运动</th>
        </tr>
        </thead>
        <tbody id="tb">
        <tr>
            <td><input type="checkbox" value="1"></td>
            <td>跑步</td>
        </tr>
        <tr>
            <td><input type="checkbox" value="2"></td>
            <td>跳绳</td>
        </tr>
        <tr>
            <td><input type="checkbox" value="3"></td>
            <td>瑜伽</td>
        </tr>
        <tr>
            <td><input type="checkbox" value="4"></td>
            <td>游泳</td>
        </tr>
        <tr>
            <td><input type="checkbox" value="5"></td>
            <td>骑行</td>
        </tr>
        </tbody>
    </table>
</div>

<script>
    var all = document.querySelector('#cbAll');
    var sports = document.querySelector('#tb').querySelectorAll('input');

    // 给全选按钮绑定点击事件
    all.onclick = function() {
        console.log(all.checked);
        for (var i = 0; i < sports.length; i++) {
            sports[i].checked = all.checked;
        }
    }

    // 给每个小复选框绑定点击事件
    for (var i = 0; i < sports.length; i++) {
        sports[i].onclick = function() {
            // 控制全选按钮是否选中
            var flag = true;
            // 每次点击一个小框，都检查是否所有复选框都被选中
            for (var i = 0; i < sports.length; i++) {
                if (!sports[i].checked) {
                    flag = false;
                    break; // 只要有一个小复选框没有被选中，全选按钮就没被选中，可跳出循环，下面小复选框不用再判断
                }
            }
            all.checked = flag;
        }
    }
</script>

</body>
</html>
