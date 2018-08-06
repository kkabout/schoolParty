package com.schoolParty.model;

public class replyshow {
    private String nickname;//当前楼用户的昵称
    private String img;//当前楼用户的头像
    private String publishTime;//当前楼用户回复的时间
    private String content;//当前楼用户回复的内容
    private int num;//回复在当前页的楼层

    public replyshow(String nickname, String img, String publishTime, String content,int num) {
        this.nickname = nickname;
        this.img = img;
        this.publishTime = publishTime;
        this.content = content;
        this.num =num;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}
