package com.sailei.common;

import com.sailei.common.redis.LockDoorUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * 描述:公用锁测试
 *
 * @Author sailei
 * @date 2019/7/2 14:16
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class LockDoorUtilTest {

    /**
     * 记录日志
     */
    private static Logger logger = LoggerFactory.getLogger(LockDoorUtilTest.class);

    @Test
    public void testLockDoorUtil() {

        String key = "20190702156685456";
        boolean lockFlag = LockDoorUtil.setKey(key);

        try{
            logger.info("【公用锁测试】公共锁可用状态lockFlag=" + lockFlag);
            if (!lockFlag) {
                /**
                 * 当获取到门锁已被锁定时,说明业务冲突（产生了并发）直接返回
                 */
                logger.warn("【公用锁测试】其他订单正在处理中，打印请求参数和锁key" + key);
                return;
            }
            logger.info("【公用锁测试】没有业务冲突，将该订单添加到队列中。");
            
            /**
             * 继续处理业务逻辑
             */

            logger.info("【公用锁测试】正在处理业务逻辑......");

            /**
             * 业务逻辑处理完成
             */
        }catch (Exception e){
            logger.error("【公用锁测试】报错：" + e.getMessage());
        }finally {
            /**只有上锁的才移除 lockFlag=true表示可用，可用时才锁定 */
            if (lockFlag) {
                LockDoorUtil.delKey(key);
                logger.info("【公用锁测试】该订单处理完成，已从队列中移除！");
            }
        }
    }

}
