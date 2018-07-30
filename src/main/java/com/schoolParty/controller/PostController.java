package com.schoolParty.controller;

import com.schoolParty.model.post;
import com.schoolParty.service.IPostService;
import com.schoolParty.service.IUserService;
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
    @RequestMapping(value = "insertPost.go",method = RequestMethod.POST)
    public String insertPost(post Post)
    {
        Date date = new Date();
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Post.setPublishTime(f.format(date));
        Post.setSectionId(1);
        Post.setUserId(1);
        this.postService.insertPost(Post);
        return "index";

    }
    @RequestMapping(value = "selectAllPost.go",method = {RequestMethod.POST,RequestMethod.GET})
    public String selectAllPost(Model model,String idplate)
    {

        List<post> posts = this.postService.selectAllPost(idplate);
        model.addAttribute("posts",posts);
        return "BBS";


    }




}
