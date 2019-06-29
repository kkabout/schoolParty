package com.schoolParty.service.impl;

import com.schoolParty.dao.IUserDao;
import com.schoolParty.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@ServerEndpoint(value = "/chat/{uid}/{nickname}")
public class ChatServiceImpl {
    private Logger logger = LoggerFactory.getLogger(ChatServiceImpl.class);
    private static String uid;
    // 连接的用户
    private static Map<String, Session> onlines = new HashMap<String, Session>();


    //链接时执行
    @OnOpen
    public void onOpen(@PathParam("uid") String uid, Session session) throws IOException {
        this.uid = uid;
        onlines.put(uid, session);
        System.out.println("新连接：" + uid);
    }

    // 关闭时执行
    @OnClose
    public void onClose(@PathParam("uid") String uid) {
        if (onlines.containsKey(uid)) {
            onlines.remove(uid);
        }
        System.out.println("连接close：" + this.uid + " 关闭");
    }

    // 收到消息时执行
    @OnMessage
    public void onMessage(String message, Session session,@PathParam("uid") String uid,@PathParam("nickname") String nickname) throws IOException {
        System.out.println(message);
        String[] mes = message.split("&");
        sendMessageToUser(uid, mes[0], mes[1]);
        System.out.println(onlines.toString());
    }




    // 连接错误时执行
    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println("用户id为：" + this.uid + "的连接发送错误");
        error.printStackTrace();
    }

    /******
     *  给某个用户发送消息
     * @Param userName 发消息的name
     * **/
    private void sendMessageToUser(String uid , String receiveName, String message) {
        Set<String> users = onlines.keySet();
        for (String user : users) {
            if (user.equals(String.valueOf(receiveName))) {
                try {
                    if (onlines.get(user).isOpen()) {
                        System.out.println("user---" + user);
                        ((Session) onlines.get(user)).getBasicRemote().sendText(uid + "&" + message);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            }
        }
    }

}
