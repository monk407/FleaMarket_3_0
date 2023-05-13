$(function () {

    $("#AdmingetUserPage").click(function () {
        $.ajax({
            type: "post",
            data:{
                pageNum:1
            },
            url: "/admin/AdmingetUserPage.do",
            dataType: "json",
            success: function (data) {
                if (data){
                    document.location.href = "/admin/AdmingetUserPageTmp.do";
                }
            }
        })
    })
})

