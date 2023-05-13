$(function (){

    $.ajax({
        url:"user/loadUserNamePhoneAddress.do",
        type:"post",
        dataType:"json",
        data:{

        },
        success:function (data){
            $(".submitOrderName").val(data.name);
            $(".submitOrderAddress").val(data.address);
            $(".submitOrderPhone").val(data.phone);
        }
    })

    $(".submitOrderBtn").click(function (){

        if($(".submitOrderName").val() != "" && $(".submitOrderAddress").val() != "" && $(".submitOrderPhone").val() != ""){

            if(confirm("您确定提交订单吗?")){

                $.ajax({

                    url:"goods/submitOrder.do",
                    dataType: "json",
                    type: "post",
                    data: {

                        "name":$(".submitOrderName").val(),
                        "address":$(".submitOrderAddress").val(),
                        "phone":$(".submitOrderPhone").val()

                    },
                    success:function (data){
                        if(data.flag){
                            alert("提交订单成功！");
                            document.location.href="index.jsp";
                        }
                        else {
                            var errGoods = data.errGoods;
                            var errMsg = "交易失败！\n";
                            for(var i = 0 ; i < errGoods.length ; i++){
                                errMsg = errMsg + errGoods[i] + "\n";
                            }
                            alert(errMsg);
                        }


                    }

                })

            }

        }
        else {
            alert("请补全以上三项信息！");
        }

    })

})