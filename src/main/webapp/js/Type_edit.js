$(function () {

    $(".UpdateBtn").click(function () {

        var typename = $("#typename");//类型名
        var typeid = $("#typeid");
        //判断全部信息是否填上
        if (typename.val().length > 0 ) {//管理选项
            // alert(typeid.val());
            // alert(typename.val());
            $.ajax({
                url: "/admin/AdminUpdateType.do",
                type: "post",
                data: {
                    "typeid":typeid.val(),
                    "typename": typename.val()
                },
                dataType: "json",
                success: function (data) {
                    //判断填写的类型是否存在
                    if (data) {
                        alert("修改成功！！！！！");
                        document.location.href = "/admin/GoOrderTypeManage.do";
                    } else {
                        alert("修改失败!!!该类型已存在或者输入出错！");
                    }
                }
            })
        } else {
            alert("请将所有信息填写完整！！！!");
        }
    })
    //返回按钮
    $(".GetBackBtn").click(function () {
        document.location.href = "/admin/GoOrderTypeManageTmp.do";
    })
})

