package com.sailei.common.utils;

import com.xiaoleilu.hutool.util.NumberUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;

/**
 * 描述:分页工具类
 *  
 * @Author sailei
 * @Date 2019/7/21 9:56
 */
public class PageUtils {

    private static Logger logger = LoggerFactory.getLogger(PageUtils.class);

    /**
     * layui框架处理分页参数
     */
    public static void changeForMap(Map<String, Object> params){
        String pageStr = (String)params.get("page");
        String limitStr = (String)params.get("limit");
        String field = (String)params.get("field");
        String order = (String)params.get("order");
        Integer pageNum = 0;
        Integer limit = 10;
        if(NumberUtil.isNumber(pageStr) && NumberUtil.isNumber(limitStr)){
            pageNum =  Integer.valueOf(pageStr);
            limit =  Integer.valueOf(limitStr);
            pageNum = (pageNum -1) * limit;
        }
        String orderBy = null;
        if(ToolUtils.isNotEmpty(field) && StringUtils.isNotEmpty(order)){
            orderBy = field + " " + order;
            params.remove("field");
            params.remove("order");

        }
        params.put("orderBy", orderBy);
        params.put("page", pageNum);
        params.put("limit", limit);
        logger.info("分页参数:" + params);
    }
}
