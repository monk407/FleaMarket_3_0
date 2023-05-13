$(function (){

    $("#editFile").change(function (){
        var input = $("#editFile");
        var file = input[0].files[0];
        var url = window.URL.createObjectURL(file);
        $("#showEditFile").attr('src', url);

    })
    var userid = $("#Myid").attr("name");
//返回按钮
    $("#back").click(function () {
        document.location.href = "/goods/GetMyGoodsPage.do?userid="+userid+"&pageNum=1";
    })
})