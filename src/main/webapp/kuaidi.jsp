<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
request.setAttribute("basePath",basePath);
%>
<!DOCTYPE HTML>

<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>校园Party</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="favicon.ico">


	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">
	
	
	
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/css/owl.theme.default.min.css">
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.waypoints.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>	
	<script src="/js/main.js"></script>

	<link rel="stylesheet" href="/css/kuaidi.css">
	
	
	

</head>
<body>
		
	
	<div id="page">

		<header class="header-area transparent-bar header-position">
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-md-4 col-5 col-sm-4">
							<div class="logo">
								<a href="index.html">
									<img class="logonor" alt="" src="">
								</a>
							</div>
						</div>
						<div class="col-lg-9 col-md-8 col-7 col-sm-8">
							<div class="menu-search-bundle">
								<div class="main-menu">
									<nav>
										<ul>
											<li><a href="index.html">主页</a></li>
											
										</ul>
									</nav>
								</div>
								<div class="search-wrap">
									<a href="#">
										<span>我是卢本伟</span>
									</a>
								</div>
							</div>
							
						</div>
					</div>
				</div>
		</header>



		<div id="kuaidi" class="kuaidi-cover kuaidi-cover-md" role="banner">
			<div class="kuaidi-container">
				<div class="row">
					<div class="col-md-12 col-md-offset-0 text-left">		
						<div class="row row-mt-15em">
							<div class="col-md-2"></div>
							<div class="col-md-8 animate-box" data-animate-effect="fadeInRight">
								<div class="form-wrap">
									<div class="tab">	
										<div class="tabcontent">
											<div class="tabcontent-inner active" data-content="signup">
												<h3 style="color:#EEC591;">快递代拿信息</h3>
												<form action="/post/insertPost.go" method="post">
                                                    <input type="hidden" name="userid" value="${user.uid}" />
                                                    <input type="hidden" name="idplate" value="2" />
													<div class="row form-group">
														<div class="col-md-3"></div>
														<div class="col-md-6">
															<label>快递取货码</label>
															<input type="text" name="kdcode" id="fullname" class="form-control">
														</div>
														<div class="col-md-3"></div>
													</div>
													<div class="row form-group">
														<div class="col-md-3"></div>
														<div class="col-md-6">
															<label>收件人手机号</label>
															<input type="text" name="kdphone" id="fullname" class="form-control">
														</div>
														<div class="dol-md-3"></div>
													</div>
													<div class="row form-group">
														<div class="col-md-3"></div>
														<div class="col-md-6">
															<label>快递公司名称</label>
															<input type="text" name="kdcompany" id="fullname" class="form-control">
														</div>
														<div class="dol-md-3"></div>
													</div>
													<div class="row form-group">
														<div class="col-md-3"></div>
														<div class="col-md-6">
															<label>收件人姓名</label>
															<input type="text" name="kdname" id="fullname" class="form-control">
														</div>
														<div class="dol-md-3"></div>
													</div>
													<div class="row form-group">
														<div class="col-md-3"></div>
														<div class="col-md-6">
															<label>主题</label>
															<input type="text" name="title" id="fullname" class="form-control">
														</div>
														<div class="dol-md-3"></div>
													</div>
													<div class="row form-group">
														<div class="col-md-2"></div>
														<div class="col-md-8 posttext">
															<label>帖子内容</label>
															<!-- <input type="text" id="fullname" class="form-control"> -->
															<textarea class="form-control" name="content" id="posttext" style="resize: none">
															</textarea>
														</div>
														<div class="dol-md-2"></div>
													</div>
												
													<div class="row form-group">
														<div class="col-md-3"></div>
														<div class="col-md-6">
															<input type="submit" class="btn btn-primary btn-block" value="发帖">
														</div>
														<div class="col-md-3"></div>
													</div>
													
												</form>	
											</div>	
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-2"></div>
							</div>
								
						
					</div>
				</div>
			</div>
		</div>
		
		
	
		<footer id="kuaidi-footer" role="contentinfo">
		<div class="kuaidi-container">			
			<div class="row copyright">
				<div class="col-md-12">
					<p class="pulleft">
						<small class="block">Copyright &copy; 2019.CParty All rights reserved. &nbsp;为校园Party负责人&nbsp;&nbsp;<a href="#">康康</a>&nbsp;所有</small>
					</p>
					<p class="pull-right">
						<ul class="gtco-social-icons pull-right">
							<li><a href="#"><i class="fa fa-qq fa-2x"></i></a></li>
							<li><a href="#"><i class="fa fa-facebook-official fa-2x"></i></a></li>
							<li><a href="#"><i class="fa fa-weibo fa-2x"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-mastercard fa-2x"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-paypal fa-2x"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-visa fa-2x"></i></a></li>
						</ul>
					</p>
				</div>
			</div>

		</div>
	</footer>
		
	
	</div>
	
	


	
	
</body>
</html>

