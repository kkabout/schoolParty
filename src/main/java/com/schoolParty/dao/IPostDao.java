package com.schoolParty.dao;

import com.schoolParty.model.User;
import com.schoolParty.model.post;

import java.util.List;

public interface IPostDao {
    public post selectPost(String idpost);

    void insertPost(post Post);


    List<post> selectAllPost(String idplate);
}
