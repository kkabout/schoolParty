package com.schoolParty.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

// 加载spring配置文件
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class IPostDaoTest {
    @Autowired
    private IPostDao dao;
    @Autowired
    private IUserDao dao1;
    @Test
    public  void test()
    {
        int i = this.dao.selectCount("1");
        System.out.println(i);
    }



}
