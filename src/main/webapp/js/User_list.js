$(function () {

    /*$("#allUser").click(function () {
        $.ajax({
            type: "post",
            url: "/admin/SelectallUser.do",
            dataType: "json",
            success: function (data) {
                showUser(data);
            }

        })

        function showUser(data) {
            $.each(data, function (i, n) {
                $("#aaa ").append("<tr>")
                    .append("<td>" + n.id + "</td>")
                    .append("<td>" + n.username + "</td>")
                    .append("<td>" + n.email + "</td>")
                    .append("<td>" + n.name + "</td>")
                    .append("<td>" + n.phone + "</td>")
                    .append("<td>" + n.address + "</td>")
                    .append("</tr>")

            })

        }

    })*/
    //输入跳转的页面，然后点击GO
    $("#GO").click(function () {
        var pageNum = $("#goPage");
        $.ajax({
            url: "/admin/AdmingetUserPage2.do",
            type: "post",
            data: {
                "pageNum": pageNum.val()
            },
            dataType: "json",
            success: function (data) {
                if (data) {
                    document.location.href = "/admin/AdmingetUserPageTmp.do";
                } else {
                    alert("请输入正确的页号！！");
                }
            }
        })

    })
    //点击重置密码
    $(".btn_reset").each(function () {
        $(this).click(function () {
            // alert($(this).attr("id"));
            var resetPasswordID = $(this).attr("id");
            $.ajax({
                url: "/admin/Admin_Go_ResetPassword.do",
                type: "post",
                data: {
                    "PasswordID": resetPasswordID
                },
                dataType: "json",
                success: function (data) {
                    if (data) {
                        document.location.href = "/admin/Admin_Go_ResetPasswordTmp.do";
                    } else {
                        alert("重置异常！！！");
                    }
                }
            })
        })
    })

    //点击修改用户
    $(".btn_update").each(function () {
        $(this).click(function () {
            // alert($(this).attr("id"));
            var UpdateID = $(this).attr("id");
            $.ajax({
                url: "/admin/Admin_Go_UpdateUser.do",
                type: "post",
                data: {
                    "UpdateID": UpdateID
                },
                dataType: "json",
                success: function (data) {
                    if (data) {
                        document.location.href = "/admin/AdminUpdateUserTmp.do";
                    } else {
                        alert("获取修改用户异常！！！");
                    }
                }
            })
        })

    })


    //点击删除用户
    $(".btn_delete").each(function () {
        $(this).click(function () {
            // alert($(this).attr("id"));
            var DeleteID = $(this).attr("id");
            //page.pageNum
            var confirm = window.confirm("是否继续删除？");
            if (confirm) {
                $.ajax({
                    url: "/admin/AdminDeleteUser.do",
                    type: "post",
                    data: {
                        "DeleteID": DeleteID
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data) {
                            alert("删除成功！！！")
                            document.location.href = "/admin/AdmingetUserPage.do?pageNum=1";

                        } else {
                            alert("删除失败！！请查看订单是否完成以及卖出的货物是否完成交易！")
                        }
                    }
                })
            } else {
                window.alert("取消成功！！")
            }

        })
    })

//    点击搜索
    $(".searchBtn").click(function () {

        var searchValue = $("#searchValue");//搜索内容

        //判断输入搜索内容
        if (searchValue.val().length > 0) {
            $.ajax({
                url: "/admin/AdminSearchUser.do",
                type: "post",
                data: {
                    "searchValue": searchValue.val()
                },
                dataType: "json",
                success: function (data) {
                    //判断用户填写的用户名和邮箱是否存在
                    if (data) {
                        document.location.href = "/admin/AdminGoSearchUserPage.do";
                    } else {
                        alert("搜索失败！！！");
                    }
                }
            })
        } else {
            alert("请输入搜索内容！!");
        }
    })



})

