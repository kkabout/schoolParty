<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>校园Party</title>
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="/bootstrap-3.3.7-dist/css/bootstrap.css">
	<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/css/header.css">
	<script src="/js/jquery-3.3.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>




</head>
<script type="text/javascript">
	$(document).ready(function(){
		var str=getCookie("remembermeCookie");
		str = str.substr(1,str.length-1);
		var nickname=str;
		$("#nickname").val(nickname);

	});

	function getCookie(cname){
		var name=cname+"=";
		var ca=document.cookie.split(';');
		for(var i=0;i<ca.length;i++){
			var c=ca[i];
			while (c.charAt(0)=='')c= c.substring(1);
			if(c.indexOf(name)!=-1)return c.substring(name.length, c.length);
		}
		return "";
	}

	function remember(){
		var remFlag = $("input[type='checkbox']").is(':checked');
		if(remFlag==true){ //如果选中设置remFlag为1
				$("#remFlag").val("1");
		}else{ //如果没选中设置remFlag为""
			$("#remFlag").val("");
		}
	}
</script>
<body>
	<div class="container-fluid">
		
		<div class="header">
			<div class="w">
				
				<div class="nab">
					<div class="logo">
						<a href="#"></a>
					</div>
					<ul>
						<li id="index" class="tab nabactive" onclick="active(event)"><a href="index.jsp">门户</a></li>
						<li id="BBS" class="tab" onclick="active(event)"><a href="BBS.jsp">论坛</a></li>
						<li id="message" class="tab" onclick="active(event)"><a href="#">Messages</a></li>
					</ul>
				</div>
				<div class="headerbutton">
					<ul class="list-inline">
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
															<input type="hidden" name="remFlag" id="remFlag"/>
															<input class="user_id_pwd " name="nickname" id="nickname" type="text" value="${nickname}" placeholder="昵称(例：吃饭大魔王)" >
															<p id="p_idTip" class="error_message"></p>
														</div>
														<div class=" line margin_bottom_40">
															<input class="user_id_pwd" type="password" id="password" name="password" value="${password}"   placeholder="密码(6-16个字符组成，区分大小写)">
															<p id="p_pwdTip" class="error_message"></p>
														</div>
														<div class=" line margin_bottom_40"><!-- 验证码 -->
															<input class="codeText float_left " type="text" name="code" id="code" placeholder="验证码" >
															<img src="${basePath}/user/randrom" class="codeImg float_right" id="imgcode"  onclick="refCode()" title="点击我重新获取">
															<p id="p_verifycodeTip"></p>
														</div>
														<div class=" line margin_bottom_40">
															<input name="aaaa" type="checkbox" onclick="remember();">记住用户名
														<%--<input type="checkbox" name="rememberme" value="1 " ${not empty cookie.remembermeCookie? "checked='checked'" : ""}>记住用户名--%>
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
							<li><a href="/user/register" target="_blank "><i class="fa fa-child "></i>&nbsp注册</a></li>
						</c:if>

						<c:if test="${!empty user}">
							<li><a href="#">欢迎您，${user.nickname}</a></li>
							<li><a href="${basePath}/user/logout"><i class="fa fa-child"></i>|退出</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<!-- <div class="imgshow">
			<div class="w inner">
				<div class="logo">
					<h1>
						<a href="#">校园Party</a>
					</h1>			
				</div>
				<div>
					
				</div>
			</div>
		</div> -->
	</div>

</body>
</html>