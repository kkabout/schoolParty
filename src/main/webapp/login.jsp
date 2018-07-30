<%--
  Created by IntelliJ IDEA.
  User: Murrary
  Date: 2018/7/18
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
    request.setAttribute("basePath",basePath);
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <style>
        *{
            padding: 0;
            margin: 0;
            font-family: MicrosoftYaHei;
        }
        .top,
        .main,
        .banner,
        .footer {
            width: 100%;
            border: 0px  dashed #ccc;
            margin: 0 auto;
        }
        .top{

            height: 42px;
            background-color: #eee;


        }
        .banner{

            height: 130px;
            background-color: #ddd;

        }
        .main{

            /* height:400px; */
            background-color: #fff;
        }
        .title-line {
            width: 960px;
            height: 28px;
            margin: 0 auto;

            border-bottom: 1px solid #ddd;
            margin-bottom: 28px;
            text-align: center;
        }
        .tit {
            height: 56px;line-height: 56px;
            margin: 0 auto;
            padding: 0 20px;
            background: #fff;
            text-align: center;
        }
        .footer{

            height: 100px;
            background-color: #eee;

        }

        .user_id_pwd {
            height: 20px ;
            width:417px;
            padding:10px;

        }
        .line {
            height: 44px ;
            line-height: 44px;
            width:439px;
            margin: 0 auto;
            position: relative;
        }
        .margin_top_28 {
            margin-top: 28px;
        }
        .margin_bottom_40 {
            margin-bottom:  40px;
        }
        .codeText {
            width:280px ;
            height: 20px ;
            /*float:left;	*/
            padding: 10px;
        }
        .codeImg {
            width:100px ;
            height: 40px;
            /*float:right ; */
            color: #666;
            background-color: #f7f7f7;
        }

        .float_left {
            float:left;
        }
        .float_right {
            float:right;
        }

        a {
            text-decoration: none;

        }
        .text-align_right {
            text-align:  right;
        }
        .text-align_left {
            text-align: left;
        }

        .submit_btn {
            width: 439px;
            height: 40px;
            color: #666;
            background-color: #f7f7f7;
        }
        /* 圆角边框 */
        .user_id_pwd,
        .codeText,
        .codeImg,
        .submit_btn
        {
            -webkit-border-radius: 1px;
            border: 1px solid #dfdfdf;
            -moz-border-radius : 1px;
        }

        .error_message {
            color: #f45d90;
            font-size: 12px;
            position: absolute;
            left: 450px;
            top: 50%;
            line-height: 16px;
            width: 270px;
        }
    </style>
    <meta charset="UTF-8">
    <title>schoolParty</title>
    <script type="text/javascript">
        //表单验证
        function loginsubmit(){
            var nickname=document.getElementById("nickname");
            var password=document.getElementById("password");
            var code=document.getElementById("code");
            if(nickname.value==""){
                alert("请输入用户名");
                uid.focus();
                return false;
            }

            if(password.value==""){
                alert("请输入密码");
                password.focus();
                return false;
            }

            if(code.value==""){
                alert("请输入验证码");
                code.focus();
                return false;
            }

            return true;
        }
        //获取验证码
        function refCode(){
            var date=new Date();
            var imgcode=document.getElementById("imgcode");
            imgcode.src="${basePath}/user/randrom?s="+date.getTime();
        }
    </script>
</head>
<body>
<div class="top">top</div>
<div class="main">
    <div class="banner">
        <img src="" >
    </div>
    <div class="title-line ">
        <span class="tit margin_bottom_40" style="font-size: 38px;">登录</span>
    </div>
    <div class="main-info margin_top_28">
        <form action="${basePath}/user/submitLogin" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return loginsubmit()"><!-- 注册表单 -->
            <div class=" line">
                <input class="user_id_pwd " id="nickname" name="nickname" type="text"  placeholder="昵称(例：吃饭大魔王)">
                <p id="p_idTip" class="error_message"></p>
            </div>
            <div class="line">
                <!--密码强度提示框-->
            </div>
            <div class=" line margin_bottom_40">
                <input class="user_id_pwd" type="password" name="password" id="password"  placeholder="密码(6-16个字符组成，区分大小写)">
                <p id="p_pwdTip" class="error_message"></p>
            </div>


            <div class=" line margin_bottom_40"><!-- 验证码 -->
                <input class="codeText float_left " type="text" name="code" id="code" placeholder="验证码">
                <!--<input class="codeImg float_right" type="img" value="点击获取">-->
                <img src="${basePath}/user/randrom"  class="codeImg float_right" id="imgcode" onclick="refCode()" title="点击我重新获取">
                <p id="p_verifycodeTip"></p>
            </div>

            <div class="line">
                <input class="submit_btn" type="submit" value="登录">
            </div>

            <div class="line text-align_right">
                <a href="#">还没有账号？来注册吧！</a>
            </div>

        </form>
    </div>
</div>
<div class="footer">footer</div>
</body>
</html>
