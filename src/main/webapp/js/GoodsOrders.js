$(function (){

    getMySellOrder();

    MySellOrderButton();

})

function getMySellOrder(){


    $.ajax({

        url:"order/getMySellOrder.do",
        type:"post",
        dataType:"json",
        success:function (data){

            var attr = new Array();
            var $div = $("#mySellOrderDiv");
            $div.html("");


            for(var key in data) {
                attr.push("<div class='show_goodorders mySellOrderDiv'>");
                attr.push("<ul>");
                attr.push("<li>");
                attr.push("<div class='good_id'>");
                attr.push("<p class='mySellOrderId'>"+key+"</p>");
                attr.push("</div>");
                attr.push("</li>");
                attr.push("<li>");
                attr.push("<div class='good_price'>");
                var price = parseFloat('0');
                for(var k = 0 ; k < data[key].length ; k++){

                    price = price + parseFloat(data[key][k].price);

                }
                attr.push("<p>"+price+"</p>");
                attr.push("</div>");
                attr.push("</li>");
                attr.push("<li>");
                attr.push("<div class='good_info'>");

                for(var k = 0 ; k < data[key].length ; k++){

                    attr.push("<p>"+data[key][k].goodsName+" x "+data[key][k].amount+"</p>");

                }

                attr.push("</div>");
                attr.push("</li>");
                attr.push("<li>");
                attr.push("<div class='user_info'>");
                attr.push("<p>"+data[key][0].order.address+"</p>");
                attr.push("</div>");
                attr.push("</li>");
                attr.push("<li>");
                attr.push("<div class='order_type'>");

                if (data[key][0].order.status == "1") {

                    attr.push("<p class='mySellOrderStatus'>已付款</p>");
                }
                if (data[key][0].order.status == "2") {

                    attr.push("<p class='mySellOrderStatus'>已发货</p>");
                }
                if (data[key][0].order.status == "3") {

                    attr.push("<p class='mySellOrderStatus'>已完成</p>");
                }

                attr.push("</div>");
                attr.push("</li>");
                attr.push("<li>");
                attr.push("<div class='order_username'>");
                attr.push("<p>"+data[key][0].order.buyUser.username+"</p>");
                attr.push("<input type='hidden' id='mySellOrderUserid' value='"+data[key][0].order.buyUser.id+"'>")
                attr.push("</div>");
                attr.push("</li>");
                attr.push("<li>");
                attr.push("<div class='order_time'>");
                attr.push("<p>"+data[key][0].order.datetime+"</p>");
                attr.push("</div>");
                attr.push("</li>");
                attr.push("<li>");
                attr.push("<div class='goodorders_operation'>");

                if (data[key][0].order.status == "1") {

                    attr.push("<button type='submit' class='shipping mySellOrderBtn'>发货</button>");
                    attr.push("<br/>");
                    attr.push("<button type='submit' class='delete mySellDelBtn'>删除</button>");
                }
                if (data[key][0].order.status == "2") {

                    attr.push("<button type='button' class='shipping mySellOrderBtn'>完成</button>");
                    attr.push("<br/>");
                    attr.push("<button type='button' class='delete mySellDelBtn'>删除</button>");
                }
                if (data[key][0].order.status == "3") {
                    attr.push("<button style='display: none' type='button' class='mySellOrderBtn'>");
                    attr.push("<br/>");
                    attr.push("<button type='button' class='delete mySellDelBtn'>删除</button>");
                }

                attr.push("</div>");
                attr.push("</li>");
                attr.push("</ul>");
                attr.push("</div>");
            }


            $div.append(attr.join("\n"));

        }



    })

}

function MySellOrderButton(){

    $(document).on('click',".mySellDelBtn",function (){

        if($(this).html() == "删除"){
            //alert($(".mySellDelBtn").index(this));
            if(confirm("您确定要删除该订单吗？")){
                $.ajax({

                    url: "order/delMyBuyOrder.do",
                    data: {
                        "orderId":$($(".mySellOrderId")[$(".mySellDelBtn").index(this)]).html()
                    },
                    type: "post",
                    dataType: "json",
                    success:function (data){

                    }
                })

                $($(".mySellOrderDiv")[$(".mySellDelBtn").index(this)]).remove();
            }
        }

    })

    $(document).on('click',".mySellOrderBtn",function (){

        if($(this).html() == "完成"){
            //alert($(".mySellOrderBtn").index(this));
            if (confirm("您确定要完成该订单吗？")){

                $.ajax({

                    url: "goods/modifyMyOrderGoodsStatus.do",
                    dataType: "json",
                    type: "post",
                    data:{
                        "orderId":$($(".mySellOrderId")[$(".mySellOrderBtn").index(this)]).html()
                    },
                    success:function (data){

                    }

                })
                $($(".mySellOrderStatus")[$(".mySellOrderBtn").index(this)]).html("已完成");
                $($(".mySellOrderBtn")[$(".mySellOrderBtn").index(this)]).attr("style","display:none;");
            }
        }
        if($(this).html() == "发货"){
            //alert("发货");
            //alert($(".mySellOrderBtn").index(this));
            if (confirm("您确定要发货吗？")){

                $.ajax({

                    url: "goods/modifyMyOrderGoodsStatus2.do",
                    dataType: "json",
                    type: "post",
                    data:{
                        "orderId":$($(".mySellOrderId")[$(".mySellOrderBtn").index(this)]).html()
                    },
                    success:function (data){

                    }

                })
                $($(".mySellOrderStatus")[$(".mySellOrderBtn").index(this)]).html("已发货");
                $($(".mySellOrderBtn")[$(".mySellOrderBtn").index(this)]).html("完成");
            }

        }



    })


}