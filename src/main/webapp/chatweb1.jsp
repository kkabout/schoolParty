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


    var websocket = null;
    if ('WebSocket' in window) {
        alert("您的浏览器支持 WebSocket!");
        websocket = new WebSocket("ws://localhost:8080/chat/${user.nickname}");
    }
    else if ('MozWebSocket' in window) {
        alert("您的浏览器支持 MozWebSocket!");
        websocket = new MozWebSocket("ws://localhost:8080/chat/${user.nickname}");
    }
    else {
        alert("您的浏览器不支持在线聊天");
        websocket = new SockJS("ws://localhost:8080/chat/${user.nickname}");
    }
    websocket.onopen = function(evnt) {
        alert("服务器连接成功");
    };
    websocket.onmessage = function(evnt) {
        alert("您收到消息"+evnt.data);

    };
    websocket.onerror = function(evnt) {};
    websocket.onclose = function(evnt) {
        $("#tou").html("与服务器断开了链接!")
    }
    $('#send').bind('click', function() {
        send();
    });
    function send() {
        if(websocket != null) {
            alert(websocket.readyState);
            var message = document.getElementById('message').value;
            websocket.send(message);
        } else {
            alert('未与服务器链接.');
        }
    }


        window.close = function () {
            websocket.onclose();
        }
</script>
<body>

<div class="drag clearfix">
    <div class="dialog_list">
        <div style="text-align: center;cursor: default">
            <span>用户列表</span>
        </div>
        <div id="user_list" style="height: 600px">
            <ul class="ul_drag">
                <c:forEach items="${ulists}" var="list">
                    <li><a href="#"><img src="${list.img}"/><span>${list.nickname}</span></a></li>
                </c:forEach>


                </ul>
            </div>
        </div>
        <div class="dialog_box ">
            <div class="dialog_top">
                <span>hello</span>
                <a href="#" style="float: right">×</a>
            </div>
            <div class="dialog_show clearfix"></div>
            <div class="dialog_bottom">
                <textarea class="dialog_input" id = "message"  placeholder="输入需要发送的消息"></textarea>
                <button onclick="send();">发送</button>
            </div>
        </div>
</div>
    

</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="/js/chat.js"></script>
</html>