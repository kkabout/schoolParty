package com.schoolParty.service.impl;

import com.schoolParty.dao.IPostDao;
import com.schoolParty.dao.IUserDao;
import com.schoolParty.model.pageBean;
import com.schoolParty.model.post;
import com.schoolParty.model.postshow;
import com.schoolParty.service.IPostService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("postService")
public class PostServiceImpl implements IPostService {

    @Resource
    private IPostDao postDao;
    @Resource
    private IUserDao userDao;


    @Override
    public void insertPost(post Post) {

        this.postDao.insertPost(Post);
    }

    @Override
    public void deletePost(String idpost) {

    }

    @Override
    public post selectOnePost(String idpost) {
        post Post = postDao.selectOnePost(idpost);
        return Post;
    }


    @Override
    public pageBean<postshow> selectAllPost(String idplate, int pageNum) {

        int totalRecord = this.postDao.selectCount(idplate);
        pageBean pb = new pageBean(pageNum,10,totalRecord);
        List<post> posts = this.postDao.selectAllPost(idplate,pb.getStartIndex(),pb.getPagesize());
        List<postshow> postshows = new ArrayList<postshow>();
        for (post Post:posts
                ) {
            String nickname = this.userDao.selectUser(String.valueOf(Post.getUserId())).getNickname();
            postshow ps = new postshow(Post.getTitle(),nickname,Post.getPublishTime(),
                    Post.getType(),String.valueOf(Post.getIdpost()),Post.getEnd());
            postshows.add(ps);
        }
        pb.setList(postshows);

        return pb;
    }
}
