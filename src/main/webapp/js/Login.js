$(function () {

    $(".LoginBtn").click(function () {

        var ue = $("#usernameOrEmail");
        var password = $("#pwd");
        var ipt = $("#ipt");
        //alert(ue.val() + password.val());
        $.ajax({

            type: "post",
            url: "/user/login.do",
            data: {
                "ipt":ipt.val(),
                "ue": ue.val(),
                "password": password.val()
            },
            dataType: "json",
            success: function (data) {

                //判断用户是否存在
                if (data.isUser) {
                    if (data.codefalg){
                        //判断用户是否为管理员
                        if (data.isAdmin) {
                            document.location.href = "/user/toAdminIndex.do";
                        } else {
                            document.location.href = "/index.jsp";
                        }
                    }else {
                        alert("验证码输入错误！！！！");
                    }
                } else {
                    alert("用户名、邮箱或者密码错误，请重新登录！");
                }

            }

        })

    })


})

