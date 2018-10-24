package com.schoolParty.dao;

import com.schoolParty.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IUserDao {
    User showUser(String nickname);


    User selectUser(String id);
    List<User> findFriendByid(int id);
    void insertUser(User user);
    int checkUser(String nickname);
    public User getUserByUid(String nickname, String passwd);
    public User getUserByNickname(String nickname);
    boolean  changeInfo(User user);
    boolean changePassword(@Param("passwd")String password,@Param("nickname")String nickname);

}