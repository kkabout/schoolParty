package com.schoolParty.controller;

import com.schoolParty.service.IExpressUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
@RequestMapping("/expressUser")
public class ExpressUserController {
    @Autowired
    private IExpressUserService expressUserService;
    @RequestMapping("/insert")
    public String addrelation(@RequestParam("uid") Integer uid,@RequestParam("idpost") Integer idpost, Model model)  {
        expressUserService.addrelation(uid,idpost);
        model.addAttribute("hasrelation",true);
        return "redirect:/reply/selectAllReply?idpost="+idpost+"&idplate=2&pageNum=1";
    }
}
