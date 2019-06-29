package com.schoolParty.dao;

import com.schoolParty.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IFriendDao {
    public int myFocus(int uid);
    public int follow(int uid);
    public List<Integer> myFocusList(int uid);
    public void addfocus(@Param("uid")int curuid, @Param("otheruid")int otheruid);
    public void deletefocus(@Param("uid")int curuid, @Param("otheruid")int otheruid);
    public List<Integer> showfocus(@Param("uid")int curid);
    public List<Integer> showfollow(@Param("uid")int curid);
}
