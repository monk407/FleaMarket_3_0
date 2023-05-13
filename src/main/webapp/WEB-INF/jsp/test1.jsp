<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<base href="<%=basePath%>" />
<html>
<head>
    <title>test1</title>
    ${message}

    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(function(){
            //在当前页面dom对象加载后，执行loadStudentData（）
            loadStudentData();
        })

        function loadStudentData(){
            $.ajax({
                url:"user/test2.do",
                type:"get",
                dataType:"json",
                success:function(data){
                    //清除旧的数据
                    $("#info").html("");
                    //增加新的数据
                    $.each(data,function(i,n){
                        $("#info").append("<tr>")
                            .append("<td>"+n.id+"</td>")
                            .append("<td>"+n.name+"</td>")
                            .append("<td>"+n.address+"</td>")
                            .append("</tr>")

                    })
                }
            })
        }
    </script>

</head>




<body>
<p>test1test1test1</p>

=====================================

<div align="center">
    <table>
        <thead>
        <tr>
            <td>学号</td>
            <td>姓名</td>
            <td>地址</td>
        </tr>
        </thead>
        <tbody id="info">

        </tbody>
    </table>
</div>



</body>
</html>
