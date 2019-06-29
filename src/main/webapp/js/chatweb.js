document.querySelector('.chat[data-chat=person2]').classList.add('active-chat');
document.querySelector('.person[data-chat=person2]').classList.add('active');
var i = [] ;
i[1] = 1;
var friends = {
  list: document.querySelector('ul.people'),
  all: document.querySelectorAll('.left .person'),
  name: '' },

chat = {
  container: document.querySelector('.container .right'),
  current: null,
  person: null,
  name: document.querySelector('.container .right .top .name') };


friends.all.forEach(function (f) {
  f.addEventListener('mousedown', function () {
    f.classList.contains('active') || setAciveChat(f);
  });
});


function setAciveChat(f) {
  friends.list.querySelector('.active').classList.remove('active');
  f.classList.add('active');
  chat.current = chat.container.querySelector('.active-chat');
  chat.person = f.getAttribute('data-chat');
  i = chat.person.split("n");
  chat.current.classList.remove('active-chat');
  chat.container.querySelector('[data-chat="' + chat.person + '"]').classList.add('active-chat');
  friends.name = f.querySelector('.name').innerText;
  chat.name.innerHTML = friends.name;
}

document.onkeydown=function(event){
    var e = event || window.event || arguments.callee.caller.arguments[0];
    if(e && e.keyCode==13){ // enter 键要做的事情
        apendword();
        // $('.dialog_show').scrollTop( $('.dialog_show')[0].scrollHeight );//自动拉滚动条至最下

    }
};

function apendword() {
    if(""!=$("#word").val().trim()){
        if(websocket != null) {
            var message = document.getElementById('word').value;
            $("#chatword"+i[1]).append('<div class="bubble me">'+$("#word").val()+'</div>');
            $("#word").val("");
            var messagewithid = i[1] +"&"+ message;
            websocket.send(messagewithid);
        } else {
            alert('未与服务器链接.');
        }
        // var node = $("#word").val();
        // chat.
        // $("<div>"+node+"</div>").append(chat.container.querySelector('[data-chat="' + chat.person + '"]'));


    }

}