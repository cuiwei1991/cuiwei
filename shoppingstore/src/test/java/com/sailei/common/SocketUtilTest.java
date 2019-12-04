package com.sailei.common;

import com.sailei.common.utils.SocketUtil;
import com.xiaoleilu.hutool.json.JSONUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.net.Socket;
import java.util.HashMap;
import java.util.Map;

/**
 * 描述:Socket工具类测试
 *
 * @Author sailei
 * @Date 2019/7/2 13:58
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class SocketUtilTest {

    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(SocketUtilTest.class);

    @Test
    public void socketTest() {
        Socket socket = null;
        Map<String, String> map = new HashMap<>();
        map.put("author", "ALDSecret");
        map.put("NO_send", "2");
        map.put("method", "readVersion");
        map.put("jsonrpc", "2.0");
        map.put("id", "2");
        map.put("responce", "");
        String cmd = JSONUtil.toJsonStr(map);
        logger.info("cmd=" + cmd);
        try {
            socket = SocketUtil.getConnection("localhost", 54322);
            String resultStr = SocketUtil.send(socket, cmd);
            logger.info(resultStr);
        } catch (Exception e) {
            SocketUtil.close(socket);
        }
    }

}
