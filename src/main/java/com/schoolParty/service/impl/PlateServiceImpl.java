package com.schoolParty.service.impl;

import com.schoolParty.dao.PlateDao;

import com.schoolParty.model.plate;
import com.schoolParty.model.post;
import com.schoolParty.service.PlateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by Murrary on 2018/7/28.
 */
@Service("plateService")
public class PlateServiceImpl implements PlateService {
    @Resource
    private PlateDao plateDao;
    public List<plate> selectAll(){
        List<plate> plate=plateDao.selectAll();
        return plate;
    }

    @Override
    public plate selectOne(String idplate) {
        plate Plate = plateDao.selectOne(idplate);
        return Plate;
    }
}
