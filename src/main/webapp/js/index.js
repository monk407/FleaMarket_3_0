$(function (){

    recommendGoods();

    hotGoodsLi();

    //设置轮播图轮播时间2秒
    // $('.carousel').carousel({
    //     interval: 2000
    // })

})

function recommendGoods(){

    $.ajax({

        url:"goods/recommendGoods.do",
        type:"post",
        data:{

        },
        dataType:"json",
        success:function (data){

            var ul = $("#recommendGoods");
            var attr = new Array();

            attr.push("<h2> 推荐商品 </h2>");

            for (j=0 ;j < 2 ; j++){

                    attr.push("<li class='commodity1'>");
                    attr.push("<div class='img-rounded commodity_pic'>");
                    attr.push("<img src=.."+data[j*3].image+" class='img-responsive' alt='Responsive image'/>");
                    attr.push("</div>");
                    attr.push("<div class='commodity_text'>");
                    attr.push("<a href='goods/goodsDetail.do?goodsid="+data[j*3].id+"' class='word_size'>"+data[j*3].name+"</a>");
                    attr.push("<input class='hiddenInput' type='hidden' name='goodsid' value='"+data[j*3].id+"'>");
                    attr.push("</div>");
                    attr.push("</li>");

                    attr.push("<li class='commodity2'>");
                    attr.push("<div class='commodity_pic'>");
                    attr.push("<img src=.."+data[j*3+1].image+" class='img-responsive' alt='Responsive image'/>");
                    attr.push("</div>");
                    attr.push("<div class='commodity_text'>");
                    attr.push("<a href='goods/goodsDetail.do?goodsid="+data[j*3+1].id+"' class='word_size'>"+data[j*3+1].name+"</a>");
                    attr.push("<input class='hiddenInput' type='hidden' name='goodsid' value='"+data[j*3+1].id+"'>");
                    attr.push("</div>");
                    attr.push("</li>");

                    attr.push("<li class='commodity3'>");
                    attr.push("<div class='commodity_pic'>");
                    attr.push("<img src=.."+data[j*3+2].image+" class='img-responsive' alt='Responsive image'/>");
                    attr.push("</div>");
                    attr.push("<div class='commodity_text'>");
                    attr.push("<a href='goods/goodsDetail.do?goodsid="+data[j*3+2].id+"' class='word_size'>"+data[j*3+2].name+"</a>");
                    attr.push("<input class='hiddenInput' type='hidden' name='goodsid' value='"+data[j*3+2].id+"'>");
                    attr.push("</div>");
                    attr.push("</li>");

            }
            ul.append(attr.join("\n"));

        }

    })

}

function hotGoodsLi(){

    $.ajax({

        url:"goods/hotGoods.do",
        type: "post",
        dataType: "json",
        data: {

        },
        success:function (data){

            var li = $("#hotGoodsLi");
            var attr = new Array();

            attr.push("<h2>热销商品</h2>");

            for (var j=0 ;j < 2 ; j++){
                var k = j*3;
                if(k%3 == 0 && k < data.length){
                    attr.push("<ul>");
                    attr.push("<li class='commodity1'>");
                    attr.push("<div class='img-rounded commodity_pic'>");
                    attr.push("<img src=.."+data[j*3].image+" class='img-responsive' alt='Responsive image'/>");
                    attr.push("</div>");
                    attr.push("<div class='commodity_text'>");
                    attr.push("<a href='goods/goodsDetail.do?goodsid="+data[j*3].id+"' class='word_size'>"+data[j*3].name+"</a>");
                    attr.push("<input class='hiddenInput' type='hidden' name='goodsid' value='"+data[j*3].id+"'>");
                    attr.push("</div>");
                    attr.push("</li>");
                }
                k = j*3+1;
                if(k%3 == 1 && k < data.length){
                    attr.push("<li class='commodity2'>");
                    attr.push("<div class='commodity_pic'>");
                    attr.push("<img src=.."+data[j*3+1].image+" class='img-responsive' alt='Responsive image'/>");
                    attr.push("</div>");
                    attr.push("<div class='commodity_text'>");
                    attr.push("<a href='goods/goodsDetail.do?goodsid="+data[j*3+1].id+"' class='word_size'>"+data[j*3+1].name+"</a>");
                    attr.push("<input class='hiddenInput' type='hidden' name='goodsid' value='"+data[j*3+1].id+"'>");
                    attr.push("</div>");
                    attr.push("</li>");
                }
                k = j*3+2;
                if(k%3 == 2 && k < data.length){
                    attr.push("<li class='commodity3'>");
                    attr.push("<div class='commodity_pic'>");
                    attr.push("<img src=.."+data[j*3+2].image+" class='img-responsive' alt='Responsive image'/>");
                    attr.push("</div>");
                    attr.push("<div class='commodity_text'>");
                    attr.push("<a href='goods/goodsDetail.do?goodsid="+data[j*3+2].id+"' class='word_size'>"+data[j*3+2].name+"</a>");
                    attr.push("<input class='hiddenInput' type='hidden' name='goodsid' value='"+data[j*3+2].id+"'>");
                    attr.push("</div>");
                    attr.push("</li>");
                    attr.push("</ul>");
                }


            }
            li.append(attr.join("\n"));

        }

    })


}