Ext.define("yucen.view.password.PasswordChange", {

    extend: "Ext.form.Panel",
    alias: "widget.passwordChange",
    url:ctx+"/so/changeUserPwd",
    require: [],
    autoScroll: true,
    defaults: {
        xtype: 'textfield',
        width: 300
    },
    layout: {
        type: 'vbox',
        align: 'center',
        padding: 80
    },

    initComponent: function () {

        this.items = [
            {fieldLabel: '原始密码'+'<span style="color: rgb(255, 0, 0); padding-left: 2px;">*</span>', id: 'oldPassword', name: 'oldPwd', inputType: "password",
                allowBlank: false,
                blankText: '原始密码不能为空！',
                minLength: 5,
                maxLength: 20,
                minLengthText: "请输入6~20位密码！",
                maxLengthText: '请输入6~20位密码！'},

            {fieldLabel: '新密码'+'<span style="color: rgb(255, 0, 0); padding-left: 2px;">*</span>', id: 'password', name: 'newPwd', inputType: "password",
                allowBlank: false,
                blankText: '新密码不能为空！',
                minLength: 6,
                maxLength: 20,
                minLengthText: "请输入6~20位密码！",
                maxLengthText: '请输入6~20位密码！',


                validator: function () {
                    if (this.getValue() == Ext.getCmp('confirmPassword').getValue()) {
                        Ext.getCmp('confirmPassword').clearInvalid()
                    }
                    if (this.getValue() != Ext.getCmp('oldPassword').getValue()) {
                        return true;
                    } else if(Ext.getCmp('oldPassword').getValue()!=""){
                        return "新密码不能与原密码相同";
                    }

                }},

            {fieldLabel: '确认密码'+'<span style="color: rgb(255, 0, 0); padding-left: 2px;">*</span>', id: 'confirmPassword', name: 'confirmPassword', inputType: "password",
                validator: function () {
                    if (this.getValue() == Ext.getCmp('password').getValue()) {
                        return true;
                    } else {
                        return "两次密码不匹配";
                    }
                },
                allowBlank: false,
                blankText: '确认密码不能为空！',
                minLength: 6,
                maxLength: 20,
                minLengthText: "请输入6~20位密码！",
                maxLengthText: '请输入6~20位密码！'
            },{
                xtype:'hidden',
                name:'username',
                value:'admin'
            }

        ];

        this.dockedItems = [
            {
                xtype: 'toolbar',
                width: '100%',
                items: [
                    {text: '保存', action: 'changePassword'}
                ]
            }
        ],

            this.callParent(arguments);

    }

});


