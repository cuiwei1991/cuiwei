package com.sailei.modules.gen.utils;

import com.sailei.common.utils.StringUtils;
import com.sailei.common.utils.ToolUtils;
import com.sailei.config.shiro.ShiroKit;
import com.sailei.modules.gen.entity.GenCategory;
import com.sailei.modules.gen.entity.GenConfig;
import com.sailei.modules.gen.entity.GenScheme;
import com.sailei.modules.gen.entity.GenTemplate;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** 
 * 描述:生成代码工具类
 *  
 * @Author sailei
 * @Date 2019/7/9 15:01
 */
public class GenUtils {

    /**
     * 记录日志
     */
    private static Logger logger = LoggerFactory.getLogger(GenUtils.class);

    /**
     * 描述:文件转对象
     *  
     * @Author sailei
     * @Date 2019/7/9 15:04
     */
    public static Object fileToObject(String fileName, Class clazz) {
        try {
            String pathName = (new StringBuilder("/gen/")).append(fileName).toString();
            Resource resource = new ClassPathResource(pathName);
            InputStream is = resource.getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            StringBuilder sb = new StringBuilder();
            do {
                String line = br.readLine();
                if (line == null) {
                    break;
                }
                sb.append(line).append("\r\n");
            } while (true);
            if (is != null) {
                is.close();
            }
            if (br != null) {
                br.close();
            }
            return XmlUtils.fromXml(sb.toString(), clazz);
        } catch (IOException e) {
            logger.warn("Error file convert: {}", e.getMessage());
        }
        return null;
    }
    
    /** 
     * 描述:获取配置文件的参数，并转化为对象
     *  
     * @Author sailei
     * @Date 2019/7/9 15:03
     */
    public static GenConfig getConfig() {
        return (GenConfig) fileToObject("config.xml", GenConfig.class);
    }

    /** 
     * 描述:获取代码生成模版文件列表
     *  
     * @Author sailei
     * @Date 2019/7/9 11:34
     */
    public static List<GenTemplate> getTemplateList(GenConfig config, String category, boolean isChildTable) {
        List<GenTemplate> templateList = new ArrayList<>();
        if (config != null && config.getCategoryList() != null && category != null) {
            /**
             * 遍历配置文件中的所有表类型，和要生成表的一致的保留
             */
            for (GenCategory e : config.getCategoryList()) {
                if (category.equals(e.getValue())) {
                    List<String> list;
                    if (!isChildTable) {
                        list = e.getTemplate();
                    } else {
                        list = e.getChildTableTemplate();
                    }

                    /**
                     * 得到表类型下的所有文件列表后遍历添加到结果集
                     */
                    if (list != null) {
                        for (String fileName : list) {
                            GenTemplate template = (GenTemplate) fileToObject(fileName, GenTemplate.class);
                            if (template != null) {
                                templateList.add(template);
                            }
                        }

                    }
                    break;
                }
            }

        }
        return templateList;
    }
    
    /** 
     * 描述:将代码生成的参数放到map中
     *  
     * @Author sailei
     * @Date 2019/7/9 14:55
     */
    public static Map<String,Object> getDataModel(GenScheme genScheme) {
        Map<String,Object> model = new HashMap<>();
        model.put("projectPath", genScheme.getProjectPath());
        model.put("packageName", StringUtils.lowerCase(genScheme.getPackageName()));
        model.put("lastPackageName", StringUtils.substringAfterLast((String) model.get("packageName"), "."));
        model.put("moduleName", StringUtils.lowerCase(genScheme.getModuleName()));
        model.put("subModuleName", StringUtils.lowerCase(genScheme.getSubModuleName()));
        model.put("className", StringUtils.uncapitalize(genScheme.getGenTable().getClassName()));
        model.put("ClassName", StringUtils.capitalize(genScheme.getGenTable().getClassName()));
        model.put("functionName", genScheme.getFunctionName());
        model.put("functionNameSimple", genScheme.getFunctionNameSimple());
        model.put("functionAuthor", ToolUtils.isNotEmpty(genScheme.getFunctionAuthor()) ? genScheme.getFunctionAuthor() : ShiroKit.getUser().getName());
        model.put("functionDate", StringUtils.getDateTime());
        model.put("urlPrefix", (new StringBuilder()).append(model.get("moduleName")).append(ToolUtils.isNotEmpty(genScheme.getSubModuleName()) ? (new StringBuilder("/")).append(StringUtils.lowerCase(genScheme.getSubModuleName())).toString() : "").append("/").append(model.get("className")).toString());
        model.put("viewPrefix", model.get("urlPrefix"));
        model.put("permissionPrefix", (new StringBuilder()).append(model.get("moduleName")).append(ToolUtils.isNotEmpty(genScheme.getSubModuleName()) ? (new StringBuilder(":")).append(StringUtils.lowerCase(genScheme.getSubModuleName())).toString() : "").append(":").append(model.get("className")).toString());
        model.put("dbType", "mysql");
        model.put("table", genScheme.getGenTable());
        return model;
    }

    /** 
     * 描述:生成代码文件，返回生成的结果
     *  
     * @Author sailei
     * @Date 2019/7/9 14:55
     */
    public static String generateToFile(GenTemplate tpl, Map model, boolean isReplaceFile) {
        String fileName = model.get("projectPath") + File.separator +
                StringUtils.replaceEach(renderString(tpl.getFileName(), new StringBuilder(String.valueOf(tpl.getFilePath())).append("/").toString(), model),
                        new String[]{"//", "/", "..", "."}, new String[]{File.separator, File.separator, "__", File.separator}).replace("__", "..") +
                        renderString(tpl.getFileName(), tpl.getFileName(), model);
        logger.info("【生成代码文件】fileName=" + fileName);
        String content = renderString(tpl.getFileName(), StringUtils.trimToEmpty(tpl.getContent()), model);
        logger.info("【生成代码文件】content=" + content);
        if (isReplaceFile) {
            FileUtils.deleteFile(fileName);
        }
        if (FileUtils.createFile(fileName)) {
            FileUtils.writeToFile(fileName, content, true);
            logger.info(" file create === " + fileName);
            return "生成成功：" + fileName + "<br/>";
        }
        logger.info(" file extents === " + fileName);
        return "文件已存在：" + fileName + "<br/>";
    }

    public static String renderString(String name, String templateString, Map<String, ?> model) {
        try {
            StringWriter result = new StringWriter();
            Template t = new Template("name", new StringReader(templateString), new Configuration());
            t.process(model, result);
            return result.toString();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("代码生成执行:" + name + "文件时异常！");
            throw new RuntimeException(e);
        }
    }

}
