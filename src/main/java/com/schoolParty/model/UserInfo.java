package com.schoolParty.model;

public class UserInfo {
    private String nickname;
    private String img;
    private String signture;
    private int focuscount;
    private int followcount;

    public UserInfo(String nickname, String img, String signture, int focuscount, int followcount) {
        this.nickname = nickname;
        this.img = img;
        this.signture = signture;
        this.focuscount = focuscount;
        this.followcount = followcount;
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

    public String getSignture() {
        return signture;
    }

    public void setSignture(String signture) {
        this.signture = signture;
    }

    public int getFocuscount() {
        return focuscount;
    }

    public void setFocuscount(int focuscount) {
        this.focuscount = focuscount;
    }

    public int getFollowcount() {
        return followcount;
    }

    public void setFollowcount(int followcount) {
        this.followcount = followcount;
    }
}
