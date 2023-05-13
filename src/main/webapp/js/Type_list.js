$(function () {

    //点击修改类型
    $(".btn_update").each(function () {
        $(this).click(function () {
            // alert($(this).attr("id"));
            var UpdateID = $(this).attr("id");
            $.ajax({
                url: "/admin/Admin_Go_UpdateType.do",
                type: "post",
                data: {
                    "UpdateID": UpdateID
                },
                dataType: "json",
                success: function (data) {
                    if (data) {
                        document.location.href = "/admin/Admin_Go_UpdateTypePage.do";
                    } else {
                        alert("获取修改用户异常！！！");
                    }
                }
            })
        })

    })


    //点击删除类型
    $(".btn_delete").each(function () {
        $(this).click(function () {
            // alert($(this).attr("id"));
            var DeleteID = $(this).attr("id");
            //page.pageNum
            var confirm = window.confirm("是否继续删除？");
            if (confirm) {
                $.ajax({
                    url: "/admin/AdminDeleteType.do",
                    type: "post",
                    data: {
                        "DeleteID": DeleteID
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data) {
                            alert("删除成功！！！")
                            document.location.href = "/admin/GoOrderTypeManage.do";

                        } else {
                            alert("删除失败！！该类型不可删除！！！")
                        }
                    }
                })
            } else {
                window.alert("取消成功！！")
            }

        })
    })

})

