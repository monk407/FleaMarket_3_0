$(function (){

    getMyBuyOrder();

    MyOrderBtn();


})

function getMyBuyOrder(){
    $.ajax({

        url:"order/getMyBuyOrder.do",
        type:"post",
        dataType:"json",
        data:{

        },
        success:function (data){

            var attr = new Array();
            var $div = $("#MyBuyGoodsDetail");
            $div.html("");
            for(var i = 0 ; i < data.length ; i++){
                attr.push("<div class='show_myorders myBuyOrderDiv'>");
                attr.push("<ul>");
                attr.push("<li>");
                attr.push("<div class='good_id'>");
                attr.push("<p class='MyBuyOrderId'>"+data[i].id+"</p>");
                attr.push("</div>");
                attr.push("</li>");
                attr.push("<li>");
                attr.push("<div class='good_price'>");
                attr.push("<p>"+data[i].total+"</p>");
                attr.push("</div>");
                attr.push("</li>");
                attr.push("<li>");
                attr.push("<div class='good_info'>");
                for(var j = 0 ; j < data[i].itemList.length ; j++){
                    attr.push("<p>"+data[i].itemList[j].goodsName+" x "+data[i].itemList[j].amount+"</p>");
                }
                attr.push("</div>");
                attr.push("</li>");
                attr.push("<li>");
                attr.push("<div class='user_info'>");
                attr.push("<p>"+data[i].address+"</p>");
                attr.push("</div>");
                attr.push("</li>");
                attr.push("<li>");
                attr.push("<div class='order_type'>");

                if(data[i].status == "1"){
                    attr.push("<p class='orderStatusInBuyOrder'>未发货</p>");
                }
                if(data[i].status == "2"){
                    attr.push("<p class='orderStatusInBuyOrder'>已发货</p>");
                }
                if(data[i].status == "3"){
                    attr.push("<p class='orderStatusInBuyOrder'>已收货</p>");
                }

                attr.push("</div>");
                attr.push("</li>");
                attr.push("<li>");
                attr.push("<div class='order_time'>");
                // var time = data[i].datetime.toLocaleString();
                attr.push("<p>"+data[i].datetime+"</p>");
                attr.push("</div>");
                attr.push("</li>");
                attr.push("<li>");
                attr.push("<div class='myorders_operation'>");

                if(data[i].status == "1"){
                    attr.push("<button type='button' class='MyBuyOrderBtn'>取消订单</button>");
                }
                if(data[i].status == "2"){
                    attr.push("<button type='button' class='MyBuyOrderBtn'>确认收货</button>");
                }
                if(data[i].status == "3"){
                    attr.push("<button type='button' class='MyBuyOrderBtn'>删除</button>");
                }
                attr.push("<br/>");
                attr.push("</div>");
                attr.push("</li>");
                attr.push("</ul>");
                attr.push("</div>");
            }
            $div.append(attr.join("\n"));

        }


    })
}

function MyOrderBtn(){
    $(document).on('click',".MyBuyOrderBtn",function (){

        //alert($(".MyBuyOrderBtn").index(this));
        if($(this).html() == "删除"){
            //alert("删除");
            if(confirm("您确定要删除该订单吗？")){
                delMyBuyOrder($($(".MyBuyOrderId")[$(".MyBuyOrderBtn").index(this)]).html());
                $($(".myBuyOrderDiv")[$(".MyBuyOrderBtn").index(this)]).remove();
            }

        }
        if ($(this).html() == "确认收货"){
            //alert("确认收货");
            if(confirm("您要确认收货吗？")){
                $.ajax({
                    url:"goods/modifyMyOrderGoodsStatus.do",
                    type:"post",
                    dataType:"json",
                    data:{
                        "orderId":$($(".MyBuyOrderId")[$(".MyBuyOrderBtn").index(this)]).html()
                    },
                    success:function (data){

                    }
                })
                $($(".orderStatusInBuyOrder")[$(".MyBuyOrderBtn").index(this)]).html("已收货");
                $($(".MyBuyOrderBtn")[$(".MyBuyOrderBtn").index(this)]).html("删除");
            }
        }
        if($(this).html() == "取消订单"){
            //alert("取消订单");
            if(confirm("您确定要取消订单吗？")){
                var orderId = $($(".MyBuyOrderId")[$(".MyBuyOrderBtn").index(this)]).html();
                $.ajax({

                    url:"goods/modifyMyOrderGoodsStock.do",
                    data:{
                        "orderId":orderId
                    },
                    type:"post",
                    dataType:"json",
                    success:function (data){

                    }

                })
                // delMyBuyOrder(orderId);
                $($(".myBuyOrderDiv")[$(".MyBuyOrderBtn").index(this)]).remove();
            }
        }

    })
}

function delMyBuyOrder(orderId){

    $.ajax({

        url: "order/delMyBuyOrder.do",
        data: {
            "orderId":orderId
        },
        type: "post",
        dataType: "json",
        success:function (data){

        }


    })

}