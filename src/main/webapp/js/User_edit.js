$(function () {

    //是否为管理员的数据回显，判断true：管理员，false：用户
    var judge = $("#judge").val();
    var btnadmin = document.getElementsByName("isAdmin");
    for (var i = 0; i < btnadmin.length; i++) {
        if (btnadmin[i].value === judge) {
            btnadmin[i].checked = true
        }
    }
    $(".UpdateUserBtn").click(function () {
        var isAdmin = null;
        var btnadmin = document.getElementsByName("isAdmin");
        for (var i = 0; i < btnadmin.length; i++) {
            if (btnadmin[i].checked) {
                isAdmin = btnadmin[i].value;
            }
        }
        var id = $("#userid");
        var username = $("#username");//用户名
        var email = $("#maibox");//邮箱
        var password = $("#password");//密码
        var name = $("#addressname");//收件人
        var phone = $("#phone");//手机号
        var address = $("#address");//地址
        // var pageNum = '<%=session.getAttribute("pageNum")%>';
        //判断全部信息是否填上
        if (id.val().length>0,username.val().length > 0 && email.val().length > 0 && password.val().length > 0
            && name.val().length > 0 && phone.val().length > 0
            && address.val().length > 0 && isAdmin !== null) {//管理选项
            // alert(id.val()+username.val() + email.val() + password.val() + name.val() + phone.val() + address.val() + isAdmin);
            $.ajax({
                url: "/admin/AdminUpdateUser.do",
                type: "post",
                data: {
                    "id":id.val(),
                    "username": username.val(),
                    "email": email.val(),
                    "password": password.val(),
                    "name": name.val(),
                    "phone": phone.val(),
                    "address": address.val(),
                    "isadmin": isAdmin
                },
                dataType: "json",
                success: function (data) {
                    //判断用户填写的用户名和邮箱是否存在
                    if (data) {
                        alert("修改成功！！！！");
                        document.location.href = "/admin/AdmingetUserPage.do?pageNum=1";
                    } else {
                        alert("修改失败！该用户名或邮箱已存在！！");
                    }
                }
            })
        } else {
            alert("请将所有信息填写完整！！！！！！！！！！！！！");
        }
    })

    $(".GetBackBtn").click(function () {
        document.location.href = "/admin/AdmingetUserPageTmp.do";
    })


})

