$(function () {

    //输入跳转的页面，然后点击GO
    $("#GO").click(function () {
        var pageNum = $("#goPage");
        var userid = $("#goPage").attr("name");
        $.ajax({
            url: "/goods/GetMyGoodsPage2.do",
            type: "post",
            data: {
                "pageNum": pageNum.val(),
                "userid":userid
            },
            dataType: "json",
            success: function (data) {
                if (data) {
                    document.location.href = "/goods/GetMyGoodsPage.do?userid="+userid+"&pageNum="+pageNum.val();
                } else {
                    alert("请输入正确的页号！！");
                }
            }
        })

    })
    var userid = $("#Myid").attr("name");
    //点击删除商品
    $(".btn_delete").each(function () {
        $(this).click(function () {
            var DeleteID = $(this).attr("id");
            var confirm = window.confirm("是否继续删除？");
            if (confirm) {
                $.ajax({
                    url: "/goods/DeleteMyGood.do",
                    type: "post",
                    data: {
                        "DeleteID": DeleteID
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data) {
                            alert("删除成功！！！")
                            document.location.href = "/goods/GetMyGoodsPage.do?userid="+userid+"&pageNum=1";
                        } else {
                            alert("删除失败！！请查看该货物是否完成交易！！！")
                        }
                    }
                })
            } else {
                window.alert("取消成功！！")
            }

        })
    })




})