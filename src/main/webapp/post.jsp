<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>校园Party</title>
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
	<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/css/post.css">
</head>
<body>
	<div class="w">
		<div class="posthbgc">
			
		</div>
		<div class="postmain">
			<div class="post-nav">
				<a href="#" title="主页"><i class="fa fa-coffee"></i></a>
				<span class="spacer">></span>
				<a href="${basePath}/index/index" title="首页">首页</a>
				<span class="spacer">></span>
				<a href="${basePath}/post/selectAllPost.go?idplate=${plate.idplate}&pageNum=1" title="板块名称">${plate.pname}</a>
				<span class="spacer">></span>
				<a href="#" id="">${post.title}</a>
			</div>
			<div class="post-h">
				<div class="post-re">
					<a href="#">发帖</a>
					<a href="#">回复</a>
				</div>
				<span class="page">
					<div class="post-paging">
                         <c:forEach var="index" begin="1" end="${posts.totalpage}" step="1">
                             <c:if test="${post.pageNum==index}">
                                 <strong>${index}</strong>
                             </c:if>
                             <c:if test="${posts.pageNum!=index}">
                                 <a href="${basePath}/reply/selectAllReply?idpost=${post.idpost}&idplate=${plate.idplate}&pageNum=${index}">${index}</a>
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
						<%--<a href="#">...15</a>--%>
						<label>
							<input type="text" value="${reply.pageNum}" style="height: 19px;width: 35px;color: #000;outline: none;">
							<span>/${reply.totalpage}</span>
						</label>
                        <c:if test="${reply.pageNum==reply.totalpage}">
                            <a href="#">
                            下一页&nbsp<i class="fa fa-chevron-circle-right"></i></a>
                        </c:if>
                        <c:if test="${reply.pageNum!=reply.totalpage}">
                            <a href="${basePath}/reply/selectAllReply?idpost=${post.idpost}&idplate=${plate.idplate}&pageNum=${reply.pageNum+1}">
                            下一页&nbsp<i class="fa fa-chevron-circle-right"></i></a>
                        </c:if>




					</div>
				</span>
				<span class="page-back">
                    <c:if test="${reply.pageNum==1}">
                        <a href="#">
                        <i class="fa fa-chevron-circle-left"></i>&nbsp上一页</a>
                    </c:if>
                    <c:if test="${reply.pageNum!=1}">
                        <a href="${basePath}/reply/selectAllReply?idpost=${post.idpost}&idplate=${plate.idplate}&pageNum=${reply.pageNum-1}">
                        <i class="fa fa-chevron-circle-left"></i>&nbsp上一页</a>
                    </c:if>


				</span>	
			</div>
			<div class="postlist">
				<table cellspacing="0" cellpadding="0">
					<tr>
						<td class="plsl">
							<div class="pt numc">
								<span class="cr">回复：</span>
								<span class="ln">${reply.totalRecord}</span>
							</div>
						</td>
						<td class="htitle plp">
							<h1>
								<a href="#">${post.type}</a>
								<span id="posttitle">${post.title}</span>
							</h1>
						</td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0">
					<tr class="sp">
						<td class="plsl"></td>
						<td class="plsr"></td>
					</tr>
				</table>
                <c:if test="${reply.pageNum==1}">
                    <div id="">
                        <table cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <td class="plsl">
                                    <div class=" plau">
                                        <div class="auname">
                                            <a href="#">${post.usernickname}</a>
                                        </div>
                                        <div class="aul">
                                            <div class="avatar">
                                                <a href="#"><img src=${post.img}></a>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="plp">
                                    <div class="plmain">
                                        <div class="plhead">
                                            <strong>楼主</strong>
                                            <div class="plhtime">
                                                <em>发表于2018/8/4</em>
                                                <span class="spacer">|</span>
                                                <a href="#">只看该作者</a>
                                            </div>
                                        </div>
                                        <div class="plele">
                                            <h1>${post.content}</h1>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="plsl"></td>
                                <td class="plp">
                                    <div class="plbt hid">
                                        <em><i class="fa fa-comment-o"></i>&nbsp<a href="#">回复</a></em>
                                    </div>
                                </td>
                            </tr>
                            <tr class="sp">
                                <td class="plsl"></td>
                                <td class="plsr"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </c:if>


                <c:forEach items="${reply.list}" var="reply1" >

                    <div id="">
                        <table cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <td class="plsl">
                                    <div class=" plau">
                                        <div class="auname">
                                            <a href="#">${reply1.nickname}</a>
                                        </div>
                                        <div class="aul">
                                            <div class="avatar">
                                                <a href="#"><img src=${reply1.img}></a>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="plp">
                                    <div class="plmain">
                                        <div class="plhead">
                                            <strong>${(reply.pageNum-1)*reply.pagesize+reply1.num+1}楼</strong>
                                            <div class="plhtime">
                                                <em>${reply1.publishTime}</em>
                                                <span class="spacer">|</span>
                                                <a href="#">只看该作者</a>
                                            </div>
                                        </div>
                                        <div class="plele">
                                            <h1>${reply1.content}</h1>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="plsl"></td>
                                <td class="plp">
                                    <div class="plbt hid">
                                        <em><i class="fa fa-comment-o"></i>&nbsp<a href="#">回复</a></em>
                                    </div>
                                </td>
                            </tr>
                            <tr class="sp">
                                <td class="plsl"></td>
                                <td class="plsr"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </c:forEach>


			</div>
		</div>
	</div>
	
</body>
</html>