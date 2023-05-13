$(function (){
    //全选/反选 复选框
    selectCheckboxAll();

    //购物车 ＋按钮，给每个+按钮绑定点击事件
        for(var i = 0 ; i < $(".addOiCount").length ; i++){

            (function (index){
                $(".addOiCount")[i].onclick = function(){
                    index = $(".addOiCount").index(this);//判断按钮-的下标
                    $($(".subOiCount")[index]).attr("disabled",false);
                    var goodsCount = $(".goodsCountInCart")[index].value;

                    //alert(goodsCount);

                    //查看该商品的库存是否足够
                    $.ajax({

                        url:"goods/addGoodsCount.do",
                        type:"post",
                        dataType:"json",
                        data:{
                            "id":$($(".hiddenInputCart")[index]).val(),
                            "count":goodsCount
                        },
                        success:function (data){
                            //库存足够才能加1,
                            if (data){
                                //商品数量加1
                                $($(".goodsCountInCart")[index])[0].value = parseInt(goodsCount)+ 1;
                                $($(".nowGoodsCountInCart")[index])[0].value = parseInt(goodsCount) + 1;//一个隐藏输入框，保存当前的商品数量
                                //获取该商品总价orderitm
                                var detailTotalPrice = parseFloat($($(".oiPrice")[index]).html());
                                //修改该商品总价orderitm,即 当前总价+商品单价
                                detailTotalPrice = detailTotalPrice + parseFloat($($(".oiSinglePrice")[index]).html());
                                $($(".oiPrice")[index]).html(detailTotalPrice.toFixed(1));//修改页面该商品的总价
                                //修改整个购物车的总价
                                var orderPrice = 0;
                                for(var k = 0 ; k < $(".singleCheckbox").length ; k++){
                                    var oiP = parseFloat($($(".goodsCountInCart")[k]).val())*parseFloat($($(".oiSinglePrice")[k]).html());
                                    if($(".singleCheckbox")[k].checked){
                                        orderPrice = orderPrice + oiP;
                                    }
                                }
                                $(".orderPrice").html("￥"+orderPrice.toFixed(2));
                                //更新购物车信息
                                updateShopCart(index);

                            }
                            else {

                                alert("库存不足！");

                            }

                        }

                    })
                }
            })(i)


        }

    //购物车 -按钮，给每个-按钮绑定点击事件
    for(var i = 0 ; i < $(".subOiCount").length ; i++){

        (function (index){

            $($(".subOiCount")[i]).click(function (){
                index = $(".subOiCount").index(this);//判断按钮-的下标
                var goodsCount = $(".goodsCountInCart")[index].value;
                //alert(goodsCount);

                //如果商品数量为0，禁用“-”按钮
                if(goodsCount == 0){
                    $($(".subOiCount")[index]).attr("disabled",true);
                }
                else {
                    //商品数量减1
                    $($(".goodsCountInCart")[index])[0].value = parseInt(goodsCount) - 1;
                    $($(".nowGoodsCountInCart")[index])[0].value = parseInt(goodsCount) - 1;//一个隐藏输入框，保存当前的商品数量
                    //获取该商品总价
                    var detailTotalPrice = parseFloat($($(".oiPrice")[index]).html());
                    //修改该商品总价,即 当前总价-商品单价
                    detailTotalPrice = detailTotalPrice - parseFloat($($(".oiSinglePrice")[index]).html());
                    $($(".oiPrice")[index]).html(detailTotalPrice.toFixed(1));//修改页面该商品总价

                    //修改整个购物车的总价
                    var orderPrice = 0;
                    for(var k = 0 ; k < $(".singleCheckbox").length ; k++){
                        var oiP = parseFloat($($(".goodsCountInCart")[k]).val())*parseFloat($($(".oiSinglePrice")[k]).html());
                        if($(".singleCheckbox")[k].checked){
                            orderPrice = orderPrice + oiP;
                        }
                    }
                    $(".orderPrice").html("￥"+orderPrice.toFixed(2));
                    //更新购物车信息
                    updateShopCart(index);

                }
            })

        })(i)

    }

    //给商品数量的“输入框” 绑定失去焦点事件
    //商品库存足够 才能 修改 商品数量“输入框”
    for(var i = 0 ; i < $(".goodsCountInCart").length ; i++){
    // for(var i = $(".goodsCountInCart").length-1 ; i >= 0 ; i--){
        (function (index){
            $($(".goodsCountInCart")[i]).blur(function (){

                index = $(".goodsCountInCart").index(this);//判断输入框的下标

                //alert($($(".goodsCountInCart")[index]).val());
                console.log(index);
                //如果输入框为空值，把商品数量 改为 1
                if ($($(".goodsCountInCart")[index]).val() == ""){

                    $($(".goodsCountInCart")[index])[0].value = 1;
                    $($(".nowGoodsCountInCart")[index])[0].value = 1;//一个隐藏输入框，保存当前的商品数量
                    //修改页面总价，即 商品单价  。 因为商品数量为1
                    $($(".oiPrice")[index]).html(parseFloat($($(".oiSinglePrice")[index]).html()).toFixed(1));//修改页面该商品总价

                }
                else {
                    ////库存足够才能修改商品数量
                    $.ajax({

                        url: "goods/modGoodsCount.do",
                        type: "post",
                        data: {
                            "id": $($(".hiddenInputCart")[index]).val(),
                            "count": $($(".goodsCountInCart")[index]).val()
                        },
                        dataType: "json",
                        success: function (data) {

                            if (data) {
                                $($(".nowGoodsCountInCart")[index])[0].value = $($(".goodsCountInCart")[index]).val();//一个隐藏输入框，保存当前的商品数量
                                //修改该商品总价,即 商品单价*商品数量
                                var detailTotalPrice = parseFloat($($(".oiSinglePrice")[index]).html()) * parseInt($($(".goodsCountInCart")[index]).val());
                                $($(".oiPrice")[index]).html(detailTotalPrice.toFixed(1));//修改页面该商品总价

                                //修改整个购物车的总价
                                var orderPrice = 0;
                                for(var k = 0 ; k < $(".singleCheckbox").length ; k++){
                                    var oiP = parseFloat($($(".goodsCountInCart")[k]).val())*parseFloat($($(".oiSinglePrice")[k]).html());
                                    if($(".singleCheckbox")[k].checked){
                                        orderPrice = orderPrice + oiP;
                                    }
                                }
                                $(".orderPrice").html("￥"+orderPrice.toFixed(2));
                                //更新购物车信息
                                updateShopCart(index);

                            } else {
                                //库存不足要恢复到原来的商品数量
                                var nowGoodsCountInDetail = $($(".nowGoodsCountInCart")[index]).val();
                                $($(".goodsCountInCart")[index])[0].value = nowGoodsCountInDetail;
                                $($(".nowGoodsCountInCart")[index])[0].value = nowGoodsCountInDetail;//一个隐藏输入框，保存当前的商品数量
                                alert("库存不足！");
                            }
                        }
                    })
                }

            })
        })(i)
        //again();
    }


    //购物车 删除按钮，给每个删除按钮绑定点击事件
    for(var i = 0 ; i < $(".delCartBtn").length ; i++){

        (function (index){

            $($(".delCartBtn")[i]).click(function (){
                index = $(".delCartBtn").index(this);
                if(confirm("您确定删除该商品吗？")){
                    $.ajax({

                        url:"goods/delCartGoods.do",
                        type:"post",
                        data:{
                            "id":$($(".hiddenInputCart")[index]).val(),
                            "amount":$($(".goodsCountInCart")[index]).val(),
                            "oiPrice":$($(".oiPrice")[index]).html()
                        },
                        dataType:"json",
                        success:function (data){
                            console.log(data.msg);
                            //删除相对应的商品
                            $($(".cartTr")[index]).remove();
                            //修改整个购物车的总价
                            var orderPrice = 0;
                            for(var k = 0 ; k < $(".singleCheckbox").length ; k++){
                                var oiP = parseFloat($($(".goodsCountInCart")[k]).val())*parseFloat($($(".oiSinglePrice")[k]).html());
                                if($(".singleCheckbox")[k].checked){
                                    orderPrice = orderPrice + oiP;
                                }
                            }
                            $(".orderPrice").html("￥"+orderPrice.toFixed(2));
                            //修改购物车图标的数量
                            var arr = new Array();
                            arr.push("<i class=\"iconfont\">&#xe63f</i>");
                            arr.push("购物车("+data.oiLength+")");
                            $("#shopCartNumber").html(arr.join("\n"));
                        }

                    })
                }
                else {

                }


            })

        })(i)


    }



    //购物车多选删除按钮
    $(".delSomeCartGood").click(function (){

        if (confirm("您确定删除所选的商品吗？")){
            var arr = new Array();


            // for (var i = 0 ; i < $(".singleCheckbox").length ; i++){
            for(var i = $(".singleCheckbox").length-1 ; i >= 0 ; i--){

                if($(".singleCheckbox")[i].checked){

                    $.ajax({

                        url:"goods/delCartGoods.do",
                        type:"post",
                        async: false,//设置成同步
                        data:{
                            "id":$($(".hiddenInputCart")[i]).val(),
                            "amount":$($(".goodsCountInCart")[i]).val(),
                            "oiPrice":$($(".oiPrice")[i]).html()
                        },
                        dataType:"json",
                        success:function (data){
                            console.log(data.msg);
                            //alert(i);
                            //删除相对应的商品
                            $($(".cartTr")[i]).remove();
                            //修改整个购物车的总价
                            var orderPrice = 0;
                            for(var k = 0 ; k < $(".singleCheckbox").length ; k++){
                                var oiP = parseFloat($($(".goodsCountInCart")[k]).val())*parseFloat($($(".oiSinglePrice")[k]).html());
                                if($(".singleCheckbox")[k].checked){
                                    orderPrice = orderPrice + oiP;
                                }
                            }
                            $(".orderPrice").html("￥"+orderPrice.toFixed(2));
                            //修改购物车图标的数量
                            var arr = new Array();
                            arr.push("<i class=\"iconfont\">&#xe63f</i>");
                            arr.push("购物车("+data.oiLength+")");
                            $("#shopCartNumber").html(arr.join("\n"));
                        }

                    })

                }

            }

        }


    })


    $("#submitShopCartBtn").click(function (){
        var selectGoods = new Array();
        //如果没有选择商品就点击“结算按钮”，进行提示.true表示 没有选择商品
        var flag1 = true;
        for(var i = $(".singleCheckbox").length - 1 ; i >= 0 ; i--){
            if($(".singleCheckbox")[i].checked){
                flag1 = false ;
                selectGoods.push(i);
            }
        }
        if (flag1){
            alert("您还没有选择商品");
        }
        else {
            var goods = [];
            for(var i = selectGoods.length - 1 ; i >= 0 ; i--){
                var str = {"goodsid":$($(".hiddenInputCart")[selectGoods[i]]).val(),"gTotal":$($(".oiPrice")[selectGoods[i]]).html(),"gAmount":$($(".goodsCountInCart")[selectGoods[i]]).val(),"saleUserId":$($(".hiddenGoodsSaleUserId")[selectGoods[i]]).val()};
                goods.push(str);
            }
            $.ajax({
                url:"goods/sortSelectGoodsInCart.do",
                type:"post",
                dataType:"json",
                contentType:"application/json",
                data: JSON.stringify(goods),
                success : function (data){
                    if(data.msg){
                        document.location.href="SubmitOrder.jsp";
                    }
                    else{
                        alert("结算失败");
                    }
                }
            })

        }

    })

})

function selectCheckboxAll(){
    var $all = $("#checkboxAll");
    var $single = $(".singleCheckbox");

    //全选按钮绑定事件
    $all.click(function (){
        var sum = 0;
        var oiCount = 0;
        for (var i = 0 ; i < $(".singleCheckbox").length ; i++){
            $(".singleCheckbox")[i].checked = $all[0].checked;
            if ($(".singleCheckbox")[i].checked){
                sum = parseInt($($(".orderitemPrice")[i]).html()) + sum;
                oiCount = oiCount + 1;
            }
        }
        //总价修改
        $(".orderPrice").html("￥"+sum.toFixed(2))
        //已选已选orderitem的个数修改
        $(".oiCount").html(" "+oiCount+" ");
    })

    // 给每个小复选框绑定点击事件
    for (var i = 0; i < $(".singleCheckbox").length; i++) {
        $(".singleCheckbox")[i].onclick = function() {
            // 控制全选按钮是否选中
            var flag = true;
            //计算总价
            var sum = 0;
            //已选orderitem的个数
            var oiCount = 0;
            // 每次点击一个小框，都检查是否所有复选框都被选中
            for (var i = 0; i < $(".singleCheckbox").length; i++) {
                if (!$(".singleCheckbox")[i].checked) {
                    flag = false;
                    //break; // 只要有一个小复选框没有被选中，全选按钮就没被选中，可跳出循环，下面小复选框不用再判断
                }
                else {
                    sum = parseInt($($(".orderitemPrice")[i]).html()) + sum;
                    oiCount = oiCount + 1;
                }
            }
            $all[0].checked = flag;
            //总价修改
            $(".orderPrice").html("￥"+sum.toFixed(2));
            //已选已选orderitem的个数修改
            $(".oiCount").html(" "+oiCount+" ");
        }
    }
}

function updateShopCart(index){

    $.ajax({

        url:"goods/updateShopCart.do",
        type:"post",
        data:{
            "id":$($(".hiddenInputCart")[index]).val(),
            "amount":$($(".goodsCountInCart")[index]).val()
        },
        dataType:"json",
        success:function (data){
            if (data.flag){
                console.log("修改购物车成功");
            }
        }

    })

}




//闭包
// function addAndSubBtn(){
//
//     var $addOiCount = $(".addOiCount");
//     for (var i = 0; i < $addOiCount.length; i++) {
//
//         (function (index){
//             $addOiCount[i].onclick = function (){
//
//                 alert($($(".goodsCountInCart")[index]).val());
//             }
//         })(i)
//
//     }
//
// }
