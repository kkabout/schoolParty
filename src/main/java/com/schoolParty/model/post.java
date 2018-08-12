package com.schoolParty.model;

import java.util.Date;

public class post {
    /*
    idpost int(11) PK
    content text
modifyTime datetime
publishTime datetime
title varchar(50)
sectionId int(11)
userId varchar(14)
good int(1)
top int(1)

     */
    private int idpost; //帖子的id,在数据库中对应表字段 idpost int(11) PK
    private String content;//帖子的内容,在数据库中对应表字段  content text
    private String modifyTime;//帖子的修改时间,在数据库中对应表字段 modifyTime datetime
    private String publishTime;//帖子的发布时间,在数据库中对应表字段 publishTime datetime
    private String title;//帖子的标题,在数据库中对应表字段 title varchar(50)
    private int sectionId;//帖子发布在板块中,对应的板块标题,在数据库中对应表字段 sectionId int(11)
    private int userId;//对应的发帖人id,在数据库中对应表字段 userId INT;
    private int good;//帖子是否为精华帖,在数据库中对应的表字段 good int(1)
    private int top;//帖子是否为置顶贴,在数据库中对应的表字段 top int(1)
    private String type;//帖子类型
    private int end;//是否已被接单

    public post() {
    }

    public post(int idpost, String content, String modifyTime, String publishTime, String title, int sectionId, int userId, int good, int top, String type) {
        this.idpost = idpost;
        this.content = content;
        this.modifyTime = modifyTime;
        this.publishTime = publishTime;
        this.title = title;
        this.sectionId = sectionId;
        this.userId = userId;
        this.good = good;
        this.top = top;
        this.type = type;
    }

    public int getIdpost() {
        return idpost;
    }

    public void setIdpost(int idpost) {
        this.idpost = idpost;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(String modifyTime) {
        this.modifyTime = modifyTime;
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getSectionId() {
        return sectionId;
    }

    public void setSectionId(int sectionId) {
        this.sectionId = sectionId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getGood() {
        return good;
    }

    public void setGood(int good) {
        this.good = good;
    }

    public int getTop() {
        return top;
    }

    public void setTop(int top) {
        this.top = top;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }
}