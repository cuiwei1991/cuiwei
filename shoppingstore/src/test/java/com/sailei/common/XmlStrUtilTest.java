package com.sailei.common;

import com.sailei.common.utils.XmlStrUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.Map;

/**
 * 描述:Xml工具类测试
 *
 * @Author sailei
 * @date 2019/7/2 14:47
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class XmlStrUtilTest {

    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(XmlStrUtilTest.class);

    @Test
    public void testXmlStrUtil() {
        Map<String, String> map = new HashMap<>();
        map.put("name","sailei");
        map.put("age","19");
        map.put("id","26815788545656155");
        String  result = XmlStrUtil.mapToXmlStr(map);
        logger.info(result);
        map = XmlStrUtil.xmlToMap(result);
        logger.info(map.toString());
    }
}
