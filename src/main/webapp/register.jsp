<%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>
<!DOCTYPE>
<html lang="en">


<script src="/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="/js/jquery.validate.min.js" type="text/javascript"></script>



    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>校园party</title>
        <link rel="stylesheet" type="text/css" href="/css/register.css">
    </head>
    <body>
    <script>


        var result;
        $.validator.addMethod(
            //规则的名称
            "checkUser",
            //校验的函数
            function (value,element,params) {
                //value输入的内容
                //element被校验的元素
                //params
                var flag = false;
                $.ajax({
                    "async":false,
                    "url":"${pageContext.request.contextPath}/user/checkUser.go",
                    "data":{"nickname":value},
                    "type":"POST",
                    "dataType":"json",
                    "success":function (data) {
                        flag =data.isExist;

                    }
                });
                return !flag;
            }
        );
        $(function() {
            $("#checkcode").click(function() {
                var phone = $("#phone").val().trim();
                var code ="123";
                //login1为Action类命名空间名称；AjaxExecute为Action方法名称
                $.ajax({
                    type : "post",
                    url : '/user/sendCode.go',
                    data : {//设置数据源
                        phone:phone
                    },
                    dataType : "json",//设置需要返回的数据类型
                    success : function(d) {

                        result=d.sendCode;



                    },
                    error : function(d) {
                        alert("请求失败");
                    }
                });
            });
        });
        $.validator.addMethod("isMobile", function(value, element) {
            var length = value.length;
            var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "请正确填写您的手机号码");
        $.validator.addMethod("truecode",function (value,element) {


            return this.optional(element)||result==value;
        },"验证码错误");
        $.validator.addMethod("checkphone",function (value,emement) {
            var flag =false;
            $.ajax({
                "async":false,
                "url": "${pageContext.request.contextPath}/user/checkphone.go",
                "data":{"phone":value},
                "type":"POST",
                "dataType":"json",
                "success":function (data) {
                    flag =data.isExist;

                }

            });
            return !flag;
        })
        $().ready(function () {
            $("#regist").validate({
                errorPlacement: function(error, element) {
                    //在当前p标签中显示错误信息
                    $( element )
                        .closest( "form" )
                        .find( "p[for='" + element.attr( "id" ) + "']"  )
                        .append( error );
                },
                rules:{
                    nickname: {
                        required: true,
                        checkUser: true
                    },

                    passwd:{
                        required:true,
                        rangelength:[6,12]
                    },
                    repasswd:{
                        required:true,
                        rangelength:[6,12],
                        equalTo:"#passwd"
                    },
                    phone : {
                        required : true,
                        minlength : 11,
                        // 自定义方法：校验手机号在数据库中是否存在
                        // checkPhoneExist : true,
                        isMobile : true,
                        checkphone :true
                    },
                    code :{
                        required : true,
                        truecode :true

                    },
                    email:{
                        required:true,
                        email:true
                    }


                },
                messages:{
                    nickname:{
                        required:"用户名不能为空",
                        checkUser:"用户名已经存在"
                    },

                    passwd:{
                        required:"密码不能为空",
                        rangelength:"密码必须在6到12位"
                    },
                    repasswd:{
                        required:"密码不能为空",
                        rangelength:"密码必须在6到12位",
                        equalTo: "密码必须与第一次输入的密码相同"
                    },
                    phone : {
                        required : "请输入手机号",
                        minlength : "确认手机不能小于11个字符",
                        isMobile : "请正确填写您的手机号码",
                        checkphone:"该手机号码已被注册"
                    },
                    code :{
                        required : "请输入验证码",
                        truecode :"验证码不正确"

                    },
                    email:{
                        required:"邮箱不能为空",
                        email:"请输入正确的email"
                    }
                }
            });
        });
    </script>
        <script>

        $(function(){
            <!-- 密码强度检查与显示-->
            $('#passwd').blur(function () {
                var password=$('#passwd').val();
                var ls=0;
//				console.log('password:'+password);
                if(password.length>5&&password.length<13){
                    $('#degree_l').text("密码强度：");
                    if(password.match(/([a-z])+/)){
                        ls++;
                    }
                    if(password.match(/([0-9])+/)){
                        ls++;
                    }
                    if(password.match(/([A-Z])+/)){
                        ls++;
                    }
                    if(password.match(/[^a-zA-Z0-9]+/)){
                        ls++;
                    }
                    if(ls==1){
                        $('#degree_r').text("弱");
                        $('#degree1').addClass("degree_r");
                        $('#degree2').removeClass();
                        $('#degree3').removeClass();
                        $('#degree4').removeClass();
                    }else if(ls==2  ){
                        $('#degree_r').text("较弱");
                        $('#degree1').addClass("degree_r");
                        $('#degree2').addClass("degree_o");
                        $('#degree3').removeClass();
                        $('#degree4').removeClass();
                    }else if(ls==3){
                        $('#degree_r').text("中");
                        $('#degree1').addClass("degree_r");
                        $('#degree2').addClass("degree_o");
                        $('#degree3').addClass("degree_y");
                        $('#degree4').removeClass();
                    }else if(ls==4){
                        $('#degree_r').text("强");
                        $('#degree1').addClass("degree_r");
                        $('#degree2').addClass("degree_o");
                        $('#degree3').addClass("degree_y");
                        $('#degree4').addClass("degree_g");
                    }

                }else{
                    $('#degree1').removeClass();
                    $('#degree2').removeClass();
                    $('#degree3').removeClass();
                    $('#degree4').removeClass();
                    $('#degree_l').text("");
                    $('#degree_r').text("");
                }
            });

        });



    </script>

    <div class="title-line ">
        <span class="tit margin_bottom_40" style="font-size: 38px;">注册</span>
    </div>
        <div class="line"></div>
        <div class="main-info margin_top_28">
            <form id="regist" action="${pageContext.request.contextPath}/user/registUser.go" method="post">
                <div class="line" >
                    <label  class="lable_m" for="nickname">用户名</label>
                    <input class="user_id_pwd " type="text" name="nickname" id="nickname" placeholder="昵称(例：吃饭大魔王)">
                    <p for="nickname" class="error_message"></p>
                </div>
                <div class="line" id="hidden_widows">
                    <!--密码强度提示框-->
                    <span class="float_left" id="degree_l"></span>
                    <div class="" id="degree1"></div>
                    <div class="" id="degree2"></div>
                    <div class="" id="degree3"></div>
                    <div class="" id="degree4"></div>
                    <span id="degree_r" class="float_right"></span>
                </div>
                <div class="line margin_bottom_40">
                    <label  class="lable_m" for="passwd">密码</label>
                    <input class="user_id_pwd" type="password" name="passwd"  id="passwd" placeholder="密码(6-16个字符组成，区分大小写)">

                    <p for="passwd" class="error_message"></p>
                </div>
                <div class="line margin_bottom_40">
                    <label for="repasswd" class="lable_m" >确认密码</label>
                    <input class="user_id_pwd" type="password" name="repasswd" id="repasswd" placeholder="确认输入的密码">
                    <p for="repasswd" class="error_message"></p>
                </div>
                <div class="line margin_bottom_40">
                    <label  class="lable_m" >手机号</label>
                    <input class="user_id_pwd" type="text" name="phone" id="phone" placeholder="填写常用手机号码">
                    <p for="phone" class="error_message"></p>
                </div>
                <div class="line "><!-- 验证码 -->
                    <label  class="lable_m" >验证码</label>
                    <input class="codeText float_left" type="text" name="code"  id="code" placeholder="验证码">
                    <input class="codeImg float_right" type="button" value="点击获取" id="checkcode" >
                    <p  for="code" class="error_message"></p>
                </div>
                <div class="line text_align_left"><!-- 用户协议 -->
                    <label >
                        <input  type="checkbox" >
                        我已阅读并同意<a href="">《校园party用户使用协议》</a>
                    </label>

                </div>
                <div class="line">
                     <input class="submit_btn" type="submit" value="注册"  id="submit_btn">
                </div>

                <div class="line text_align_right">
                     <a href="#">已有账号，直接登录</a>
                </div>

        </form>
        </div>

    </div>
    <div class="line"></div>



 </body>

</html>