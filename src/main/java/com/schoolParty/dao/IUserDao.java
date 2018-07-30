package com.schoolParty.dao;

import com.schoolParty.model.User;

public interface IUserDao {

    User selectUser(String id);
    void insertUser(User user);
    int checkUser(String nickname);
    public User getUserByUid(String nickname,String passwd);

}