package com.schoolParty.service;

import java.io.Serializable;
import java.sql.Timestamp;

public interface MessageService extends Serializable {
//    保存message
    public void saveAndSendMessage(String from,String to,String message);

    void addMessage(int fromId, String fromName, int toId, String messageText, Timestamp messageDate);
}
