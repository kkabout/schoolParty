$(document).ready(function() {
    //鼠标光标移动到左侧导航栏时指定光标形状
    $(".dialog_top").mouseover(function(){
        $(this).css("cursor","default");
    });
    //功能：移动class=drag的模块
    var move = false;//移动标记
    var _x, _y;//鼠标离控件左上角的相对位置
    $(".dialog_top").mousedown(function (e) {
        move = true;
        _x = e.pageX - parseInt($(".drag").css("left"));
        _y = e.pageY - parseInt($(".drag").css("top"));
    });
    $(document).mousemove(function (e) {
        if (move) {
            var x = e.pageX - _x;//控件左上角到屏幕左上角的相对位置
            var y = e.pageY - _y;
            $(".drag").css({"top": y, "left": x});
        }
    }).mouseup(function () {
        move = false;
    });

//将文本框中的内容提交至聊天记录框
    function sendText(){
        if(""!=$(".dialog_input").val().trim()){
            $(".dialog_show").append('<div><p><img src="img/user.png"/></p><span style="background-color: #d7ebfe ">' +
                $(".dialog_input").val()
                +'</span></div>');
            $(".dialog_input").val("");
        }

    }
    document.onkeydown=function(event){
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if(e && e.keyCode==13){ // enter 键要做的事情
            sendText();
            $('.dialog_show').scrollTop( $('.dialog_show')[0].scrollHeight );//自动拉滚动条至最下

        }
    };


    //导航栏选中效果切换
    var last;
    $("ul.ul_drag  a").click(function(){
        console.log(this);
        $(last).removeClass("isChoose ");
        $(this).addClass("isChoose ");
        $('.dialog_top span').text($(this).text());
        //console.log();
        last=this;
    });
//对话框的切换
    $(".dialog_top a").on("click",function(){
        $(".drag").css("display","none");
        $(".drag_log").css("display","block");
        });
    $(".drag_log").on("click",function(){
        $(".drag").css("display","block");
        $(".drag_log").css("display","none");

    });



});

