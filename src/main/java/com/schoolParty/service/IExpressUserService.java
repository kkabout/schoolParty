package com.schoolParty.service;

public interface IExpressUserService {
    public void addrelation(Integer uid,Integer idpost);
    public boolean hasrelation(Integer uid,Integer idpost);
}
