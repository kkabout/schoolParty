package com.schoolParty.service;

import com.schoolParty.model.pageBean;
import com.schoolParty.model.post;
import com.schoolParty.model.postshow;

import java.util.List;

public interface IPostService {



    public void insertPost(post Post);
    public void deletePost(String idpost);
    public post selectOnePost(String idpost);

    pageBean<postshow> selectAllPost(String idplate, int pageNum);
}
