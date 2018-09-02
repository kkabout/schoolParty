<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/css/chat.css"/>
</head>
<body>

    <div class="drag_log">
        <span>私信聊天</span>
    </div>
    <div class="drag clearfix">
        <div class="dialog_list">
            <div style="text-align: center;cursor: default">
                <span >用户列表</span>
            </div>
            <div id="user_list" style="height: 350px">
                <ul class="ul_drag">
                    <li><a href="#"><img src="img/user.png"/><span>pickname1</span></a></li>
                    <li><a href="#"><img src="img/user.png"/><span>pickname2</span></a></li>
                    <li><a href="#"><img src="img/user.png"/><span>pickname3</span></a></li>

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
                <textarea class="dialog_input" placeholder="回车发送"></textarea>
            </div>
        </div>
    </div>
    
</div>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="/js/chat.js"></script>
</html>