package com.schoolParty.service;

import com.schoolParty.model.pageBean;
import com.schoolParty.model.reply;
import com.schoolParty.model.replyshow;

import java.util.List;

public interface IReplyService {
    public pageBean<replyshow> selectAllReply(String idpost, int pageNum);


    void insertReply(String ruserid, String replyforid, String content, String format);
}
