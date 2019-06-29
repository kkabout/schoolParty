package com.schoolParty.controller;

import com.schoolParty.model.User;
import com.schoolParty.service.IUserService;
import com.schoolParty.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/chat")
//当发送人不在线
public class MessageController {
    @Autowired
    private MessageService ms;
    @Autowired
    private IUserService userService;
    @RequestMapping("/index")
    public String Chatweb(@RequestParam("uid") int uid,HttpServletRequest request)
    {
        List<User> ulists = userService.findFriendByid(uid);
        request.getSession().setAttribute("ulists",ulists);
        return "chatweb";
    }
}
