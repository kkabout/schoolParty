package com.schoolParty.controller;

import java.awt.*;
import java.sql.Timestamp;

import java.text.SimpleDateFormat;
import java.util.Date;

public class testjava {
    public static void main(String[] args)
    {
        Date date = new Date();
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String a = f.format(date);
        System.out.println(a);
    }
}
