package com.sailei.common;

import com.sailei.common.redis.RedisUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * 描述:Redis工具类测试
 *
 * @Author sailei
 * @date 2019/7/2 13:57
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class RedisUtilTest {

    /**
     * 记录日志
     */
    private static Logger logger = LoggerFactory.getLogger(RedisUtilTest.class);

    @Test
    public void testRedisUtil() {
        String str = RedisUtil.getKeyStr("SET:FILE_UPLOAD_BASEDIR");
        logger.info("获取Redis数据：" + str);
    }
}
