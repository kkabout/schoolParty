package com.schoolParty.controller;

import com.schoolParty.model.User;
import com.schoolParty.service.IUserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class UserController {
    @Resource
    private IUserService userService;
    @RequestMapping(value = "/registUser.go", method =RequestMethod.POST)
    public void insertUser(HttpServletRequest request, HttpServletResponse response, User user) throws IOException {
        String md5pwd = DigestUtils.md5Hex(user.getPasswd());
        user.setPasswd(md5pwd);
        this.userService.insertUser(user);
    }
}
