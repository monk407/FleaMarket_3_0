$(function () {

    $(".UpdateUserBtn").click(function () {
        var id = $("#userid");//用户id
        var email = $("#email");//邮箱
        var name = $("#consignee");//收件人
        var phone = $("#phone");//手机号
        var address = $("#address");//地址
        alert(id.val()+","+email.val()+","+name.val()+","+phone.val()+","+address.val())
        //判断全部信息是否填上
        if (id.val()!=null && email.val().length > 0 && name.val().length > 0 && phone.val().length > 0 && address.val().length > 0) {//管理选项
            $.ajax({
                url: "/user/UpdateUser.do",
                type: "post",
                data: {
                    "id": id.val(),
                    "email": email.val(),
                    "name": name.val(),
                    "phone": phone.val(),
                    "address": address.val()
                },
                dataType: "json",
                success: function (data) {
                    //判断用户填写的用户名和邮箱是否存在
                    if (data) {
                        alert("修改成功！！！！");
                        document.location.href = "/index.jsp";
                    } else {
                        alert("修改失败！！！！");
                    }
                }
            })
        } else {
            alert("请将所有信息填写完整！！！！！！！！！！！！！");
        }
    })
    $(".GetBackBtn").click(function () {
        document.location.href = "/index.jsp";
    })

})

