$(function () {

    $("#Modifybtn").click(function () {

        var username = $("#username");
        var email = $("#email");
        var password1 = $("#pwd1");
        var password2 = $("#pwd2");
        if (password1.val() === password2.val() ){
            $.ajax({
                type: "post",
                url: "/user/ModifyPassword.do",
                data: {
                    "username": username.val(),
                    "email": email.val(),
                    "password2": password2.val()
                },
                dataType: "json",
                success: function (data) {
                    if (data){
                        alert("密码重置成功！！！")
                        document.location.href="/login.jsp";
                    }else {
                        alert("查无该用户,请查看用户名密码是否正确！！")
                    }
                }
            })
        }else alert("输入密码不一致！！！")
    })


})

