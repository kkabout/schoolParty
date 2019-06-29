package com.schoolParty.service.impl;

import com.schoolParty.dao.IFriendDao;
import com.schoolParty.dao.IUserDao;
import com.schoolParty.model.User;
import com.schoolParty.service.IFriendService;
import com.schoolParty.service.IUserService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.LinkedList;
import java.util.List;

@Service
public class FriendServiceImpl implements IFriendService {
    @Resource
    private IFriendDao dao ;
    @Resource
    private IUserDao userDao;
    @Override
    public int myFocus(int uid) {
        return dao.myFocus(uid);
    }

    @Override
    public int follow(int uid) {
        return dao.follow(uid);
    }

    @Override
    public boolean hasFocused(int curid, int otherid) {
        List<Integer> foucusList = dao.myFocusList(curid);
        return foucusList.contains(otherid);
    }
    @Override
    public void addfocus(int curuid,int otheruid) {

       dao.addfocus(curuid,otheruid);
    }

    @Override
    public void deletefocus(int curuid,int otheruid) {

        dao.deletefocus(curuid,otheruid);
    }

    @Override
    public List<User> showfocus(int curid) {
        List<Integer> foucsid = dao.showfocus(curid);
        List<User> users = new LinkedList<>();
        for (Integer id :foucsid)
        {
            users.add(userDao.selectUser(String.valueOf(id)));
        }

        return users;
    }

    @Override
    public List<User> showfollow(int curid) {
        List<Integer> foucsid = dao.showfollow(curid);
        List<User> users = new LinkedList<>();
        for (Integer id :foucsid)
        {
            users.add(userDao.selectUser(String.valueOf(id)));
        }

        return users;
    }


}
