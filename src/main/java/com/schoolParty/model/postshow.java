package com.schoolParty.model;

public class postshow {
    private String title;
    private String usernickname;
    private String publishTime;//帖子的发布时间,在数据库中对应表字段 publishTime datetime
    private String type;//帖子类型
    private int good;//帖子是否为精华帖,在数据库中对应的表字段 good int(1)
    private int top;//帖子是否为置顶贴,在数据库中对应的表字段 top int(1)
    private String img;//发帖人头像
    private String idpost;//帖子id
    private String content;//帖子内容
    private int end;//是否已被接单
    private int totalRecord;//帖子有多少回复
    private String kdcode;
    private String kdphone;
    private String kdcompany;
    private String kdname;

    public postshow(String title, String usernickname, String publishTime, String type) {
        this.title = title;
        this.usernickname = usernickname;
        this.publishTime = publishTime;
        this.type = type;
    }

    public postshow(String title, String usernickname, String publishTime, String type, String img ,String idpost,String content,
    String kdcode,String kdphone,String kdconpany,String kdname) {
        this.title = title;
        this.usernickname = usernickname;
        this.publishTime = publishTime;
        this.type = type;
        this.img = img;
        this.idpost = idpost;
        this.content = content;
        this.kdcode = kdcode;
        this.kdphone = kdphone;
        this.kdcompany = kdconpany;
        this.kdname = kdname;
    }

    public postshow(String title, String nickname, String publishTime, String type, String idpost,int end,int totalRecord) {
        this.title = title;
        this.usernickname = nickname;
        this.publishTime = publishTime;
        this.type = type;
        this.idpost = idpost;
        this.end = end;
        this.totalRecord=totalRecord;

    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUsernickname() {
        return usernickname;
    }

    public void setUsernickname(String usernickname) {
        this.usernickname = usernickname;
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getIdpost() {
        return idpost;
    }

    public void setIdpost(String idpost) {
        this.idpost = idpost;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public String getKdcode() {
        return kdcode;
    }

    public void setKdcode(String kdcode) {
        this.kdcode = kdcode;
    }

    public String getKdphone() {
        return kdphone;
    }

    public void setKdphone(String kdphone) {
        this.kdphone = kdphone;
    }

    public String getKdcompany() {
        return kdcompany;
    }

    public void setKdcompany(String kdcompany) {
        this.kdcompany = kdcompany;
    }

    public String getKdname() {
        return kdname;
    }

    public void setKdname(String kdname) {
        this.kdname = kdname;
    }
}
