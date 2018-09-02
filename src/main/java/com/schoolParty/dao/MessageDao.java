package com.schoolParty.dao;

import java.sql.Timestamp;

public interface MessageDao {
    public void addMessage(int fromId, String fromName, int toId, String messageText, Timestamp messageDate);
}
