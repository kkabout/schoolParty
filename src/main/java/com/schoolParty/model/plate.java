package com.schoolParty.model;

public class plate {

    private int idplate; //板块的id,对应数据库中表字段 idplate int(11) PK
    private String pname;//板块的名称,对应数据库中表字段 pname varchar(45)
    private String plogo;//板块的logo,对应数据库中表字段 plogo varchar(200)
    private String pdescription;//板块的描述,对应数据库中表字段 pdescription varchar(200)

    public plate() {
    }

    public plate(int idplate, String pname, String plogo, String pdescription) {
        this.idplate = idplate;
        this.pname = pname;
        this.plogo = plogo;
        this.pdescription = pdescription;
    }

    public int getIdplate() {
        return idplate;
    }

    public void setIdplate(int idplate) {
        this.idplate = idplate;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPlogo() {
        return plogo;
    }

    public void setPlogo(String plogo) {
        this.plogo = plogo;
    }

    public String getPdescription() {
        return pdescription;
    }

    public void setPdescription(String pdescription) {
        this.pdescription = pdescription;
    }
}
