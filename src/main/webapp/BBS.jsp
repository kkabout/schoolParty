<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="head.jsp"></jsp:include>
<head>
	<meta charset="UTF-8">
	<title>校园Party</title>
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="/bootstrap-3.3.7-dist/css/bootstrap.css">
	<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<script type="text/javascript" src="/bootstrap-3.3.7-dist/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/css/BBS.css">
</head>
<body>

	<div class="container-fluid">
		<div class="w">
			<div class="BBS-head">
				
			</div>
			<div class="BBS-body">
				<div class="BBS-nav">
					<a href="#" title="主页"><i class="fa fa-coffee"></i></a>
					<span class="spacer">></span>
					<a href="#" title="论坛">校园Party</a>
					<span class="spacer">></span>
					<a href="#" title="板块名">${plate.pname}</a>

				</div>
				<div class="BBS-post">
					<div class="post-report">
						<a href="#">发帖</a>
					</div>
					<span class="page">
						<div class="post-paging">
							<strong>1</strong>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
							<a href="#">6</a>
							<a href="#">7</a>
							<a href="#">8</a>
							<a href="#">9</a>
							<a href="#">...50</a>
							<label>
								<input type="text" value="1" style="height: 25px;width: 40px;color: #000;outline: none;">
								<span>/50页</span>
							</label>
							<a href="#">下一页&nbsp<i class="fa fa-chevron-circle-right"></i></a>
						</div>
					</span>
					<span class="page-back">
						<a href="#"><i class="fa fa-chevron-circle-left"></i>&nbsp返回</a>
					</span>
					
				</div>
				<div class="BBS-main">
					<div class="th">
						<a href="#">全部主题</a>
						<a href="#">最新</a>
						<a href="#">热门</a>
						<a href="#">精品</a>
						<a href="#">更多</a>
					</div>
					<div class="tm">
						<form action="">
							<table>
								<tbody>
									<tr>
										<th>
											<div class="tcommon">
												<div class="tctitle">
													<em>[<a href="#" id="lable">公告</a>]</em>
													<a href="#" id="artitle">打起来！打起来！</a>
												</div>
												<div class="tcauthor">
													<div class="at">发布:&nbsp<a href="#" id="author">带王</a><span id="time">2018/7/26</span></div>
												</div>
											</div>
										</th>
									</tr>
								</tbody>
								<c:forEach items="${posts}" var="post">
									<tbody>
									<tr>
										<th>
											<div class="tcommon">
												<div class="tctitle">
													<em>[<a href="#" id="lable">${post.type}</a>]</em>
													<a href="#" id="artitle">${post.title}</a>

												</div>
												<div class="tcauthor">
													<div class="at">作者:&nbsp<a href="#" id="author">偷梗宗师西西卡</a><span id="time">${post.publishTime}</span></div>
													<span class="spacer">|</span>
													<div class="lastrp">最后发表：&nbsp<a href="#" id="lastreport">米姥爷</a><span>2018/7/26</span></div>
												</div>
											</div>
											<div class="checknum">
												<span id="rech">回复/查看</span>
												<div>
													<a href="#" id="renum">4396</a>
													/
													<span>6324</span>
												</div>
											</div>
										</th>
									</tr>
									</tbody>
								</c:forEach>


							</table>
						</form>
					</div>
				</div>
				<div class="nextpage">
					<a href="#">下一页</a>
				</div>
			</div>

			<c:if test="${!empty user}">
				<div class="fastpost">
					<h2>快速发帖</h2>
					<div class="parea">
						<form action="/post/insertPost.go" method="post">
							<input type="hidden" name="userid" value="${user.uid}" />
							<input type="hidden" name="idplate" value="${idplate}" />
							<div class="fph">
								<div class="themesel">
									<select name="type">
										<option value="口嗨">口嗨</option>
										<option value="找人">找人</option>
										<option value="diss">diss</option>
										<option value="交易">交易</option>
									</select>


								</div>

								<input type="text" name="title" id="title">
								<span></span>
							</div>
							<div class="fpm">
								<div class="fpm-type">
								<span class="admode">
									<a href="#">高级模式</a>
								</span>
								</div>
								<div class="fpm-tarea">
									<textarea name="content" id="content"></textarea>
								</div>
								<!-- <script type="text/javascript" src="js/ckeditor5-build-classic/ckeditor.js"></script>
                                <script>
                                    var myEditor = null;
                                    window.onload = function(){
                                         ClassicEditor
                                        .create(document.querySelector("#editor"))
                                        .then(editor => {
                                            myEditor = editor;
                                        })
                                        .catch(error => {
                                            console.error(error);
                                        });
                                    }
                                </script> -->
							</div>
							<div class="line">
								<input class="submit_btn" type="submit" value="发帖" >
							</div>
						</form>
					</div>
				</div>
			</c:if>


		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>