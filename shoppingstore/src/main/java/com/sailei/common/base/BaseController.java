package com.sailei.common.base;

import com.google.common.collect.Lists;
import com.sailei.common.utils.AddressUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.Validator;
import java.util.*;

/**
 * 描述:基础控制器
 * 添加一些公用的方法
 *
 * @Author sailei
 * @date 2019/7/15 18:19
 **/
public class BaseController {

    protected final String REDIRECT = "redirect:";

    /**
     * 验证Bean实例对象
     */
    @Autowired
    protected Validator validator;

    /**
     * 得到 session
     *
     * @return
     */
    protected HttpSession getSession(HttpServletRequest request) {
        return request.getSession();
    }

    /**
     * 获取IP地址
     *
     * @param request
     * @return
     */
    public String getIpAddr(HttpServletRequest request) {
        return AddressUtils.getIpAddress(request);
    }

    /**
     * 获得request中的参数
     *
     * @param request
     * @return string object类型的map
     */
    public HashMap<String, Object> getParametersO(HttpServletRequest request) {
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        if (request == null) {
            request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        }
        Map req = request.getParameterMap();
        if ((req != null) && (!req.isEmpty())) {
            Map<String, Object> p = new HashMap<String, Object>();
            Collection keys = req.keySet();
            for (Iterator i = keys.iterator(); i.hasNext();) {
                String key = (String) i.next();
                Object value = req.get(key);
                Object v = null;
                if ((value.getClass().isArray()) && (((Object[]) value).length > 0)) {
                    if (((Object[]) value).length > 1) {
                        v = ((Object[]) value);
                    } else {
                        v = ((Object[]) value)[0];
                    }
                } else {
                    v = value;
                }
                if ((v != null) && ((v instanceof String)) && !"\"\"".equals(v)) {
                    String s = ((String) v).trim();
                    if (s.length() > 0) {
                        p.put(key, s);
                    }
                }
            }
            hashMap.putAll(p);

        }
        return hashMap;
    }

    /**
     * 描述:服务端参数有效性验证
     * @param object 验证的实体对象
     * @param groups 验证组
     * @return 验证成功：返回true；严重失败：将错误信息添加到 flash message 中
     *
     * @Author sailei
     * @Date 2019/9/29 15:00
     */
    protected String beanValidator(Object object, Class<?>... groups) {
        try{
            Set<ConstraintViolation<Object>> constraintViolations = validator.validate(object, groups);
            if (!constraintViolations.isEmpty()) {
                StringBuffer errorMessages = new StringBuffer();
                for (ConstraintViolation violation : constraintViolations) {
                    errorMessages.append(violation.getPropertyPath() + ":" + violation.getMessage() + "<br/>");
                }
                return errorMessages.toString();
            }
        }catch(Exception e){
            return "校验信息失败!";
        }
        return "";
    }
}
