package com.schoolParty.model;

public class User {

    private int uid; // 用户的id(登陆名),对应数据库表中字段 uid  INT PK
    private String nickname; //用户的昵称,对应数据库表中字段 nickname varchar(12)
    private String passwd;//用户的登陆密码,对应数据库表中字段 passwd  varchar(50)
    private String isadmin; //用户是否为管理员,对应数据库表中字段 1:是 0:否,isadmin  int
    private String email; //用户的邮箱,对应数据库表中字段 email varchar(45)
    private String sex;//用户的性别,对应数据库表中字段 sex  char(2)
    private String institute;//用户的学院,对应数据库表中字段 institute  varchar(45)
    private String schoolid;//用户的学号,对应数据库表中字段 schoolid varchar(45)
    private String phone;//用户的手机号码,对应数据库表中字段 phone char(11)
    private String truename;//用户的真实姓名,对应数据库表中字段 truename varchar(45)
    private String img;//用户头像,对应数据库表中字段 img varchar(200)
    private int success;//用户成功拿取快递次数,succees  int


    public User() {
    }

    public User(int uid, String nickname, String passwd, String isadmin, String email, String sex) {
        this.uid = uid;
        this.nickname = nickname;
        this.passwd = passwd;
        this.isadmin = isadmin;
        this.email = email;
        this.sex = sex;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getIsadmin() {
        return isadmin;
    }

    public void setIsadmin(String isadmin) {
        this.isadmin = isadmin;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getInstitute() {
        return institute;
    }

    public void setInstitute(String institute) {
        this.institute = institute;
    }

    public String getSchoolid() {
        return schoolid;
    }

    public void setSchoolid(String schoolid) {
        this.schoolid = schoolid;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTruename() {
        return truename;
    }

    public void setTruename(String truename) {
        this.truename = truename;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getSuccess() {
        return success;
    }

    public void setSuccess(int success) {
        this.success = success;
    }
}
