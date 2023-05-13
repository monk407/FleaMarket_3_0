$(function () {
    var typeselect = document.getElementById("type");
    // 类型选项
    $("#type").change(function () {
        var typename = $(this).children('option:selected').val();
        if (typename === "allGoods") {
                //alert(typename+"@@@@@@@@@@@@@@@@@@");
            document.location.href ="/admin/AdmingetGoodPage.do?pageNum=1&type=0";
            // break;
        }
        for (i = 1;i<typeselect.length;i++){
            if (typeselect.options[i].selected ){
                //alert(typeselect.options[i].id+"@##################");
                // alert("/admin/AdmingetGoodPage.do?pageNum=1&type="+typeselect.options[i].value)
                document.location.href ="/admin/AdmingetGoodPage.do?pageNum=1&type="+typeselect.options[i].id;

            }
        }


    });


    //输入跳转的页面，然后点击GO
    $("#GO").click(function () {
        var pageNum = $("#goPage");
        var type = $("#goPage").attr("name");
        // alert(attr+"!@#!@!$@#SADFFFFFFFFFFFF")
        $.ajax({
            url: "/admin/AdmingetGoodPage2.do",
            type: "post",
            data: {
                "pageNum": pageNum.val(),
                "type":type
            },
            dataType: "json",
            success: function (data) {
                if (data) {
                    document.location.href = "/admin/AdmingetGoodPageTmp.do";
                } else {
                    alert("请输入正确的页号！！");
                }
            }
        })
    })

    //点击删除商品
    $(".btn_delete").each(function () {
        $(this).click(function () {
            var DeleteID = $(this).attr("id");
            // alert(DeleteID+"@###################################################")
            var type = $(this).attr("name");
            //page.pageNum
            var confirm = window.confirm("是否继续删除？");
            if (confirm) {
                $.ajax({
                    url: "/admin/AdminDeleteGood.do",
                    type: "post",
                    data: {
                        "DeleteID": DeleteID
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data) {
                            alert("删除成功！！！")
                            document.location.href = "/admin/AdmingetGoodPage.do?pageNum=1&type="+type;

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

//    点击搜索
    $(".searchBtn").click(function () {

        var searchValue = $("#searchValue");//搜索内容

        //判断输入搜索内容
        if (searchValue.val().length > 0) {
            $.ajax({
                url: "/admin/AdminSearchGood.do",
                type: "post",
                data: {
                    "searchValue": searchValue.val()
                },
                dataType: "json",
                success: function (data) {
                    //判断用户填写的用户名和邮箱是否存在
                    if (data) {
                        document.location.href = "/admin/AdminGoSearchGoodPage.do";
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