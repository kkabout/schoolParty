<%--
  Created by IntelliJ IDEA.
  User: Murrary
  Date: 2018/7/30
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
    request.setAttribute("basePath",basePath);
%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<script src="${basePath}/js/jquery-3.3.1.js" type="text/javascript"></script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>校园party-我的大学，不一young的玩法</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="${basePath}/css/index.css">
    <link rel="stylesheet" type="text/css" href="${basePath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${basePath}/css/footer.css">
    <link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap.min.css" />
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
    <script type="text/javascript" src="/js/head.js"></script>

    <script type="text/javascript">
        //header.jsp加载完毕后 去服务器端获得所有的category数据
        $.ajax({
            url:"${basePath}/admin/plate/select",
            type:"POST",
            async: true, //请求是否异步，默认为异步，这也是ajax重要特性
           
        });


                    //表单验证
                function loginsubmit(){
                    var nickname=document.getElementById("nickname");
                    var password=document.getElementById("password");
                    var code=document.getElementById("code");
                    if(nickname.value==""){
                        alert("请输入用户名");
                        nickname.focus();
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
<style>

    .codeImg,
    .codeText,
    .user_id_pwd,
    .line
    {height: 44px ;}

    .user_id_pwd {
        width:417px;
        padding-left: 10px;
    }
    .line {
        line-height: 44px;
        width:417px;
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
        padding: 10px;
    }
    .codeImg {
        width:100px ;
        color: black;
        text-align: center;
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
    .text_align_right {
        text-align:  right;
    }
    .text_align_left {
        text-align: left;
    }

    .submit_btn {
        width: 417px;
        height: 40px;
        margin: 0 auto;
        color: black;
        font-size: large;
        background-color: #00a0da;
    }
    /* 圆角边框 */
    .user_id_pwd,
    .codeText,
    .codeImg,
    .submit_btn
    {
        -webkit-border-radius: 5px;
        border: 1px solid #dfdfdf;
        -moz-border-radius : 5px;
    }

</style>
<body>
<div class="zhuye">
    <div class="container-fluid">
        <div class="header">
            <div class="w">
                <div class="nab">
                    <div class="logo">
                        <a href="#"></a>
                    </div>
                    <ul>
                        <li id="index" class="tab nabactive" onclick="active(event)">
                            <a href=" # ">门户</a></li>
                        <li id="BBS " class="tab " onclick="active(event) "><a href="# ">论坛</a></li>
                        <li id="message " class="tab " onclick="active(event) "><a href="# ">Messages</a></li>
                    </ul>
                </div>
                <div class="headerbutton ">
                    <ul class="list-inline ">
                <c:if test="${empty user}">
                        <li><a  data-toggle="modal" data-target="#myModal"><i class="fa fa-user "></i>&nbsp登录</a></li>
                        <div class="modal fade" id="myModal">
                            <div class="modal-dialog">
                                <div class="modal-content">

                                    <!-- 模态框头部 -->
                                    <div class="modal-header" >
                                        <h4 class="modal-title" style="margin: 0 auto" >登录</h4>
                                        <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                                    </div>

                                    <!-- 模态框主体 -->
                                    <div class="modal-body">

                                        <div class="main">
                                            <div class="main-info margin_top_28">
                                                <form action="${basePath}/user/submitLogin" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return loginsubmit()"><!-- 注册表单 -->
                                                    <div class=" line margin_bottom_40">
                                                        <input class="user_id_pwd " name="nickname" id="nickname" type="text"  placeholder="昵称(例：吃饭大魔王)" >
                                                        <p id="p_idTip" class="error_message"></p>
                                                    </div>
                                                    <div class=" line margin_bottom_40">
                                                        <input class="user_id_pwd" type="password" id="password" name="password"   placeholder="密码(6-16个字符组成，区分大小写)">
                                                        <p id="p_pwdTip" class="error_message"></p>
                                                    </div>
                                                    <div class=" line margin_bottom_40"><!-- 验证码 -->
                                                        <input class="codeText float_left " type="text" name="code" id="code" placeholder="验证码" >
                                                        <img src="${basePath}/user/randrom" class="codeImg float_right" id="imgcode"  onclick="refCode()" title="点击我重新获取">
                                                        <p id="p_verifycodeTip"></p>
                                                    </div>
                                                    <div class=" line margin_bottom_40">
                                                        <input type="checkbox" name="rememberme" value="1" ${not empty cookie.remembermeCookie? "checked='checked'" : ""}>记住用户名
                                                        <%--<input type="checkbox" name="autoLogin" value="1" ${not empty cookie.autoLoginCookie? "checked='checked'" : ""}>自动登录--%>
                                                        <%--<input name="remember" type="checkbox" value="1" ${not empty cookie.rememberCookie? "checked='checked'" : ""}>--%>
                                                        <%--记住密码--%>
                                                    </div>

                                                    <div class="line">
                                                        <input class="submit_btn" type="submit" value="登录" >
                                                    </div>
                                                </form>
                                                <div class="line ">
                                                    <a href="/user/register">还没有账号？来注册吧！</a>
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- 模态框底部 -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <li><a href="/register.jsp" target="_blank "><i class="fa fa-child "></i>&nbsp注册</a></li>
                </c:if>
                 <c:if test="${!empty user}">
                        <li><a href="/user/personInfo">欢迎您，${user.nickname}</a></li>
                        <li><a href="${basePath}/user/logout"><i class="fa fa-child"></i>|退出</a></li>
                 </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="title_count ">
        <a href="#"/><img src="${basePath}/image/H1.jpg" /></a>>
        <a href="#">论坛</a>
        <ul>
            <li id="t1" style="list-style: none;">♬我的大学，不一young的玩法</li>
        </ul>
        <hr />
        <div class="count1 ">
            <img src="${basePath}/image/m4.png " />&nbsp;&nbsp;总贴：1070404|主题：10856|今日：4567|昨日：8487|会员：98996|欢迎新会员：
            <a href="# ">galigalili</a>
            <span style="float: right; "><a href="# ">最新回复</a></span>
        </div>
    </div>

    <div class="Content ">
        <div class="Content1 ">
            <div class="content_title ">
                <a href="# ">>>校园生活信息</a>
            </div>
          <c:forEach items="${plate}" var="k">
            <div class="Content2 ">
                <img class="item1 " width="200px" src="${basePath}/image/img_xysh.jpg " title="${k.pdescription} "/>
					<span style="float: left;margin:10px 100px; ">
						<a href="${basePath}/post/selectAllPost.go?idplate=${k.idplate}&pageNum=1" title="${k.pdescription}"/>${k.pname}(${k.totalRecord})</a>
					</span>
            </div>
          </c:forEach>
        </div>
    </div>
    <div class="container-fluid footer ">
        <div class="w ">
            <div class="footof ">
                <div class="footlogo ">
                    <img src="${basePath}/image/logofoot.png ">
                </div>
                <div class="conlink ">
                    <ul class="list-inline ">
                        <li><a href="# ">关于我们</a></li><li class="spacer ">|</li>
                        <li><a href="# ">联系我们</a></li><li class="spacer ">|</li>
                        <li><a href="# ">招贤纳士</a></li><li class="spacer ">|</li>
                        <li><a href="# ">法律声明</a></li><li class="spacer ">|</li>
                        <li><a href="# ">友情链接</a></li><li class="spacer ">|</li>
                        <li><a href="# ">服务声明</a></li><li class="spacer ">|</li>
                        <li><a href="# ">广告声明</a></li>
                    </ul>
                    <div style="text-align: center; ">
                        Copyright &copy; 校园Party 版权所有
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:if test="${!empty user}">
    <jsp:include page="chat.jsp"></jsp:include>
</c:if>
</body>
</html>
