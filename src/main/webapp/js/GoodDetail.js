$(function (){
    //商品数量”增加“按钮 绑定点击事件
    $("#addGoodsCount").click(function (){
        $("#subGoodsCount").attr("disabled",false);
        var goodsCount = $("#goodsCountInDetail").val()
        //alert(goodsCount);

        //查看该商品的库存是否足够
        $.ajax({

            url:"goods/addGoodsCount.do",
            type:"post",
            dataType:"json",
            data:{
                "id":$(".hiddenInput").val(),
                "count":goodsCount
            },
            success:function (data){
                //库存足够才能加1,
                if (data){
                    //商品数量加1
                    $("#goodsCountInDetail")[0].value = parseInt(goodsCount)+ 1;
                    $("#nowGoodsCountInDetail")[0].value = parseInt(goodsCount) + 1;//一个隐藏输入框，保存当前的商品数量
                    //获取该商品总价
                    var detailTotalPrice = parseFloat($("#detailTotalPrice").html().slice(0,-1));
                    //修改该商品总价,即 当前总价+商品单价
                    detailTotalPrice = detailTotalPrice + parseFloat($("#detailGoodPrice").html());
                    $("#detailTotalPrice").html(detailTotalPrice.toFixed(1)+"元");//修改页面该商品总价

                }
                else {

                    alert("库存不足！");

                }

            }

        })
    })
    //商品数量”减少“按钮 绑定点击事件
    $("#subGoodsCount").click(function (){
        var goodsCount = $("#goodsCountInDetail").val()
        //alert(goodsCount);

        //如果商品数量为0，禁用“-”按钮
        if(goodsCount == 0){
            $("#subGoodsCount").attr("disabled",true);
        }
        else {
            //商品数量减1
            $("#goodsCountInDetail")[0].value = parseInt(goodsCount) - 1;
            $("#nowGoodsCountInDetail")[0].value = parseInt(goodsCount) - 1;//一个隐藏输入框，保存当前的商品数量
            //获取该商品总价
            var detailTotalPrice = parseFloat($("#detailTotalPrice").html().slice(0,-1));
            //修改该商品总价,即 当前总价-商品单价
            detailTotalPrice = detailTotalPrice - parseFloat($("#detailGoodPrice").html());
            $("#detailTotalPrice").html(detailTotalPrice.toFixed(1)+"元");//修改页面该商品总价

        }
    })

    //给商品数量的“输入框” 绑定失去焦点事件
    //商品库存足够 才能 修改 商品数量“输入框”
    $("#goodsCountInDetail").blur(function (){
        //alert($("#goodsCountInDetail").val());
        //如果输入框为空值，把商品数量 改为 1
         if ($("#goodsCountInDetail").val() == ""){

             $("#goodsCountInDetail")[0].value = 1;
             $("#nowGoodsCountInDetail")[0].value = 1;//一个隐藏输入框，保存当前的商品数量
             //修改页面总价，即 商品单价  。 因为商品数量为1
             $("#detailTotalPrice").html(parseFloat($("#detailGoodPrice").html()).toFixed(1) + "元");//修改页面该商品总价

         }
         else {
             ////库存足够才能修改商品数量
             $.ajax({

                 url: "goods/modGoodsCount.do",
                 type: "post",
                 data: {
                     "id": $(".hiddenInput").val(),
                     "count": $("#goodsCountInDetail").val()
                 },
                 dataType: "json",
                 success: function (data) {

                     if (data) {
                         $("#nowGoodsCountInDetail")[0].value = $("#goodsCountInDetail").val();//一个隐藏输入框，保存当前的商品数量
                         //修改该商品总价,即 商品单价*商品数量
                         var detailTotalPrice = parseFloat($("#detailGoodPrice").html()) * parseInt($("#goodsCountInDetail").val());
                         $("#detailTotalPrice").html(detailTotalPrice.toFixed(1) + "元");//修改页面该商品总价
                     } else {
                         //库存不足要恢复到原来的商品数量
                         var nowGoodsCountInDetail = $("#nowGoodsCountInDetail").val();
                         $("#goodsCountInDetail")[0].value = nowGoodsCountInDetail;
                         $("#nowGoodsCountInDetail")[0].value = nowGoodsCountInDetail;//一个隐藏输入框，保存当前的商品数量
                         alert("库存不足！");
                     }
                 }
             })
         }

    })

    //加入购物车。只有登录了才能加入购物车，游客不可以
    $("#insertShopCart").click(function (){

        //判断当前用户是否登录
        $.ajax({

            url:"user/isLogin.do",
            type:"post",
            dataType:"json",
            success:function (data){
                //已登录
                if (data){
                    //将商品加入购物车
                    insertShoppingCart();
                }
                //未登录
                else {
                    alert("登录后才能加入购物车！");
                    document.location.href="/login.jsp";
                }

            }

        })

    })


})

function insertShoppingCart(){

    $.ajax({

        url:"goods/insertShoppingCart.do",
        type:"post",
        data:{
            "goodsid":$(".hiddenInput").val(),
            "amount":$("#nowGoodsCountInDetail").val()
        },
        dataType:"json",
        success:function (data){

            if(data.msg){
                alert("添加购物车失败！该商品已在购物车！");
            }
            else {
                //true表示 成功加入到购物车
                if(data.isInsetShopCart){
                    alert("添加购物车成功！");
                    //修改购物车图标的数字，即购物车的商品的种类数
                    var arr =new Array();
                    arr.push("<i class=\"iconfont\">&#xe63f</i>");
                    arr.push("购物车("+data.itemMapLength+")");
                    $("#shopCartNumber").html(arr.join("\n"));
                }
                else {
                    alert("库存不足，添加购物车失败！");
                }
            }

            // //true表示 成功加入到购物车
            // if(data.isInsetShopCart){
            //     alert("添加购物车成功！");
            //     //修改购物车图标的数字，即购物车的商品的种类数
            //     var arr =new Array();
            //     arr.push("<i class=\"iconfont\">&#xe63f</i>");
            //     arr.push("购物车("+data.itemMapLength+")");
            //     $("#shopCartNumber").html(arr.join("\n"));
            // }
            // else {
            //     alert("库存不足，添加购物车失败！");
            // }

        }

    })

}
