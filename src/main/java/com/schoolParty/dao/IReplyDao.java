package com.schoolParty.dao;

import com.schoolParty.model.reply;

import java.util.List;

public interface IReplyDao {


    List<reply> selectAllReply(String idpost,int startIndex, int pagesize);

    int selectCount(String idpost);
}
