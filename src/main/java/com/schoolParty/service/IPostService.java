package com.schoolParty.service;

import com.schoolParty.model.post;

import java.util.List;

public interface IPostService {
    public post selectPost(String idpost);


    public void insertPost(post Post);
    public void deletePost(String idpost);

    List<post> selectAllPost(String idplate);
}
