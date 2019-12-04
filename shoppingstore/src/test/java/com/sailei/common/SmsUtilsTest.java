package com.sailei.common;

import com.sailei.common.service.ServiceResult;
import com.sailei.common.utils.SmsUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.Map;

/**
 * 描述:短信工具类测试
 *
 * @Author sailei
 * @Date 2019/7/2 13:58
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class SmsUtilsTest {

    /**
     * 记录日志
     */
    private static Logger logger = LoggerFactory.getLogger(SmsUtilsTest.class);

    @Test
    public void testMessage() {
        Map<String, Object> params = new HashMap<>();
        params.put("code", "1568");
        ServiceResult result = SmsUtils.sendMessage(SmsUtils.ALADINN_CODE, "18721971568", params);
        logger.info(result.toString());
    }
}
