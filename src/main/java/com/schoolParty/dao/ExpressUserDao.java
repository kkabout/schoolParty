package com.schoolParty.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ExpressUserDao {
    public void addrelation(@Param("uid")int uid,@Param("idpost") int idpost);
    public List<Integer> hasrelation(@Param("uid")int uid);
}
