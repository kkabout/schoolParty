package com.schoolParty.controller;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.schoolParty.model.User;
import com.schoolParty.service.IFriendService;
import com.schoolParty.service.IUserService;
import java.io.File;
import java.util.UUID;

import com.schoolParty.service.impl.UserServiceImpl;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    @Resource
    private IFriendService friendService;

    @RequestMapping(value = "/showUser.do")
    public void selectUser(HttpServletRequest request, HttpServletResponse response,Model model) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
//        String userId = (request.getParameter("id"));
        String nickname = (request.getParameter("nickname"));
        User user = this.userService.showUser(nickname);
        model.addAttribute("user",user);
//        ObjectMapper mapper = new ObjectMapper();
//        response.getWriter().write(mapper.writeValueAsString(user));
//        response.getWriter().close();
        request.getRequestDispatcher(request.getContextPath()+"/user/personInfo").forward(request,response);
    }
    @RequestMapping(value = "/registUser.go", method =RequestMethod.POST)
    public String insertUser(User user) {
            String md5pwd = DigestUtils.md5Hex(user.getPasswd());
            user.setPasswd(md5pwd);
            user.setImg("/image/moren.png");
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
        String Sendcode = this.userService.sendCode(phone);
//        String Sendcode = "123456";
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
    public String personInfo(Model model,@RequestParam("uid") int uid)
    {
        User user = userService.selectUser(String.valueOf(uid));
        int followers = friendService.follow(uid);
        int focus = friendService.myFocus(uid);
        model.addAttribute("followers",followers);
        model.addAttribute("focus",focus);
        model.addAttribute("curuser",user);
        return "personInfo";
    }

    @RequestMapping("changeInfo")
    public String changeInfo(User user, HttpServletRequest request, HttpServletResponse response)throws IOException{
        user=userService.getUserByNickname(user.getNickname());
        //保存数据库的路径
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath="/Users/kj/IdeaProjects/schoolParty/src/main/webapp/image/";
        //定义 文件名
        String filename=null;
        if(!user.getFile().isEmpty()){
            //生成uuid作为文件名称
            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType=user.getFile().getContentType();
            //获得文件后缀名
            String suffixName=contentType.substring(contentType.indexOf("/")+1);
            //得到 文件名
            filename=uuid+"."+suffixName;
            //文件保存路径
            user.getFile().transferTo(new File(localPath+filename));
        }
        //把图片的相对路径保存至数据库
        sqlPath = "/image/"+filename;
        user.setImg(sqlPath);
        if(userService.changeInfo(user)){
            user=userService.getUserByNickname(user.getNickname());
            request.getSession().setAttribute("user",user);
            response.getWriter().print("<script type='text/javascript'>alert('修改成功！');</script>");
//            model.addAttribute("user",user);
            return "redirect:/user/personInfo";
//            return "personInfo";
        }else {
            return "error";
        }
    }

    @RequestMapping("changePasswd")
    public void changePasswd( String nickname,String oldWord,String password,String confirmWord,HttpServletResponse response,HttpServletRequest request) throws IOException {
        int type=userService.changePassword(nickname,oldWord,password,confirmWord,request);
        response.setContentType("text/html;charset=UTF-8");
        if(type==3){
            response.getWriter().print("<script type='text/javascript'>alert('旧密码错误！');window.history.go(-1);</script>");
        }
        else if(type==1){
            response.getWriter().print("<script type='text/javascript'>alert('新密码不能与原密码一样！');window.history.go(-1);</script>");
        }else if(type==2){
            response.getWriter().print("<script type='text/javascript'>alert('新密码与确认密码不一样！');window.history.go(-1);</script>");
        }else if(type==0){
            response.getWriter().print("<script type='text/javascript'>alert('密码修改成功！请重新登录');window.location.href=\"/index/index\";</script>");
//            response.sendRedirect("/index/index");
        }
    }
    @RequestMapping("realname")
    public void realname(String truename,String institute,String schoolid,String nickname,HttpServletResponse response,HttpServletRequest request) throws IOException {
        int type = userService.insertInfo(truename, institute, schoolid, nickname, request);
        response.setContentType("text/html;charset=UTF-8");
        if (type == 1) {
            response.getWriter().print("<script type='text/javascript'>alert('该学号已经认证！');window.history.go(-1);</script>");
        } else if (type == 2) {
            response.getWriter().print("<script type='text/javascript'>alert('认证成功！');window.location.href=\"/user/personInfo\";</script>");
        } else {
            response.getWriter().print("<script type='text/javascript'>alert('认证失败！');window.history.go(-1);</script>");
        }
    }
    @RequestMapping("/otherinfo")
    public String otherInfo(@RequestParam("nickname") String nickname, Model model,@RequestParam("curid") String uid)
    {
        User otheruser =  userService.getUserByNickname(nickname);
        int followers = friendService.follow(otheruser.getUid());
        int focus = friendService.myFocus(otheruser.getUid());
        boolean hasfocus = friendService.hasFocused(Integer.parseInt(uid),otheruser.getUid());
        model.addAttribute("hasfocus",hasfocus);
        model.addAttribute("followers",followers);
        model.addAttribute("focus",focus);
        model.addAttribute("otheruser",otheruser);
        return "otherpersonInfo";
    }

    }





