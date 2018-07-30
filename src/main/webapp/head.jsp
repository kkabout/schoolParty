<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<li><a href="#"><i class="fa fa-user"></i>&nbsp登录</a></li>
						<li><a href="#"><i class="fa fa-child"></i>&nbsp注册</a></li>
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