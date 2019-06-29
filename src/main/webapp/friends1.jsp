<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
request.setAttribute("basePath",basePath);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<link rel="stylesheet" href="/css/friends.css">
	
	
	

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
											<li><a href="/index/index">主页</a></li>
											
										</ul>
									</nav>
								</div>
								<div class="search-wrap">
									<a href="/user/personInfo?uid=${user.uid}">
										<span>${user.nickname}</span>
									</a>
								</div>
							</div>
							
						</div>
					</div>
				</div>
		</header>

	<div class="friends">
		<div class="col-md-3"></div>
		<div class="flist_ct col-md-6">
	    	    <table class="flist_tb" cellpadding="0" cellspacing="0" border="0">
	    	    	<tbody class="friList">

                    <c:forEach items="${foucsUserInfo1}" var="foucsUsers1">
                        <tr class="flist_tr friLi" name="" id="friend1" >
                            <td class="pic col-md-1"><img src="${foucsUsers1.img}" alt="" width="150px" height="150px;"></td>
                            <td class="info col-md-9"><p class="name">${foucsUsers1.nickname}</p><p class="oth">关注：${foucsUsers1.focuscount}</p><p class="oth">粉丝：${foucsUsers1.followcount}</p><p class="oth">个性签名：${foucsUsers1.signature}</p></td>
                            <td class="col-md-2"><button class="btn btn-primary"><a href="/user/otherinfo?nickname=${foucsUsers1.nickname}&curid=${user.uid}">查看详细信息</a></button></td>
                        </tr>
                    </c:forEach>


	    	    		
	    	    		
	    	    	</tbody>
	    	    </table>                
	    </div>
	    <div class="col-md-3"></div>
	</div>
		
		
	
		<footer id="friend-footer" role="contentinfo">
		<div class="friend-container">			
			<div class="row copyright">
				<div class="col-md-12">
					<p class="pulleft">
						<small class="block">Copyright &copy; 2019.CParty All rights reserved. &nbsp;为校园Party负责人&nbsp;&nbsp;<a href="#"></a>&nbsp;所有</small>
					</p>
				</div>
			</div>

		</div>
	</footer>
		
	
	</div>
	
	


	
	
</body>
</html>

