package com.schoolParty.dao;

import com.schoolParty.model.pageBean;
import com.schoolParty.model.post;

import java.util.List;

public interface IPostDao {
    public post selectPost(String idpost);

    void insertPost(post Post);

    void deletePost(String idpost);

    int selectCount(String idplate);

    public int postcount();

    List<post> selectAllPost(String idplate, int startIndex, int pagesize);

    post selectOnePost(String idpost);

    void changeEnd(String idpost);
}
