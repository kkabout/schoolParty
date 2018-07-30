package com.schoolParty.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/index")
public class IndexController {
    @RequestMapping("/index")
    public void index(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //response.sendRedirect(request.getContextPath()+"/admin/plate/select");
        request.getRequestDispatcher(request.getContextPath()+"/plate/select").forward(request,response);
    }

    @RequestMapping("/BBS")
    public String BBS(){
        return "BBS";
    }



}