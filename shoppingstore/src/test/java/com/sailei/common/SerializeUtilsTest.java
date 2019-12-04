package com.sailei.common;

import com.sailei.common.redis.SerializeUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * 描述:序列化工具类测试
 *
 * @Author sailei
 * @date 2019/7/2 14:08
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class SerializeUtilsTest {

    /**
     * 记录日志
     */
    private static Logger logger = LoggerFactory.getLogger(SerializeUtilsTest.class);

    @Test
    public void testSerializeUtils() {
        String str = "序列化";
        byte[] result = SerializeUtils.serialize(str);
        logger.info("序列化结果：" + result);
        Object o = SerializeUtils.unserialize(result);
        logger.info("反序列化结果：" + o);
    }
}
