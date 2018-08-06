package com.schoolParty.controller;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import com.schoolParty.model.User;
import com.schoolParty.service.IUserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private IUserService userService;

    @RequestMapping(value = "/showUser.do")
    public void selectUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String userId = (request.getParameter("id"));
        User user = this.userService.selectUser(userId);
        ObjectMapper mapper = new ObjectMapper();
        response.getWriter().write(mapper.writeValueAsString(user));
        response.getWriter().close();
    }
    @RequestMapping(value = "/registUser.go", method =RequestMethod.POST)
    public String insertUser(User user) {
            String md5pwd = DigestUtils.md5Hex(user.getPasswd());
            user.setPasswd(md5pwd);
            this.userService.insertUser(user);
            return "redirect:/index/index ";
    }
    @RequestMapping(value = "/checkUser.go" ,method = RequestMethod.POST)
    public void checkUser( HttpServletResponse response, String nickname) throws IOException {
        boolean isExist = this.userService.checkUser(nickname);
        String json = "{\"isExist\": "+ isExist + "}";
        response.getWriter().write(json);
    }

    @RequestMapping(value = "/sendCode.go" ,method = RequestMethod.POST)
    public void sendCode(HttpServletResponse response, String phone) throws IOException {
        //String Sendcode = this.userService.sendCode(phone);
        String Sendcode = "123456";
        String json = "{\"sendCode\": "+Sendcode +"}";
        response.getWriter().write(json);

    }
    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    @RequestMapping("/submitLogin")
    public void submitLogin(String nickname, String password, String code, HttpServletResponse response, HttpServletRequest request) throws Exception {
        String Md5Passwd=DigestUtils.md5Hex(password);
        int type=userService.checkLogin(nickname,Md5Passwd,code,response,request);
        response.setContentType("text/html;charset=UTF-8");
        if(type==1){
            response.getWriter().print("<script type='text/javascript'>alert('验证码错误！');window.history.go(-1);</script>");
        }else if(type==2){
            response.getWriter().print("<script type='text/javascript'>alert('用户名或密码错误！');window.history.go(-1);</script>");
        }else if(type==0){
            response.sendRedirect("/index/index");
        }
    }


    @RequestMapping("/randrom")
    public void randrom(HttpServletResponse response, HttpSession session){
        BufferedImage bufferedImage=new BufferedImage(140,40, BufferedImage.TYPE_INT_ARGB);
        Graphics graphics=bufferedImage.createGraphics();
        graphics.setColor(Color.BLACK);
        graphics.setFont(new Font("黑体",Font.BOLD,20));
        String [] allStr=new String[]{"1","2","3","4","5","6","7","8","9","0","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
                "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
        Random random=new Random();
        String tempStr="";
        for(int i=0;i<5;i++){
            tempStr+=allStr[random.nextInt(allStr.length)];
        }
        //将验证码存到session中
        session.setAttribute("code",tempStr);
        graphics.drawString(tempStr,10,30);
        try {
            ImageIO.write(bufferedImage,"png",response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request,HttpServletResponse response) throws IOException {
        request.getSession().removeAttribute("user");
        response.sendRedirect(request.getContextPath()+"/index/index");
        return null;
    }

    @RequestMapping("personInfo")
    public String personInfo(){
        return "personInfo";
    }
}





