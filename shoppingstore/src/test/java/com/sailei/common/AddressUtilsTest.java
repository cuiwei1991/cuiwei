package com.sailei.common;

import com.sailei.common.utils.AddressUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * 描述:获取IP地址工具类测试
 *
 * @Author sailei
 * @date 2019/7/2 13:56
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class AddressUtilsTest {

    /**
     * 记录日志
     */
    private static Logger logger = LoggerFactory.getLogger(AddressUtilsTest.class);

    @Test
    public void addressUtilsTest() {
        String result = AddressUtils.getAddressByIp("221.0.241.114");
        logger.info(result);
    }
}
