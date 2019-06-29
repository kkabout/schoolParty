package com.schoolParty.controller;

import com.schoolParty.model.plate;
import com.schoolParty.model.post;
import com.schoolParty.model.pageBean;
import com.schoolParty.model.postshow;
import com.schoolParty.service.IPostService;
import com.schoolParty.service.IUserService;
import com.schoolParty.service.PlateService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/post")
public class PostController {
    @Resource
    private IPostService postService;
    @Resource
    private IUserService userService;
    @Resource
    private PlateService plateService;
    @RequestMapping(value = "insertPost.go",method = RequestMethod.POST)
    public String insertPost(post Post,String idplate,String userid)
    {

        Date date = new Date();
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Post.setPublishTime(f.format(date));
        Post.setSectionId(Integer.parseInt(idplate));
        Post.setUserId(Integer.parseInt(userid));
        this.postService.insertPost(Post);
        return "redirect:/post/selectAllPost.go?idplate="+idplate+"&pageNum=1";

    }


    @RequestMapping(value = "selectAllPost.go",method = {RequestMethod.POST,RequestMethod.GET})
    public String selectAllPost(Model model,String idplate,int pageNum)
    {

        pageBean<postshow> postshow = this.postService.selectAllPost(idplate,pageNum);
        plate Plate = this.plateService.selectOne(idplate);
        model.addAttribute("plate",Plate);
        model.addAttribute("posts",postshow);
        if(idplate.equals("2"))
        {
            return "express";
        }
        else
            return "BBS";


    }
    @RequestMapping(value = "deletepost",method = {RequestMethod.POST,RequestMethod.GET})
    public String deletePost(String idplate,String idpost)
    {
        this.postService.deletePost(idpost);
        return "redirect:/post/selectAllPost.go?idplate="+idplate+"&pageNum=1";

    }




}
