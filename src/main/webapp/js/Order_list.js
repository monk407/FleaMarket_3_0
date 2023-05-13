$(function ()  {

    //点击搜索
    $(".searchBtn").click(function () {

        var searchValue = $("#searchValue");//搜索内容

        //判断输入搜索内容
        if (searchValue.val().length > 0) {
            $.ajax({
                url: "/admin/AdminSearchOrder.do",
                type: "post",
                data: {
                    "searchValue": searchValue.val()
                },
                dataType: "json",
                success: function (data) {
                    if (data) {
                        document.location.href = "/admin/AdminGoSearchOrderPage.do";
                    } else {
                        alert("搜索失败！！！");
                    }
                }
            })
        } else {
            alert("请输入搜索内容！!");
        }
    })

    //点击删除订单
    $(".btn_delete").each(function () {
        $(this).click(function () {
            // alert($(this).attr("id"));
            var pageNum = $(this).val();
            var status = $(this).attr("name");
            var DeleteID = $(this).attr("id");
            //page.pageNum
            var confirm = window.confirm("是否继续删除？");
            if (confirm) {
                $.ajax({
                    url: "/admin/AdminDeleteOrder.do",
                    type: "post",
                    data: {
                        "DeleteID": DeleteID
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data) {
                            alert("删除成功！！！")
                            document.location.href = "/admin/AdminGetOrderPage.do?pageNum="+pageNum+"&status="+status;

                        } else {
                            alert("删除失败！！！")
                        }
                    }
                })
            } else {
                window.alert("取消成功！！")
            }
        })
    })


    //输入跳转的页面，然后点击GO
    $("#GO").click(function () {
        var pageNum = $("#goPage");
        var status = $("#goPage").attr("name");
        // alert(attr+"!@#!@!$@#SADFFFFFFFFFFFF")
        $.ajax({
            url: "/admin/AdminGetOrderPage2.do",
            type: "post",
            data: {
                "pageNum": pageNum.val(),
                "status":status
            },
            dataType: "json",
            success: function (data) {
                if (data) {
                    document.location.href = "/admin/GoOrderManageTmp.do";
                } else {
                    alert("请输入正确的页号！！");
                }
            }
        })
    })

})