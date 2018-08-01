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

<body>
<div class="zhuye">
    <jsp:include page="head.jsp" flush="true"/>
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
						<a href="${basePath}/post/selectAllPost.go?idplate=${k.idplate}" title="${k.pdescription}"/>${k.pname}(20)</a>
					</span>
            </div>
          </c:forEach>
        </div>
    </div>
    <jsp:include page="footer.jsp" flush="true"/>
</div>
</body>
</html>
