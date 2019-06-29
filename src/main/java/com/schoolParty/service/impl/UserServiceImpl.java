package com.schoolParty.service.impl;

import com.aliyuncs.exceptions.ClientException;
import com.schoolParty.MyUtils.aliMessageSend;
import com.schoolParty.dao.IUserDao;
import com.schoolParty.model.User;
import com.schoolParty.service.IUserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;


@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    public User showUser(String nickname){
        return this.userDao.showUser(nickname);
    }

    public User selectUser(String userId)
    {
        return this.userDao.selectUser(userId);
    }

    @Override
    public void insertUser(User user) {
        this.userDao.insertUser(user);
    }

    @Override
    public boolean checkUser(String nickname) {

        int isExits = 0;
        isExits =this.userDao.checkUser(nickname);
        return isExits>0?true:false;
    }

    @Override
    public List<User> findFriendByid(int id) {
        return userDao.findFriendByid(id);
    }


    @Override
    public boolean checkphone(String phone) {
        int isExits = 0;
        isExits =this.userDao.checkUser(phone);
        return isExits>0?true:false;
    }

    @Override
    public String sendCode(String phone) {
        int randNum = 100000 + (int)(Math.random() * ((999999 - 100000) + 1));
        String sendcode = String.valueOf(randNum);
        aliMessageSend send = new aliMessageSend();
        send.setMobile(phone);
        send.setCode(sendcode);
        try {
            send.sendSms();
        } catch (ClientException e) {
            e.printStackTrace();
        }
        return sendcode;

    }

    public int checkLogin(String nickname, String password, String code, HttpServletResponse response, HttpServletRequest request) {
        String serverCode=(String)request.getSession().getAttribute("code");
        User user=userDao.getUserByUid(nickname,password);
        if(user!=null){
//            String userName=user.getNickname();
//            String Password=user.getPasswd();
//            String rememberme=request.getParameter("rememberme");
            String remFlag = request.getParameter("remFlag");
            if("1".equals(remFlag)){
//                String logininfo=userName;
                Cookie remembermeCookie=new Cookie("remembermeCookie",user.getNickname());
                remembermeCookie.setPath("/");
                remembermeCookie.setMaxAge(60*60*24*7);
                try {
                    URLEncoder.encode(user.getNickname(), "UTF-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                response.addCookie(remembermeCookie);
            }else {
                Cookie remembermeCookie=new Cookie("remembermeCookie","");
                remembermeCookie.setPath("/");
                remembermeCookie.setMaxAge(0);
                response.addCookie(remembermeCookie);
            }
            request.getSession().setAttribute("user",user);
            if(serverCode!=null && serverCode.equalsIgnoreCase(code)){
                return 0;
            }else{
                return 1;
            }

        }else{
            return 2;
        }

    }

    @Override
    public User getUserByUid(String nickname, String passwd) {
        return null;
    }


    @Override
    public User getUserByNickname(String nickname){
        return userDao.getUserByNickname(nickname);
    }
    @Override
    public boolean changeInfo(User user){
        return userDao.changeInfo(user);
    }


    @Override
    public int changePassword(String nickname,String oldWord,String password,String confirmWord,HttpServletRequest request) {
        String Md5Passwd = DigestUtils.md5Hex(password);

        if(oldWord!=null && oldWord.equals(password)){
            return 1;
        }else if(!(password.equals(confirmWord))){
            return 2;
        }else {
            boolean result =this.userDao.changePassword(Md5Passwd,nickname);
            if(result){
//                User user=userDao.getUserByUid(nickname,Md5Passwd);
//                request.getSession().setAttribute("user",user);
                request.getSession().removeAttribute("user");
                return 0;
            }else {
                return 3;
            }
        }
    }
    @Override
    public User getUser(String nickname, String passwd) {
        return null;
    }

    @Override
    public int insertInfo(String truename,String institute,String schoolid ,String nickname,HttpServletRequest request){
        User user=userDao.getUserBySchoolId(schoolid);
        if(user!=null){
            return 1;
        }else{
            boolean result=userDao.insertInfo(truename, institute, schoolid,nickname);
            if(result){
                user=userDao.getUserByNickname(nickname);
                request.getSession().setAttribute("user",user);
                return 2;
            }else {
                return 0;
            }
        }
    }

    @Override
    public int usercount() {
        return userDao.usercount();
    }

}