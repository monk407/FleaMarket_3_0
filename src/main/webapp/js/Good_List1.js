$(function (){
    //输入跳转的页面，然后点击GO
    $("#GO").click(function () {
        var pageNum = $("#goPage");
        var type = $("#goPage").attr("name");
        // alert(attr+"!@#!@!$@#SADFFFFFFFFFFFF")
        $.ajax({
            url: "/goods/sortPage2.do",
            type: "post",
            data: {
                "pageNum": pageNum.val(),
                "type":type
            },
            dataType: "json",
            success: function (data) {
                if (data) {
                    document.location.href = "/goods/sortPage.do?pageNum="+pageNum.val()+"&type="+type;
                } else {
                    alert("请输入正确的页号！！");
                }
            }
        })
    })



})