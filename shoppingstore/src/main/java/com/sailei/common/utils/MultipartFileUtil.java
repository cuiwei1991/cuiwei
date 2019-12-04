package com.sailei.common.utils;

import com.aliyun.oss.OSSClient;
import com.sailei.modules.sys.utils.SetUtils;
import com.xiaoleilu.hutool.date.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

/**
 * MultipartFile上传工具类
 *
 * @Author gaojin
 */
public class MultipartFileUtil {

    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(MultipartFileUtil.class);
    public static final String FILE_BASE = "/staticFiles/";
    /**
     * endpoint以杭州为例，其它region请按实际情况填写
     */
    private static final String ENDPOINT = "oss-cn-qingdao.aliyuncs.com";
    /**
     * 云账号AccessKey有所有API访问权限，建议遵循阿里云安全最佳实践，创建并使用RAM子账号进行API访问或日常运维，请登录 https://ram.console.aliyun.com 创建
     */
    private static final String SECRET_KEY = "4AhmTW4vPhh5stpZa3q3Vx1TpjmCiI";

    private static final String ACCESS_KEY = "LTAIm3x7RmM6iLQz";
    private static final String OSS_BUCKET = "aladinn";

    /**
     * OSS上传文件
     *
     * @param file 文件
     * @param path 自定义路径
     * @return 文件访问地址
     */
    public static String uploadMultipartFile(MultipartFile file, String path) {
        String url = null;
        if (file != null) {
            /**创建OSSClient实例，上传文件*/
            OSSClient ossClient = new OSSClient(ENDPOINT, ACCESS_KEY, SECRET_KEY);
            try {
                String domainPath = SetUtils.getSetValue("FILE_UPLOAD_BASEDIR");
                if (ToolUtils.isEmpty(path)) {
                    path = "default";
                }
                /**得到文件名称*/
                String fileName = file.getOriginalFilename();
                /**得到上传文件的扩展名*/
                String fileExtName = "." + fileName.substring(fileName.lastIndexOf(".") + 1);
                /**文件上传到服务器后的文件名称*/
                String realFileName = makeFileName(fileExtName);
                fileName = domainPath + "/" + path + "/" + realFileName;
                logger.info("上传到OSS的文件名：" + fileName);

                ossClient.putObject(OSS_BUCKET, fileName, file.getInputStream());
                url = "http://" + OSS_BUCKET + "." + ENDPOINT + "/" + fileName;

            } catch (Exception e) {
                logger.error("【OSS上传文件】报错：" + e.getMessage());
            } finally {
                if (ossClient != null) {
                    ossClient.shutdown();
                }
            }
        }
        return url;
    }

    /**
     * 上传文件，返回文件访问地址 本地服务器
     *
     * @param file 文件
     * @return 文件访问地址
     */
    public static String uploadMultipartFileLocal(MultipartFile file, String path) {
        String url = null;
        if (file != null) {
            try {
                if (ToolUtils.isEmpty(path)) {
                    path = "default";
                }
                /**得到文件名称*/
                String fileName = file.getOriginalFilename();
                /**得到上传文件的扩展名*/
                String fileExtName = "." + fileName.substring(fileName.lastIndexOf(".") + 1);
                /**文件上传的根目录*/
                String basePath = SetUtils.getSetValue("FILE_UPLOAD_BASEDIR");
                /**当前日期的文本，作为目录*/
                String nowFormat = DateUtil.format(new Date(), "yyyyMMdd");
                /**文件上传到服务器后的文件名称*/
                String realFileName = makeFileName(fileExtName);
                /**相对地址*/
                String relativePath = FILE_BASE + path + "/" + nowFormat + "/" + realFileName;
                File desFile = new File(basePath + relativePath);
                /**判断文件地址是否存在，不存在创建*/
                if (!desFile.getParentFile().exists()) {
                    desFile.getParentFile().mkdirs();
                }
                file.transferTo(desFile);
                url = SetUtils.getSetValue("SYS_DOMAIN_NAME") + relativePath;
            } catch (IllegalStateException | IOException e) {
                logger.error("【上传文件】" + e.getMessage());
            }
            /**网站域名 + 相对地址 = 文件访问地址*/
        }
        return url;
    }

    /**
     * 生成随机不重复的文件名
     */
    private static String makeFileName(String fileExtName) {
        String uuId = UUID.randomUUID().toString();
        uuId = uuId.replaceAll("-", "");
        return uuId + fileExtName;
    }
}
