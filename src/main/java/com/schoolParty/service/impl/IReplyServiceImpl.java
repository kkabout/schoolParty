package com.schoolParty.service.impl;

import com.schoolParty.dao.IReplyDao;
import com.schoolParty.dao.IUserDao;
import com.schoolParty.model.User;
import com.schoolParty.model.pageBean;
import com.schoolParty.model.reply;
import com.schoolParty.model.replyshow;
import com.schoolParty.service.IReplyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
@Service
public class IReplyServiceImpl implements IReplyService {
    @Resource
    private IReplyDao replyDao;
    @Resource
    private IUserDao userDao;
    @Override
    public pageBean<replyshow> selectAllReply(String idpost, int pageNum) {
        int totalRecord = replyDao.selectCount(idpost);
        //发帖人的内容不算回帖 没有人回帖 为了能正确算出页数
        if(totalRecord==0)
        {
         totalRecord++;
        }
        pageBean<replyshow> pg = new pageBean<replyshow>(pageNum,10,totalRecord);
        List<reply> replies = replyDao.selectAllReply(idpost,pg.getStartIndex(),pg.getPagesize());
        List<replyshow> replyshows = new ArrayList<>();

        for(int i=0 ; i<replies.size();i++)
        {

             User user = userDao.selectUser(String.valueOf(replies.get(i).getRuserId()));
             replyshow rs = new replyshow(replies.get(i).getRid(),user.getNickname(),user.getImg(),
                     replies.get(i).getRpublishTime(),replies.get(i).getContent(),i+1);
             replyshows.add(rs);
        }
//        for (reply Reply: replies
//             ) {
//
//            User user = userDao.selectUser(String.valueOf(Reply.getRuserId()));
//            replyshow rs = new replyshow(user.getNickname(),user.getImg(),Reply.getRpublishTime(),Reply.getContent(),1);
//            replyshows.add(rs);
//
//        }
        pg.setList(replyshows);

        return pg;
    }

    @Override
    public int countreply() {
        return replyDao.replycount();
    }

    @Override
    public void deleteReply(int rid) {
        replyDao.deleteReply(rid);
    }

    @Override
    public void insertReply(String ruserid, String replyforid, String content, String rpublishTime) {
        reply Reply = new reply(rpublishTime,Integer.parseInt(replyforid),Integer.parseInt(ruserid),content);
        replyDao.insertReply(Reply);
    }
}
