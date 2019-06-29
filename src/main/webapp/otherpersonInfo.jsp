<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
    request.setAttribute("basePath",basePath);
%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">

        function changeInfo(){
            var form=document.forms[0];
            form.action="${basePath}/user/changeInfo";
            form.method="post";
            form.submit();
            location.reload();
        }

        //表单验证
        function changesubmit(){
            var nickname=document.getElementById("nickname");
            var oldWord=document.getElementById("OldWord");
            var password=document.getElementById("password");
            var confirmWord=document.getElementById("confirmWord");
            if(oldWord.value==""){
                alert("请输入旧密码");
                oldWord.focus();
                return false;
            }

            if(password.value==""){
                alert("请输入新密码");
                password.focus();
                return false;
            }

            if(confirmWord.value==""){
                alert("请确认新密码");
                confirmWord.focus();
                return false;
            }

            return true;
        }

        function realnamesubmit(){
            var truename=document.getElementById("truename");
            var institute=document.getElementById("institute");
            var schoolid=document.getElementById("schoolid");
            var nickname=document.getElementById("nickname");
            if(truename.value==""){
                alert("请输入真实姓名");
                truename.focus();
                return false;
            }
            if(institute.value==""){
                alert("请输入院系");
                institute.focus();
                return false;
            }
            if(schoolid.value==""){
                alert("请输入学号");
                schoolid.focus();
                return false;
            }
            return true;
        }
        <%--function changePasswd(){--%>
            <%--var form=document.forms[0];--%>
            <%--form.action="${basePath}/user/changePasswd";--%>
            <%--form.method="post";--%>
            <%--form.submit();--%>
<%--//            location.reload();--%>
        <%--}--%>


        $(function(){
//            左侧li列表点击效果显示
            $("li#l_firstPage").click(function(){
                $(".right_title").text("个人信息");
                $("#l_myInfo").removeClass("isChoose");
                $("#l_myRecord").removeClass("isChoose");
                $("#l_changePassword").removeClass("isChoose");
                $("#l_isRealName").removeClass("isChoose");
                $("#l_firstPage").addClass("isChoose");

                $("#r_myRecord").hide(0);
                $("#r_myInfo").hide(0);
                $("#r_changePassword").hide(0);
                $("#r_isRealName").hide(0);
                $("#r_firstPage").show(0);

            });
            $("li#l_myInfo").click(function(){
                $(".right_title").text("修改个人信息");
                $("#l_firstPage").removeClass("isChoose");
                $("#l_myRecord").removeClass("isChoose");
                $("#l_changePassword").removeClass("isChoose");
                $("#l_isRealName").removeClass("isChoose");
                $("#l_myInfo").addClass("isChoose");

                $("#r_myRecord").hide(0);
                $("#r_firstPage").hide(0);
                $("#r_changePassword").hide(0);
                $("#r_isRealName").hide(0);
                $("#r_myInfo").show(0);

            });

            $("li#l_myRecord").click(function(){
                $(".right_title").text("我的记录");
                $("#l_myInfo").removeClass("isChoose");
                $("#l_firstPage").removeClass("isChoose");
                $("#l_changePassword").removeClass("isChoose");
                $("#l_isRealName").removeClass("isChoose");
                $("#l_myRecord").addClass("isChoose");

                $("#r_myInfo").hide(0);
                $("#r_firstPage").hide(0);
                $("#r_changePassword").hide(0);
                $("#r_isRealName").hide(0);
                $("#r_myRecord").show(0);

            });
            $("li#l_changePassword").click(function(){
                $(".right_title").text("修改密码");
                $("#l_myInfo").removeClass("isChoose");
                $("#l_myRecord").removeClass("isChoose");
                $("#l_firstPage").removeClass("isChoose");
                $("#l_isRealName").removeClass("isChoose");
                $("#l_changePassword").addClass("isChoose");

                $("#r_myInfo").hide(0);
                $("#r_firstPage").hide(0);
                $("#r_myRecord").hide(0);
                $("#r_isRealName").hide(0);
                $("#r_changePassword").show(0);

            });
            $("li#l_isRealName").click(function(){
                $(".right_title").text("认证个人信息");
                $("#l_myInfo").removeClass("isChoose");
                $("#l_myRecord").removeClass("isChoose");
                $("#l_firstPage").removeClass("isChoose");
                $("#l_changePassword").removeClass("isChoose");
                $("#l_isRealName").addClass("isChoose");

                $("#r_myInfo").hide(0);
                $("#r_firstPage").hide(0);
                $("#r_myRecord").hide(0);
                $("#r_changePassword").hide(0);
                $("#r_isRealName").show(0);

            });
//        我的记录
            $("#r_send").click(function(){
                $("#r_watched").removeClass("font_color");
                $("#r_replay").removeClass("font_color");
                $("#r_send").addClass("font_color");
                $("#r_watched_nav").hide(0);
                $("#r_replay_nav").hide(0);
                $("#r_send_nav").show(0);

            });
            $("#r_replay").click(function(){
                $("#r_watched").removeClass("font_color");
                $("#r_send").removeClass("font_color");
                $("#r_replay").addClass("font_color");
                $("#r_watched_nav").hide(0);
                $("#r_send_nav").hide(0);
                $("#r_replay_nav").show(0);

            });
            $("#r_watched").click(function(){
                $("#r_send").removeClass("font_color");
                $("#r_replay").removeClass("font_color");
                $("#r_watched").addClass("font_color");
                $("#r_replay_nav").hide(0);
                $("#r_send_nav").hide(0);
                $("#r_watched_nav").show(0);

            });
        });

        // 选择图片显示
        function imgChange(obj) {
//获取点击的文本框
//            var choosefile =document.getElementById("choosefile");
            var file=document.getElementById("choosefile");
            var imgUrl =window.URL.createObjectURL(file.files[0]);
            var img =document.getElementById('img');
            img.setAttribute('src',imgUrl); // 修改img标签src属性值
        };

    </script>
    <title></title>
</head>
<style>
    div{
        margin: 0;
        padding: 0;
    }
    .main_left,
    .main{
        margin:0 auto;
    }

    .main{
        overflow: hidden;
        width: 980px;
        height: 100%;
        margin: 10px auto 100px;
        border: 1px solid #e1e2e5;
        box-shadow: 0 2px 4px rgba(0,0,0,.14);
        background: #fafafa;
        border-radius: 4px;
    }
    .main_left{

        width: 150px;
        height: 100%;
        overflow: hidden;
    }
    .main_right{

        width: 829px;
        border-left: 1px solid #ddd;
        background: #fff;
        min-height: 890px!important;


    }
    .main_left,
    .main_right
    {
        float:left;
    }
    .h_inner{
        height: 200px;
        overflow: hidden;
    }


    .float_left {
        float:left;
    }
    .float_right {
        float:right;

    }
    a{
        text-decoration:none;
    }



    .clearfix:after {
        content:"";
        display: block;
        clear:both;
    }
    /*取消li缩进*/
    .left_ul{
        list-style:none;
        margin:0px;
        padding:0px;
    }

    .left_ul li{
        display: list-item;
        list-style: none;
        width: 150px;
        height: 48px;
        line-height: 48px;
    }
    .left_ul li i{
        margin-left: 20px;
    }
    .left_ul li span{
        margin-left: 12px;
        cursor: default;
    }
    .right_banner div:hover,
    .left_ul li:hover{
        background-color:  #e1e2e5 ;
    }

    .left_list{
        width: 150px;
        height: 48px;
        line-height: 48px;}
    .left_list{
        display: block;
        text-align: center;
        font-size: 16px;
        color: #99a2aa;
        cursor: default;
        border-bottom: 1px solid #e1e2e5;
    }
    .right_user{
        padding: 20px 20px 0;
        min-height: 140px;


    }
    /*border-bottom: 1px solid #e5e9ef;/!*下划线*!/*/
    .right_banner,
    .right_title{
        line-height: 48px;
        height: 48px;
        font-size: 16px;
        border-bottom: 1px solid #e1e2e5;
        padding-left: 20px;
    }


    .right_line{
        width: 380px;
        float: left;
        margin-bottom: 20px;
    }
    .r_span_m{
        float: left;
        width:95px;
        text-align: right;
        height: 30px;
    }
    .border_string{
        width: 789px;

        border-bottom: 1px solid #e5e9ef;
        margin-bottom: 40px;
    }
    .input_inner_min,
    .input_inner{

        width: 222px;
        padding: 0 0 0 10px;
        margin-right: 10px;
        height: 28px;
    }
    .input_inner_min{
        width: 100px;
        float: left;
    }
    .r_textarea{

        /*右侧签名文本域*/
    }
    .realName_photo,
    .user_photo,
    .r_textarea,
    .save_button,
    .input_inner,
    .input_inner_min
    {
        -webkit-border-radius: 5px;
        border: 1px solid #dfdfdf;
        -moz-border-radius : 1px;
    }

    a{
        text-decoration:none;
        color: #0f0f0f;
    }
    .save_button{
        width: 100px;
        height: 40px;
        margin: 0 auto;
        color: white;
        /*background-color: //#f7f7f7;*/
        background-color :#39afe6;
        font-size: large;
    }


    .isChoose{
        background-color: #00a0da !important;
    }

    .right_nav{
        float: left;
        margin-left: 20px;
        width:160px;
        text-align: center;
    }
    .font_color{
        color: #00a0da;

    }
    .right_user_r{
        text-align: center;
    }
    .right_user_r,
    .right_user_l{
        width: 390px;
        display: inline-block;
        float: left;
    }

    .user_photo{
        width: 250px;
        height: 250px;
        overflow: hidden;
        display: inline-block;
        margin-bottom: 20px;

    }
    .center_line{
        margin-top: 20px;
        text-align: center;

    }
    .realName_photo{
        width: 227px;
        height: 130px;
        overflow: hidden;

    }
    .realName_photo_div{
        width: 229px;
        height: 200px;
        text-align: center;
        float: left;
        margin-left: 20px;
    }
    .guanzhu button{
        width: 70px;
        height: 30px;
        font-size:15px;
        color: #FFF;
        border-color: #00a0da;
        background-color: #00a0da;
        border-radius:5px;
    }
    .guanzhu button a{
        text-decoration: none;
        color:#FFF;
    }
    .guanzhu button:hover{
        transition:all 0.3s ease-in-out;
        -webkit-transition:all 0.3s ease-in-out;
        background-color:#1ab6ef;
        border-color: #1ab6ef;
    }
</style>
<body>
<div>
    <div class="main clearfix">
        <div class="main_left ">
            <!--左侧导航栏-->
            <div>
                <span class="left_list">个人中心</span>
                <ul class="left_ul">
                    <li id="l_firstPage" class="isChoose">
                        <i>
                            <!--图标-->
                        </i>
                        <span >他的信息</span>
                    </li>
                    <li id="l_myRecord">
                        <i >
                            <!--图标-->
                        </i>
                        <span >他的记录</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main_right ">
            <div class="right_title">个人信息</div>
            <div class="right_home">
                <div id="r_firstPage" >
                    <div class="right_user clearfix">
                        <div class="right_user_l">

                            <div class="right_line">
                                <span class="r_span_m">昵称：</span>
                                <span>${otheruser.nickname}</span>

                            </div>
                            <%--<div class="right_line">--%>
                                <%--&lt;%&ndash;<span class="r_span_m">用户权限：</span>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<span>${otheruser.isadmin}</span>&ndash;%&gt;--%>

                            <%--</div>--%>
                            <div class="right_line">
                                <span class="r_span_m">性别：</span>
                                <div>
                                            <span >${otheruser.sex}
                                            </span>
                                </div>
                            </div>
                            <div class="right_line">
                                <span class="r_span_m">邮箱：</span>
                                <span>${otheruser.email}</span>

                            </div>
                            <div class="right_line">
                                <span class="r_span_m">悬赏完成：</span>
                                <span>0</span>
                                <lable>次</lable>

                                <span >累计赏金：</span>
                                <span>0</span><lable>元</lable>
                            </div>
                            <div class="right_line">
                                <span class="r_span_m">发帖数：</span>
                                <span>0</span><lable>次</lable>
                                <span>评论数：</span>
                                <span>0</span><lable>次</lable>




                            </div>
                        </div>
                        <div class="right_user_r">
                            <img src="${otheruser.img}" class="user_photo" alt="user"/>
                            <div style="clear: both;"></div>
                            <c:choose>

                                <c:when test="${hasfocus==false}">
                                    <div class="guanzhu">
                                        <button><a href="/friend/addfocus?curid=${user.uid}&otherid=${otheruser.uid}&nickname=${otheruser.nickname}">关注他</a></button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="guanzhu">
                                        <button><a href="/friend/deletefocus?curid=${user.uid}&otherid=${otheruser.uid}&nickname=${otheruser.nickname}">已关注</a></button>
                                    </div>
                                </c:otherwise>

                            </c:choose>
                            <div>
                                <span>关注：</span><a href="/friend/showfocus?curid=${otheruser.uid}">${focus}</a>
                                <span>粉丝：</span><a href="/friend/showfollow?curid=${otheruser.uid}">${followers}</a>
                            </div>
                            <div class="right_line">
                                <span class="r_span_m">他的签名：</span>
                            </div>
                            <div>
                                <span >${otheruser.signature}</span>
                            </div>
                        </div>



                    </div>
                </div>
                <div id="r_myRecord" style="display:none">
                    <div class="right_banner">
                        <div class="right_nav font_color" id="r_send"><span >他的帖子</span></div>
                        <div class="right_nav" id="r_replay"><span>他的回帖</span></div>
                    </div>
                    <div class="right_user clearfix">
                        <div id="r_send_nav">
                            <div style="float: left">
                                <span>帖子</span>
                                <span>点击</span>
                                <span>回复</span>
                                <span>板块</span>
                                <span>时间</span>
                            </div>

                        </div>
                        <div  id="r_replay_nav" style="display:none">
                            <div style="float: left">
                                <span>回帖</span>
                                <span>点击</span>
                                <span>回复</span>
                                <span>板块</span>
                                <span>时间</span>
                            </div>
                        </div>
                        <div id="r_watched_nav" style="display:none">
                            <div style="float: left">
                                <span>标题</span>
                                <span>作者</span>
                                <span>时间</span>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>


    </div>
</div>
</body>
<c:if test="${!empty user}">
    <jsp:include page="chat.jsp"></jsp:include>
</c:if>

</html>