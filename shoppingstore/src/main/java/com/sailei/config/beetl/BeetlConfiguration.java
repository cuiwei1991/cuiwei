package com.sailei.config.beetl;

import com.sailei.common.utils.ToolUtils;
import org.beetl.ext.spring.BeetlGroupUtilConfiguration;

import java.util.HashMap;
import java.util.Map;

/**
 * beetl拓展配置,绑定一些工具类,方便在模板中直接调用
 *
 * @Author sailei
 * @Date 2018/2/22 21:03
 */
public class BeetlConfiguration extends BeetlGroupUtilConfiguration {

    @Override
    public void initOther() {

        /** 全局共享变量 */
        Map<String, Object> shared = new HashMap<>();
        shared.put("systemName", "CRM管理系统");
        shared.put("welcomeTip", "CRM管理系统");
        groupTemplate.setSharedVars(shared);

        /** 全局共享方法 */
        groupTemplate.registerFunctionPackage("shiro", new ShiroExt());
        groupTemplate.registerFunctionPackage("tool", new ToolUtils());
    }
}
