var result;
$.validator.addMethod(
    //规则的名称
    "checkUser",
    //校验的函数
    function (value,element,params) {
        //value输入的内容
        //element被校验的元素
        //params
        var flag = false;
        $.ajax({
            "async":false,
            "url":"${pageContext.request.contextPath}/user/checkUser.go",
            "data":{"nickname":value},
            "type":"POST",
            "dataType":"json",
            "success":function (data) {
                flag =data.isExist;

            }
        });
        return !flag;
    }
);
$(function() {
    $("#checkcode").click(function() {
        var phone = $("#phone").val().trim();
        var code ="123";
        //login1为Action类命名空间名称；AjaxExecute为Action方法名称
        $.ajax({
            type : "post",
            url : '/user/sendCode.go',
            data : {//设置数据源
                phone:phone
            },
            dataType : "json",//设置需要返回的数据类型
            success : function(d) {

                result=d.sendCode;



            },
            error : function(d) {
                alert("请求失败");
            }
        });
    });
});
$.validator.addMethod("isMobile", function(value, element) {
    var length = value.length;
    var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
    return this.optional(element) || (length == 11 && mobile.test(value));
}, "请正确填写您的手机号码");
$.validator.addMethod("truecode",function (value,element) {


    return this.optional(element)||result==value;
},"验证码错误");
$.validator.addMethod("checkphone",function (value,emement) {
    var flag =false;
    $.ajax({
        "async":false,
        "url": "${pageContext.request.contextPath}/user/checkphone.go",
        "data":{"phone":value},
        "type":"POST",
        "dataType":"json",
        "success":function (data) {
            flag =data.isExist;

        }

    });
    return !flag;
})
$().ready(function () {
    $("#regist").validate({
        errorPlacement: function(error, element) {
            //在当前p标签中显示错误信息
            $( element )
                .closest( "form" )
                .find( "p[for='" + element.attr( "id" ) + "']"  )
                .append( error );
        },
        rules:{
            nickname: {
                required: true,
                checkUser: true
            },

            passwd:{
                required:true,
                rangelength:[6,12]
            },
            repasswd:{
                required:true,
                rangelength:[6,12],
                equalTo:"#passwd"
            },
            phone : {
                required : true,
                minlength : 11,
                // 自定义方法：校验手机号在数据库中是否存在
                // checkPhoneExist : true,
                isMobile : true,
                checkphone :true
            },
            code :{
                required : true,
                truecode :true

            },
            email:{
                required:true,
                email:true
            }


        },
        messages:{
            nickname:{
                required:"用户名不能为空",
                checkUser:"用户名已经存在"
            },

            passwd:{
                required:"密码不能为空",
                rangelength:"密码必须在6到12位"
            },
            repasswd:{
                required:"密码不能为空",
                rangelength:"密码必须在6到12位",
                equalTo: "密码必须与第一次输入的密码相同"
            },
            phone : {
                required : "请输入手机号",
                minlength : "确认手机不能小于11个字符",
                isMobile : "请正确填写您的手机号码",
                checkphone:"该手机号码已被注册"
            },
            code :{
                required : "请输入验证码",
                truecode :"验证码不正确"

            },
            email:{
                required:"邮箱不能为空",
                email:"请输入正确的email"
            }
        }
    });
});

