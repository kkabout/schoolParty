package com.schoolParty.model;

import java.util.List;

//用于分页的javaBean
public class pageBean<T>{
    //不需要计算的数据
    private int pageNum;//当前页
    private int pagesize;//每页的记录数
    private int totalRecord;//总记录数
    //需要计算的数据
    private int totalpage;//总页数
    private int startIndex; // 开始索引
    //将每页现实的数据显示在list集合上
    private List<T> list;

    public pageBean(int pageNum, int pagesize, int totalRecord) {
        this.pageNum = pageNum;
        this.pagesize = pagesize;
        this.totalRecord = totalRecord;
        //totalpage
        if(totalRecord%pagesize==0)//整除表示n页可以完全显示
        {
            this.totalpage=totalRecord/pagesize;
        }
        else
        {
            this.totalpage=(totalRecord/pagesize)+1;
        }
        this.startIndex=(pageNum-1)*pagesize;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPagesize() {
        return pagesize;
    }

    public void setPagesize(int pagesize) {
        this.pagesize = pagesize;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getTotalpage() {
        return totalpage;
    }

    public void setTotalpage(int totalpage) {
        this.totalpage = totalpage;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
