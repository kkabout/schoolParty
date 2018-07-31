package com.schoolParty.dao;

import com.schoolParty.model.plate;

import java.util.List;
import java.util.Map;

/**
 * Created by Murrary on 2018/7/28.
 */
public interface PlateDao {
    public List<plate> selectAll();

    plate selectOne(String idplate);
}
