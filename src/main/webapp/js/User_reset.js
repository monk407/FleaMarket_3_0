$(function () {
    //确认
    $(".confirmBtn").click(function () {
        $.ajax({
            url: "/admin/Admin_Reset_Password.do",
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data) {
                    alert("重置密码成功！！！")
                    document.location.href = "/admin/AdmingetUserPageTmp.do";
                } else {
                    alert("重置密码失败！！！");
                }
            }
        })

    })

    //取消
    $(".cancelBtn").click(function () {
        document.location.href ="/admin/AdmingetUserPageTmp.do";
    })
})

