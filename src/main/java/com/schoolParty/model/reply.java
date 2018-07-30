package com.schoolParty.model;

import java.util.Date;

public class reply {
    private int rid; //回复对应的id,对应数据库中表字段 rid int(11) PK
    private String rpublishTime;//回复的时间,对应数据库中表字段 rpublishTime datetime
    private String rmodifyTime;//回复修改的时间,对应数据库中表字段 rmodifyTime datetime
    private int replyforid;//回复的帖子id,对应数据库中表字段 replyforid int(11)
    private int ruserId;//回复人id,对应数据库中表字段 ruserId varchar(14)
    private String content;//回复的具体内容,对应数据库中表字段 content text
    private int good;//回复被赞的次数,对应数据库中表字段 goods int(11)

    public reply() {
    }

    public reply(int rid, String rpublishTime, String rmodifyTime, int replyforid, int ruserId, String content, int good) {
        this.rid = rid;
        this.rpublishTime = rpublishTime;
        this.rmodifyTime = rmodifyTime;
        this.replyforid = replyforid;
        this.ruserId = ruserId;
        this.content = content;
        this.good = good;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getRpublishTime() {
        return rpublishTime;
    }

    public void setRpublishTime(String rpublishTime) {
        this.rpublishTime = rpublishTime;
    }

    public String getRmodifyTime() {
        return rmodifyTime;
    }

    public void setRmodifyTime(String rmodifyTime) {
        this.rmodifyTime = rmodifyTime;
    }

    public int getReplyforid() {
        return replyforid;
    }

    public void setReplyforid(int replyforid) {
        this.replyforid = replyforid;
    }

    public int getRuserId() {
        return ruserId;
    }

    public void setRuserId(int ruserId) {
        this.ruserId = ruserId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getGood() {
        return good;
    }

    public void setGood(int good) {
        this.good = good;
    }
}
