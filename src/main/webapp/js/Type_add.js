$(function () {

    $(".AddUserBtn").click(function () {

        var typename = $("#typename");//类型名
        //判断全部信息是否填上
        if (typename.val().length > 0 ) {//管理选项
            //alert(typename.val());
            $.ajax({
                url: "/admin/AdminAddType.do",
                type: "post",
                data: {
                    "typename": typename.val(),
                },
                dataType: "json",
                success: function (data) {
                    //判断填写的类型是否存在
                    if (data) {
                        alert("添加成功！！！！！");
                        document.location.href = "/admin/GoOrderTypeManage.do";
                    } else {
                        alert("添加失败!!!该类型已存在或者输入出错！");
                    }
                }
            })
        } else {
            alert("请将所有信息填写完整！！！!");
        }
    })

    //返回按钮
    $(".GetBackBtn").click(function () {
        //alert("开始跳转！！！！！！Type_list页面！！！！！！！！")
        document.location.href = "/admin/GoOrderTypeManageTmp.do";
    })
})

