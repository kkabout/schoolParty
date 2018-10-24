package com.schoolParty.service.impl;

import com.schoolParty.service.MessageService;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
@Service("messageService")
public class MessageServiceImpl implements MessageService {
    @Override
    public void saveAndSendMessage(String from, String to, String message) {

    }

    @Override
    public void addMessage(int fromId, String fromName, int toId, String messageText, Timestamp messageDate) {

    }
}
