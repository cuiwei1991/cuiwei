package com.sailei.common.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

/**
 * Socket工具类
 *
 * @Author sailei
 */
public class SocketUtil {

    /**
     * 记录日志
     */
    private static Logger logger = LoggerFactory.getLogger(SocketUtil.class);
    /**
     * soket接口地址
     */
    private static final String IP_ADDRESS = "47.75.144.245";
    /**
     * soket端口号
     */
    private static final Integer PORT = 54322;

    /**
     * 获取socket连接
     *
     * @param ip   IP地址
     * @param port 端口号
     */
    public static Socket getConnection(String ip, int port) {
        Socket socket = null;
        try {
            socket = new Socket(ip, port);
            /**设置超时时间10秒，超时获取不到信息自动返回失败*/
            socket.setSoTimeout(30000);
        } catch (IOException e) {
            logger.error("【Socket工具类】创建链接失败，请检查IP和PORT！");
        }
        return socket;
    }

    /**
     * 发送报文
     *
     * @param socket  链接对象
     * @param request 请求参数
     */
    public static String send(Socket socket, String request) {
        InputStream in = null;
        OutputStream out = null;
        BufferedInputStream bs = null;
        try {
            /**in代表服务器到客户端的流*/
            in = socket.getInputStream();
            /**代表客户端到服务器的流*/
            out = socket.getOutputStream();
            /**输入执行命令*/
            out.write(request.getBytes());
            out.flush();
            /** 接收执行命令结果*/
            bs = new BufferedInputStream(in);
            byte[] data = new byte[20480];
            /**读取信息*/
            int len = bs.read(data);
            String requestInfo = new String(data, 0, len).trim();
            return requestInfo;
        } catch (IOException e) {
            logger.error("【Socket工具类】发送报文出错，错误信息=" + e.getMessage());
        } finally {
            if (bs != null) {
                try {
                    bs.close();
                } catch (IOException e) {
                    logger.error("【Socket工具类】关闭BufferedInputStream出错，错误信息=" + e.getMessage());
                }
            }
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    logger.error("【Socket工具类】关闭输入流出错，错误信息=" + e.getMessage());
                }
            }
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    logger.error("【Socket工具类】关闭输出流出错，错误信息=" + e.getMessage());
                }
            }
        }
        return null;
    }

    /**
     * 关闭socket连接
     *
     * @param socket 链接对象
     */
    public static void close(Socket socket) {
        if (socket != null) {
            try {
                socket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 调用soket接口获取返回结果
     *
     * @param requestJson 请求参数json
     */
    public static String getSoketSendResult(String requestJson) {
        logger.info("【Socket工具类】请求参数=" + requestJson);
        String result = null;
        Socket socket = null;
        try {
            socket = SocketUtil.getConnection(IP_ADDRESS, PORT);
            result = SocketUtil.send(socket, requestJson);
        } catch (Exception e) {
            logger.error("【Socket工具类】获取返回结果失败，错误信息=" + e.getMessage());
            SocketUtil.close(socket);
        }
        logger.info("【Socket工具类】获取返回结果=" + result);
        return result;
    }

}
