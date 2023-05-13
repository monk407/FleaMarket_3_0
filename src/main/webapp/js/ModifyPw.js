$(function () {

    $(".UpdatePasswordBtn").click(function () {
        var id = $("#userid");//用户id
        var password = $("#password");//用户原密码
        var oldPw = $("#oldPw");//旧密码
        var newPw = $("#newPw");//新密码
        alert("id:"+id.val()+",password:"+password.val()+",oldpw:"+oldPw.val()+",newpw:"+newPw.val())
        //判断全部信息是否填上
        if (id.val()!=null && oldPw.val().length > 0 && newPw.val().length > 0) {
            if (oldPw.val() === password.val()){
                $.ajax({
                    url: "/user/UpdateUserPassword.do",
                    type: "post",
                    data: {
                        "id": id.val(),
                        "password": newPw.val()
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data) {
                            alert("修改成功！！！！");
                            document.location.href = "/MyIfro.jsp";
                        } else {
                            alert("修改失败!!!");
                        }
                    }
                })
            }else {
                alert("原密码输入错误！！！")
            }

        } else {
            alert("请将所有信息填写完整！！！！！！！！！！！！！");
        }
    })
    $(".GetBackBtn").click(function () {
        document.location.href = "/MyIfro.jsp";
    })

})

