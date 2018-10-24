<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="head.jsp"></jsp:include>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
	<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/expressrep.css">
</head>
<body>
	<div class="w">
		<div class="hbgc">
			<img src="image/headbg.jpg">
		</div>
		<div class="post-nav">
				<a href="#" title="主页"><i class="fa fa-coffee"></i></a>
				<span class="spacer">></span>
				<a href="#" title="论坛">论坛</a>
				<span class="spacer">></span>
				<a href="#" title="代取快递">代取快递</a>
				<span class="spacer">></span>
				<a href="#" id="">发帖</a>
			</div>
		<div class="repmain">
			<div class="reph">
				<h1>发布代取</h1>
			</div>
			<form action="">
				<div class="repm">
					<div class="rpbody">
						<div class="putm">
							<table>
								<tbody>
									<tr>
										<th>
											<label>快递公司名称：</label>	
										</th>
										<td>
											<input type="text" name="">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="putm">
							<table>
								<tbody>
									<tr>
										<th>
											<label>快递领取短信：</label>	
										</th>
										<td>
											<textarea name="" placeholder="包裹领取地点及领取号码等必填"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="putm">
							<table>
								<tbody>
									<tr>
										<th>
											<label>收件人姓名：</label>	
										</th>
										<td>
											<input type="text" name="">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="putm">
							<table>
								<tbody>
									<tr>
										<th>
											<label>手机号码：</label>	
										</th>
										<td>
											<input type="text" name="">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="putm">
							<table>
								<tbody>
									<tr>
										<th>
											<label>配送地址：</label>	
										</th>
										<td>
											<input type="text" name="">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="putm">
							<table>
								<tbody>
									<tr>
										<th>
											<label>配送时间：</label>	
										</th>
										<td>
											<input type="text" name="">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="putm">
							<table>
								<tbody>
									<tr>
										<th>
											<label>代取赏金：</label>	
										</th>
										<td>
											<input type="text" name="">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="putm">
							<table>
								<tbody>
									<tr>
										<th>
											<label>包裹相关信息说明：</label>	
										</th>
										<td>
											<textarea name="" placeholder="如包裹重量、想要告知信息等"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="rpbot">
						<div class="rpcb">
							<input type="checkbox" name="">
							<span>我已同意<a href="#">服务条款</a></span>
						</div>
						<div class="rpbut">
							<button>发布</button>
						</div>
					</div>
				</div>	
			</form>
		</div>
	</div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>