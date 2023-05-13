$(function (){

    //导航栏加载类别
    typeNav();

    //搜索功能：模糊查询
    $("#searchBtn").click(function (){

        // alert($("#searchInput").val());
        $.ajax({

            url:"goods/searchGoods.do",
            data:{
                "searchGoods":$("#searchInput").val()
            },
            type:"post",
            dataType:"json",
            success:function (data){

                document.location.href="good_search.jsp";

            }

        })

    })

    //点击购物车按钮
    $("#shopCartNumber").click(function (){
        //判断当前用户是否登录
        $.ajax({

            url:"user/isLogin.do",
            type:"post",
            dataType:"json",
            success:function (data){
                //已登录
                if (data){
                    //alert("已登录");
                    document.location.href="/shoppingCart.jsp";
                }
                //未登录
                else {
                    alert("登录后才能进入购物车！");
                    document.location.href="/login.jsp";
                }

            }

        })
    })

    $("#MyBuyGoods").click(function (){

        //判断当前用户是否登录
        $.ajax({

            url:"user/isLogin.do",
            type:"post",
            dataType:"json",
            success:function (data){
                //已登录
                if (data){
                    //alert("已登录");
                    document.location.href="/MyOrder.jsp";
                }
                //未登录
                else {
                    alert("登录后才能进入！");
                    document.location.href="/login.jsp";
                }

            }

        })

    })


    $("#MySellOrder").click(function (){

        //判断当前用户是否登录
        $.ajax({

            url:"user/isLogin.do",
            type:"post",
            dataType:"json",
            success:function (data){
                //已登录
                if (data){
                    //alert("已登录");
                    document.location.href="/GoodsOrders.jsp";
                }
                //未登录
                else {
                    alert("登录后才能进入！");
                    document.location.href="/login.jsp";
                }

            }

        })

    })

})

// function typeNav(){
//     //导航栏加载类别
//     $.ajax({
//         url:"type/typeNav.do",
//         type:"post",
//         data: {
//
//         },
//         dataType:"json",
//         success:function (data){
//
//             var $ul = $(".typeNav");
//             var arr = new Array();
//             $ul.html("");
//             arr.push("<li class='lison'><a href='goods/sort.do?type=all'>全部商品</a><span></span></li><br>");
//             for(var i = 0 ; i < data.length ; i++){
//                 arr.push("<li class='lison'><a href='goods/sort.do?type="+data[i].id+"'>"+data[i].name+"</a><span></span></li><br>");
//             }
//             $ul.append(arr.join("\n"));
//         }
//     })
// }

function typeNav(){
    //导航栏加载类别
    $.ajax({
        url:"type/typeNav.do",
        type:"post",
        data: {

        },
        dataType:"json",
        success:function (data){

            var $ul = $(".typeNav");
            var arr = new Array();
            $ul.html("");
            arr.push("<li class='lison'><a href='goods/sortPage.do?type=all&pageNum=1'>全部商品</a><span></span></li><br>");
            for(var i = 0 ; i < data.length ; i++){
                arr.push("<li class='lison'><a href='goods/sortPage.do?type="+data[i].id+"&pageNum=1'>"+data[i].name+"</a><span></span></li><br>");
            }
            $ul.append(arr.join("\n"));
        }
    })
}