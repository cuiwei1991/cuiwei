package com.sailei.common.redis;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

/**
 * 描述:序列化和反序列化的工具类
 * 序列化：把对象转换为字节序列的过程称为对象的序列化
 * 反序列化：把字节序列恢复为对象的过程称为对象的反序列化
 *
 * @Author sailei
 * @Date 2019/7/2 13:54
 **/
public class SerializeUtils {
    public static final Logger logger = LoggerFactory.getLogger(SerializeUtils.class);

    /**
     * 对象序列化
     *
     * @param object 对象
     * @return 字节
     */
    public static byte[] serialize(Object object) {
        ObjectOutputStream objectOutputStream;
        ByteArrayOutputStream byteArrayOutputStream;
        try {
            byteArrayOutputStream = new ByteArrayOutputStream();
            objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
            objectOutputStream.writeObject(object);
            byte[] bytes = byteArrayOutputStream.toByteArray();
            return bytes;
        } catch (Exception e) {
            logger.error("对象序列化失败,正在处理的对象：Object=" + object.getClass());
        }
        return null;
    }

    /**
     * 描述:对象反序列化
     *
     * @Author sailei
     * @Date 2019/7/2 14:03
     **/
    public static Object unserialize(byte[] bytes) {
        ByteArrayInputStream byteArrayInputStream;
        try {
            byteArrayInputStream = new ByteArrayInputStream(bytes);
            ObjectInputStream objectInputStream = new ObjectInputStream(byteArrayInputStream);
            return objectInputStream.readObject();
        } catch (Exception e) {
            logger.error("对象反序列化失败！！！bytes=" + bytes);
        }
        return null;
    }
}
