<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
	<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/css/express.css">
</head>
<body>
	<div class="w">
			<div class="epr-head">
				
			</div>
			<div class="epr-body">
				<div class="epr-nav">
					<a href="#" title="主页"><i class="fa fa-coffee"></i></a>
					<span class="spacer">></span>
					<a href="${basePath}/index/index" title="首页">首页</a>
					<span class="spacer">></span>
					<a href="#" title="代拿快递">代拿快递</a>
				</div>
				<div class="epr-post">
					<div class="post-report">
						<a href="#">找人代拿</a>
					</div>
					<span class="page">
						<div class="post-paging">

                            <c:forEach var="index" begin="1" end="${posts.totalpage}" step="1">
                                <c:if test="${posts.pageNum==index}">
                                    <strong>${index}</strong>
                                </c:if>
                                <c:if test="${posts.pageNum!=index}">
                                    <a href="${basePath}/post/selectAllPost.go?idplate=${plate.idplate}&pageNum=${index}">${index}</a>
                                </c:if>

                            </c:forEach>
							<%--<strong>1</strong>--%>
							<%--<a href="#">2</a>--%>
							<%--<a href="#">3</a>--%>
							<%--<a href="#">4</a>--%>
							<%--<a href="#">5</a>--%>
							<%--<a href="#">6</a>--%>
							<%--<a href="#">7</a>--%>
							<%--<a href="#">8</a>--%>
							<%--<a href="#">9</a>--%>
							<%--<a href="#">...50</a>--%>
							<label>
								<input type="text" value="${posts.pageNum}" style="height: 25px;width: 40px;color: #000;outline: none;">
								<span>/${posts.totalpage}页</span>
							</label>
						        <c:if  test="${posts.pageNum==posts.totalpage}">
                                    <a href="#">下一页&nbsp<i class="fa fa-chevron-circle-right"></i></a>
                                </c:if>
                            <c:if test="${posts.pageNum!=posts.totalpage}">
                                <a href="${basePath}/post/selectAllPost.go?idplate=${plate.idplate}&pageNum=${posts.pageNum+1}">下一页&nbsp<i class="fa fa-chevron-circle-right"></i></a>
                            </c:if>

						</div>
					</span>
                    <span class="page-back">
                        <c:if test="${posts.pageNum==1}">
                            <a href="#"><i class="fa fa-chevron-circle-left"></i>&nbsp上一页</a>
                        </c:if>
						<c:if test="${posts.pageNum!=1}">
                            <a href="${basePath}/post/selectAllPost.go?idplate=${plate.idplate}&pageNum=${posts.pageNum-1}"><i class="fa fa-chevron-circle-left"></i>&nbsp上一页</a>
                        </c:if>
					</span>
					
				</div>
				<div class="epr-main">
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
                                <c:forEach items="${posts.list}" var="post">
                                    <tbody>
                                    <tr>
                                        <th>
                                            <div class="tcommon">
                                                <div class="tctitle">
                                                    <em>[<a href="#" id="lable">交易</a>]</em>
                                                    <a href="${basePath}/reply/selectAllReply?idpost=${post.idpost}&idplate=${plate.idplate}&pageNum=1" id="artitle">${post.title}</a>
                                                    <c:if test="${post.end==1}">
                                                        <em class="eprsta"><已被接取></em>
                                                    </c:if>
                                                    <c:if test="${post.end!=1}">
                                                        <em class="eprsta"><未被接取></em>
                                                    </c:if>



                                                </div>
                                                <div class="tcauthor">
                                                    <div class="at">作者:&nbsp<a href="#" id="author">${post.usernickname}</a><span id="time">${post.publishTime}</span></div>
                                                    <span class="spacer">|</span>
                                                </div>
                                            </div>
                                            <div class="checknum">
                                                <span id="rech">     回复</span>
                                                <div>
                                                    <%--<a href="#" id="renum">233</a>--%>
                                                    <%--/--%>
                                                    <span>     ${post.totalRecord}</span>
                                                </div>
                                            </div>
                                        </th>
                                    </tr>
                                    </tbody>
                                </c:forEach>

								<%--<tbody>--%>
									<%--<tr>--%>
										<%--<th>--%>
											<%--<div class="tcommon">--%>
												<%--<div class="tctitle">--%>
													<%--<em>[<a href="#" id="lable">交易</a>]</em>--%>
													<%--<a href="#" id="artitle">帮帮忙！救救救！</a>--%>
													<%--<em class="eprsta"><未被接取></em>--%>
												<%--</div>--%>
												<%--<div class="tcauthor">--%>
													<%--<div class="at">作者:&nbsp<a href="#" id="author">卢来佛祖</a><span id="time">2018/8/4</span></div>--%>
													<%--<span class="spacer">|</span>--%>
													<%--<div class="lastrp">最后发表：&nbsp<a href="#" id="lastreport">马屁飞</a><span>2018/8/4</span></div>--%>
												<%--</div>--%>
											<%--</div>--%>
											<%--<div class="checknum">--%>
												<%--<span id="rech">回复/查看</span>--%>
												<%--<div>--%>
													<%--<a href="#" id="renum">233</a>--%>
													<%--/--%>
													<%--<span>666</span>--%>
												<%--</div>--%>
											<%--</div>--%>
										<%--</th>--%>
									<%--</tr>--%>
								<%--</tbody>--%>
							</table>
						</form>
					</div>
				</div>
				<div class="nextpage">
					<a href="${basePath}/post/selectAllPost.go?idplate=${plate.idplate}&pageNum=${posts.pageNum+1}">下一页</a>
				</div>
			</div>
		</div>
	
</body>
</html>