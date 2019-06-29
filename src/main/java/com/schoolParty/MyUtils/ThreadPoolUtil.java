package com.schoolParty.MyUtils;

import java.util.concurrent.*;

public class ThreadPoolUtil {
    public static final ThreadPoolExecutor EXECUTOR = new ThreadPoolExecutor(32, 32, 100L, TimeUnit.SECONDS,
            new LinkedBlockingQueue<Runnable>(50000),
            new ThreadFactory() {
                @Override
                public Thread newThread(Runnable r) {
                    return new Thread(r, "ThreadPoolUtil threadpool");
                }
            },
            new RejectedExecutionHandler() {

                @Override
                public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {
                    String message = "ThreadPoolUtil threadpool is full...";
                    new Exception(message).printStackTrace();
                }
            });


    public static final ThreadPoolExecutor kdExecutor = new ThreadPoolExecutor(10, 10, 100L, TimeUnit.SECONDS,
            new LinkedBlockingQueue<Runnable>(500000),
            new ThreadFactory() {
                @Override
                public Thread newThread(Runnable r) {
                    return new Thread(r, "ThreadPoolUtil threadpool");
                }
            },
            new RejectedExecutionHandler() {

                @Override
                public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {
                    String message = "ThreadPoolUtil threadpool is full...";
                    new Exception(message).printStackTrace();
                }
            });
}
