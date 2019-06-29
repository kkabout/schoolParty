<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" >
<script src="${basePath}/js/jquery-3.3.1.js" type="text/javascript"></script>
<head>
<meta charset="UTF-8">
<title>好友聊天</title>

<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="/css/reset.min.css">


<link rel="stylesheet" href="/css/style.css">


</head>
<script>
    var websocket = null;
    if ('WebSocket' in window) {
        websocket = new WebSocket("ws://localhost:8080/chat/${user.uid}/${user.nickname}");
    }
    else if ('MozWebSocket' in window) {
        websocket = new MozWebSocket("ws://localhost:8080/chat/${user.uid}/${user.nickname}");
    }
    else {
        websocket = new SockJS("ws://localhost:8080/chat/${user.uid}/${user.nickname}");
    }
    websocket.onopen = function(evnt) {
    };
    websocket.onmessage = function(evnt) {
        var mes = [];
        mes = evnt.data.split("&");
        $("#chatword"+mes[0]).append('<div class="bubble you">'+mes[1]+'</div>');

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
  <div class="wrapper">
    <div class="container">
        <div class="left">
            <%--<div class="top">--%>
                <%--<input type="text" placeholder="Search" />--%>
                <%--<a href="javascript:;" class="search"></a>--%>
            <%--</div>--%>
            <%--<ul class="people">--%>
                <%--<li class="person" data-chat="person1">--%>
                    <%--<img src="img/thomas.jpg" alt="" />--%>
                    <%--<span class="name">Thomas Bangalter</span>--%>
                    <%--<span class="time">2:09 PM</span>--%>
                    <%--<span class="preview">I was wondering...</span>--%>
                <%--</li>--%>
                <%--<li class="person" data-chat="person2">--%>
                    <%--<img src="img/dog.png" alt="" />--%>
                    <%--<span class="name">Dog Woofson</span>--%>
                    <%--<span class="time">1:44 PM</span>--%>
                    <%--<span class="preview">I've forgotten how it felt before</span>--%>
                <%--</li>--%>
                <%--<li class="person" data-chat="person3">--%>
                    <%--<img src="img/louis-ck.jpeg" alt="" />--%>
                    <%--<span class="name">Louis CK</span>--%>
                    <%--<span class="time">2:09 PM</span>--%>
                    <%--<span class="preview">But we’re probably gonna need a new carpet.</span>--%>
                <%--</li>--%>
                <%--<li class="person" data-chat="person4">--%>
                    <%--<img src="img/bo-jackson.jpg" alt="" />--%>
                    <%--<span class="name">Bo Jackson</span>--%>
                    <%--<span class="time">2:09 PM</span>--%>
                    <%--<span class="preview">It’s not that bad...</span>--%>
                <%--</li>--%>
                <%--<li class="person" data-chat="person5">--%>
                    <%--<img src="img/michael-jordan.jpg" alt="" />--%>
                    <%--<span class="name">Michael Jordan</span>--%>
                    <%--<span class="time">2:09 PM</span>--%>
                    <%--<span class="preview">Wasup for the third time like is--%>
<%--you blind bitch</span>--%>
                <%--</li>--%>
                <%--<li class="person" data-chat="person6">--%>
                    <%--<img src="img/drake.jpg" alt="" />--%>
                    <%--<span class="name">Drake</span>--%>
                    <%--<span class="time">2:09 PM</span>--%>
                    <%--<span class="preview">howdoyoudoaspace</span>--%>
                <%--</li>--%>
            <%--</ul>--%>
            <ul class="people">
                <c:forEach items="${ulists}" var="list">
                    <li class="person" data-chat="person${list.uid}" local="${list.uid}">
                        <c:choose>

                            <c:when test="${empty list.img}">
                                <img src="/image/moren.png" alt="" />
                                <span class="name">${list.nickname}</span>
                                <%--<span class="time">2:09 PM</span>--%>
                                <span class="preview">${list.signature}</span>
                            </c:when>

                            <c:otherwise>
                                <img src="${list.img}" alt="" />
                                <span class="name">${list.nickname}</span>
                                <%--<span class="time">2:09 PM</span>--%>
                                <span class="preview">${list.signature}</span>
                            </c:otherwise>

                        </c:choose>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="right">
            <div class="top"><span>To: <span class="name">Dog Woofson</span></span></div>
            <c:forEach items="${ulists}" var="list">
                <div class="chat" id = "chatword${list.uid}" data-chat="person${list.uid}">
                    <%--<div class="conversation-start">--%>
                        <%--<span>Today, 6:48 AM</span>--%>
                    <%--</div>--%>
                    <%--<div class="bubble you">--%>
                        <%--Hello,--%>
                    <%--</div>--%>
                    <%--<div class="bubble you">--%>
                        <%--it's me.--%>
                    <%--</div>--%>
                    <%--<div class="bubble you">--%>
                        <%--I was wondering...--%>
                    <%--</div>--%>
                </div>
            </c:forEach>
            <%--<div class="chat" data-chat="person1">--%>
                <%--<div class="conversation-start">--%>
                    <%--<span>Today, 6:48 AM</span>--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--Hello,--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--it's me.--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--I was wondering...--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="chat" data-chat="person2">--%>
                <%--<div class="conversation-start">--%>
                    <%--<span>Today, 5:38 PM</span>--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--Hello, can you hear me?--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--I'm in California dreaming--%>
                <%--</div>--%>
                <%--<div class="bubble me">--%>
                    <%--... about who we used to be.--%>
                <%--</div>--%>
                <%--<div class="bubble me">--%>
                    <%--Are you serious?--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--When we were younger and free...--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--I've forgotten how it felt before--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="chat" data-chat="person3">--%>
                <%--<div class="conversation-start">--%>
                    <%--<span>Today, 3:38 AM</span>--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--Hey human!--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--Umm... Someone took a shit in the hallway.--%>
                <%--</div>--%>
                <%--<div class="bubble me">--%>
                    <%--... what.--%>
                <%--</div>--%>
                <%--<div class="bubble me">--%>
                    <%--Are you serious?--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--I mean...--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--It’s not that bad...--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--But we’re probably gonna need a new carpet.--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="chat" data-chat="person4">--%>
                <%--<div class="conversation-start">--%>
                    <%--<span>Yesterday, 4:20 PM</span>--%>
                <%--</div>--%>
                <%--<div class="bubble me">--%>
                    <%--Hey human!--%>
                <%--</div>--%>
                <%--<div class="bubble me">--%>
                    <%--Umm... Someone took a shit in the hallway.--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--... what.--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--Are you serious?--%>
                <%--</div>--%>

                <%--<div class="bubble me">--%>
                    <%--It’s not that bad...--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="chat" data-chat="person5">--%>
                <%--<div class="conversation-start">--%>
                    <%--<span>Today, 6:28 AM</span>--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--Wasup--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--Wasup--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--Wasup for the third time like is <br />you blind bitch--%>
                <%--</div>--%>

            <%--</div>--%>
            <%--<div class="chat" data-chat="person6">--%>
                <%--<div class="conversation-start">--%>
                    <%--<span>Monday, 1:27 PM</span>--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--So, how's your new phone?--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--You finally have a smartphone :D--%>
                <%--</div>--%>
                <%--<div class="bubble me">--%>
                    <%--Drake?--%>
                <%--</div>--%>
                <%--<div class="bubble me">--%>
                    <%--Why aren't you answering?--%>
                <%--</div>--%>
                <%--<div class="bubble you">--%>
                    <%--howdoyoudoaspace--%>
                <%--</div>--%>
            <%--</div>--%>
            <div class="write">
                <a href="javascript:;" class="write-link attach"></a>
                <input type="text" id ="word" value="" />
                <%--<a href="javascript:;" class="write-link smiley"></a>--%>
                <%--<button  class="write-link smiley" onclick="apendword();"></button>--%>
                <%--<a href="javascript:;" class="write-link send"></a>--%>
            </div>
        </div>
    </div>
</div>
  
  

<script  src="/js/chatweb.js"></script>




</body>

</html>
