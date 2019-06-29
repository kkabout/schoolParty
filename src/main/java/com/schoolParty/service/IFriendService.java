package com.schoolParty.service;

import com.schoolParty.model.User;

import java.util.List;

public interface IFriendService {
    public int myFocus(int uid);
    public int follow(int uid);
    public boolean hasFocused(int curid,int otherid);
    public void addfocus(int curuid,int otheruid);
    public void deletefocus(int curuid,int otheruid);
    public List<User> showfocus(int curid);
    public List<User> showfollow(int curid);
}
