
$(function () {
    var userid = $("#Myid").attr("name");
    // 类型选项
    // $("#submit").click(function () {
    //     var goodsName = $("#goodsName").val();
    //     //图片
    //     // var myfilename =  $("#myfilename").val();
    //     // var myfilename = new FormData($('#fileForm')[0]);
    //     var goodsPrice = $("#goodsPrice").val();
    //     var goodsIntro = $("#goodsIntro").val();
    //     var goodsStock = $("#goodsStock").val();
    //     var goodstype = $("#type").children('option:selected').val();
    //     alert(goodsName+","+goodsPrice+","+goodsIntro+","+goodsStock+","+goodstype)
    //
    //     //判断全部信息是否填上
    //     if (goodsName.length > 0 && goodsPrice.length > 0 && goodsIntro.length > 0
    //         && goodsStock.length > 0 && goodstype.length > 0) {//管理选项
    //         $.ajax({
    //             url: "/goods/GoodsAdd.do",
    //             type: "post",
    //             data: {
    //                 // "myfilename":myfilename,
    //                 "goodsName": goodsName,
    //                 "goodsPrice": goodsPrice,
    //                 "goodsIntro": goodsIntro,
    //                 "goodsStock": goodsStock,
    //                 "goodstype": goodstype,
    //                 "userid":userid
    //             },
    //             dataType: "json",
    //             success: function (data) {
    //                 //判断用户填写的用户名和邮箱是否存在
    //                 if (data) {
    //                     alert("添加成功！！！！！");
    //                     document.location.href = "/goods/GetMyGoodsPage.do?userid="+userid+"&pageNum=1";
    //                 } else {
    //                     alert("未知原因##添加失败！");
    //                 }
    //             }
    //         })
    //     } else {
    //         alert("请将所有信息填写完整！！！!");
    //     }
    // })
    //返回按钮
    $("#back").click(function () {
        document.location.href = "/goods/GetMyGoodsPage.do?userid="+userid+"&pageNum=1";
    })


    $("#uploadImgFile").change(function (){
        var input = $("#uploadImgFile");
        var file = input[0].files[0];
        var url = window.URL.createObjectURL(file);
        $("#showImgFile").attr('src', url);

    })


})