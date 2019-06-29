package com.schoolParty.service.impl;

import com.schoolParty.MyUtils.ThreadPoolUtil;
import com.schoolParty.dao.ExpressUserDao;
import com.schoolParty.service.IExpressUserService;
import com.schoolParty.service.IPostService;
import org.springframework.stereotype.Service;
import sun.nio.ch.ThreadPool;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ExpressUserServiceImpl implements IExpressUserService {
    @Resource
    private ExpressUserDao dao;
    @Resource
    private IPostService postService;
    @Override
    public void addrelation(Integer uid, Integer idpost) {
        ThreadPoolUtil.kdExecutor.execute(new Runnable(){
           @Override
           public void run(){
               dao.addrelation(uid,idpost);
           }
        });
        ThreadPoolUtil.kdExecutor.execute(new Runnable() {
            @Override
            public void run() {
                postService.changeEnd(String.valueOf(idpost));
            }
        });

    }

    @Override
    public boolean hasrelation(Integer uid, Integer idpost) {
        List<Integer> idposts  = dao.hasrelation(uid);
        return idposts.contains(idpost);

    }
}
