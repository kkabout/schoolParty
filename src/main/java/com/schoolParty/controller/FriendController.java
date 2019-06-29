package com.schoolParty.controller;

import com.schoolParty.model.User;
import com.schoolParty.model.UserInfo;
import com.schoolParty.service.IFriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.LinkedList;
import java.util.List;

@Controller
@RequestMapping("/friend")
public class FriendController {
    @Autowired
    private IFriendService friendService;
    @RequestMapping("/showfocus")
    public String showfocus(Integer curid,Model model){
        List<User> myfocus = friendService.showfocus(curid);
        List<UserInfo> userInfoList = new LinkedList<>();
        for(User u : myfocus)
        {
            UserInfo userinfo = new UserInfo(u.getNickname(),u.getImg(),u.getSignature(),friendService.myFocus(u.getUid()),friendService.follow(u.getUid()));
            userInfoList.add(userinfo);
        }
        model.addAttribute("foucsUserInfo",userInfoList);
        return "friends";
    }
    @RequestMapping("/showfollow")
    public String showfollow(Integer curid,Model model) {
        List<User> foucusmy = friendService.showfollow(curid);
        List<UserInfo> userInfoList = new LinkedList<>();
        for(User u : foucusmy)
        {
            UserInfo userinfo = new UserInfo(u.getNickname(),u.getImg(),u.getSignature(),friendService.myFocus(u.getUid()),friendService.follow(u.getUid()));
            userInfoList.add(userinfo);
        }
        model.addAttribute("foucsUserInfo",userInfoList);
        return "friends";
    }

    @RequestMapping("/addfocus")
    public String addfocus(Integer curid,Integer otherid,String nickname) throws UnsupportedEncodingException {
        friendService.addfocus(curid,otherid);
        return "redirect:/user/otherinfo?nickname="+URLEncoder.encode(nickname,"UTF-8")+"&curid="+curid;
    }
    @RequestMapping("/deletefocus")
    public String deletefocus(Integer curid,Integer otherid,String nickname) throws UnsupportedEncodingException {
        friendService.deletefocus(curid,otherid);
        return "redirect:/user/otherinfo?nickname="+URLEncoder.encode(nickname,"UTF-8")+"&curid="+curid;
    }
}
