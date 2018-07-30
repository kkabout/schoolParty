package com.schoolParty.service.impl;

import com.schoolParty.dao.IPostDao;
import com.schoolParty.model.post;
import com.schoolParty.service.IPostService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("postService")
public class PostServiceImpl implements IPostService {

    @Resource
    private IPostDao postDao;
    @Override
    public post selectPost(String idpost) {

        return null;
    }

    @Override
    public void insertPost(post Post) {

        this.postDao.insertPost(Post);
    }

    @Override
    public void deletePost(String idpost) {

    }

    @Override
    public List<post> selectAllPost(String idplate) {
        List<post> posts = this.postDao.selectAllPost(idplate);

        return posts;
    }
}
