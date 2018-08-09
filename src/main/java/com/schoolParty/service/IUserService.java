package com.schoolParty.service;

import com.schoolParty.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface IUserService {

    public User showUser(String nickname);

    public User selectUser(String userId);

    void insertUser(User user);

    boolean checkUser(String nickname);

    boolean checkphone(String phone);
    String sendCode(String phone);
    // 通过用户名及密码核查用户登录
    public int checkLogin(String nickname, String password, String code, HttpServletResponse response, HttpServletRequest request);

    public User getUser(String nickname,String passwd);

    public User getUserByNickname(String nickname);

    boolean changeInfo(User user);

   int changePassword(String nickname,String oldWord,String password,String confirmWord,HttpServletRequest request);

//    User getUserBySchoolId(String schoolid);
    int insertInfo(String truename,String institute,String schoolid,String nickname,HttpServletRequest request);
}