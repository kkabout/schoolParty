<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/css/chat.css"/>
</head>
<script type="text/javascript">

    function doSendUser() {
        alert(websocket.readyState)
        if (websocket.readyState == 1) {
            var msg = document.getElementById("inputMsg").value;
            websocket.send("#anyone#"+msg);//调用后台handleTextMessage方法
            alert("发送成功!");
        }
    }


        window.close = function () {
            websocket.onclose();
        }

</script>
<body>

<div class="drag_log">
    <a href="/chat/index?uid=${user.uid}"><span>私信聊天</span></a>
</div>
<%--<div class="drag clearfix">--%>
    <%--<div class="dialog_list">--%>
        <%--<div style="text-align: center;cursor: default">--%>
            <%--<span>用户列表</span>--%>
        <%--</div>--%>
        <%--<div id="user_list" style="height: 350px">--%>
            <%--<ul class="ul_drag">--%>
                <%--<c:forEach items="${ulists}" var="list">--%>
                    <%--<li><a href="#"><img src="${list.img}"/><span>${list.nickname}</span></a></li>--%>
                <%--</c:forEach>--%>


                <%--</ul>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="dialog_box ">--%>
            <%--<div class="dialog_top">--%>
                <%--<span>hello</span>--%>
                <%--<a href="#" style="float: right">×</a>--%>
            <%--</div>--%>
            <%--<div class="dialog_show clearfix"></div>--%>
            <%--<div class="dialog_bottom">--%>
                <%--<textarea class="dialog_input" placeholder="回车发送"></textarea>--%>
                <%--<button onclick="doSendUser();">发送</button>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    
</div>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="/js/chat.js"></script>
</html>