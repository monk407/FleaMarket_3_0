$(function (){

    $("#registerBtn").click(function (){

        var checkbox = document.getElementsByClassName('checkbox');
        var username = $("#username");
        var email = $("#email");
        var password = $("#pwd");
        var addressName = $("#name");
        var phone = $("#phonenumber");
        var address = $("#address");
        var ipt = $("#ipt");
        //判断是否同意协议
        if(checkbox[0].checked==true){
            //alert("注册成功！");

            //判断全部信息是否填上，全部填上才能注册
            // if(ipt.val().length>0 && username.val().length>0 && email.val().length>0 && password.val().length>0
            //     && addressName.val().length>0 && phone.val().length > 0 && address.val().length >0){
            if(ipt.val().trim().length>0 && username.val().trim().length>0 && email.val().trim().length>0 && password.val().trim().length>0){
                $.ajax({

                    url:"user/register.do",
                    type:"post",
                    data:{
                        "ipt":ipt.val(),
                        "username":username.val(),
                        "email":email.val(),
                        "password":password.val(),
                        "addressName":addressName.val(),
                        "phone":phone.val(),
                        "address":address.val()
                    },
                    dataType:"json",
                    success:function (data){
                        //判断验证码是否输入成功
                        if (data.codefalg){
                            //判断用户填写的用户名和邮箱是否已经在数据库存在
                            if(data.flag){
                                alert("注册成功");
                                document.location.href = "/login.jsp";
                            }
                            else {
                                alert("注册失败！用户名和邮箱已存在！");
                            }
                        }
                        else {
                            alert("验证码输入错误！！！")
                        }

                    }

                })

            }
            else {
                alert("红点的信息请填上！");
            }

        }
        else{
            alert("请先阅读并同意《用户注册协议》！")
        }


    })


})