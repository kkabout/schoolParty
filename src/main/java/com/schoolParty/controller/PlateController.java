package com.schoolParty.controller;

import com.schoolParty.model.plate;
import com.schoolParty.service.IPostService;
import com.schoolParty.service.IReplyService;
import com.schoolParty.service.IUserService;
import com.schoolParty.service.impl.PlateServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by Murrary on 2018/7/28.
 */
@Controller
@RequestMapping("/plate")
public class PlateController {

    @Autowired
    private PlateServiceImpl  plateService;

    @Autowired
    private IPostService postService;

    @Autowired
    private IReplyService replyService;
    @Autowired
    private IUserService userService;
    @RequestMapping("/select")
    public  String select(Model model) throws IOException {


        List<plate> plates=plateService.selectAll();
        int postcount = postService.countPost();
        int count = replyService.countreply()+postcount;
        int usercount = userService.usercount();
        model.addAttribute("usercount",usercount);
        model.addAttribute("count",count);
        model.addAttribute("postcount",postcount);
        model.addAttribute("plate", plates);
       // response.sendRedirect(request.getContextPath() + "admin/index/index");
        return "index";


    }
}
