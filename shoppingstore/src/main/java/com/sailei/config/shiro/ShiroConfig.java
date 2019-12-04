package com.sailei.config.shiro;

import com.sailei.config.filter.BDSessionListener;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.cache.MemoryConstrainedCacheManager;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.SessionListener;
import org.apache.shiro.session.mgt.eis.MemorySessionDAO;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 描述:权限管理的配置
 *
 * @Author sailei
 * @Date 2019/7/16 15:55
 */
@Configuration
public class ShiroConfig {

    @Value("${server.session-timeout}")
    private int tomcatTimeout;

    /**
     * 安全管理器
     */
    @Bean
    public SecurityManager securityManager() {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(shiroDbRealm());
        securityManager.setRememberMeManager(null);
        securityManager.setCacheManager(cacheManager());
        securityManager.setSessionManager(sessionManager());
        return securityManager;
    }

    /**
     * 项目自定义的Realm
     */
    @Bean
    public ShiroDbRealm shiroDbRealm() {
        return new ShiroDbRealm();
    }

    /**
     * rememberMe管理器, cipherKey生成见{@code Base64Test.java}
     */
    @Bean
    public CookieRememberMeManager rememberMeManager(SimpleCookie rememberMeCookie) {
        CookieRememberMeManager manager = new CookieRememberMeManager();
        manager.setCipherKey(Base64.decode("Z3VucwAAAAAAAAAAAAAAAA=="));
        manager.setCookie(rememberMeCookie);
        return manager;
    }

    /**
     * 记住密码Cookie
     */
    @Bean
    public SimpleCookie rememberMeCookie() {
        SimpleCookie simpleCookie = new SimpleCookie("rememberMe");
        simpleCookie.setHttpOnly(true);
        simpleCookie.setMaxAge(7 * 24 * 60 * 60);//7天
        return simpleCookie;
    }

    @Bean
    public ShiroFilterFactoryBean shirFilter(SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        /** 必须设置 SecurityManager */
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        /**
         * 默认的登陆访问url
         */
        shiroFilterFactoryBean.setLoginUrl("/login");
        /**
         * 登陆成功后跳转的url
         */
        shiroFilterFactoryBean.setSuccessUrl("/");
        /**
         * 没有权限跳转的url
         */
        shiroFilterFactoryBean.setUnauthorizedUrl("/error");

        /**
         * 设置拦截器
         */
        Map<String, String> hashMap = new LinkedHashMap<>();

        /** 附带API接口-start 移植到多模块或cloud时可忽略 */
        hashMap.put("/api/**", "anon");
        hashMap.put("/doc.html", "anon");
        hashMap.put("/webjars/**", "anon");
        hashMap.put("/swagger-resources", "anon");
        hashMap.put("/v2/api-docs", "anon");
        hashMap.put("/com/cuiwei/**", "anon");
        /** 附带API接口-end */

        hashMap.put("/assets/**", "anon");
        hashMap.put("/login", "anon");
        hashMap.put("/errorSession", "anon");
        hashMap.put("/kaptcha", "anon");
        hashMap.put("/error", "anon");
        hashMap.put("/staticFiles/**", "anon");
        hashMap.put("/**", "user");

        shiroFilterFactoryBean.setFilterChainDefinitionMap(hashMap);
        return shiroFilterFactoryBean;
    }


    /**
     * 描述:缓存配置
     * shiro自带的MemoryConstrainedCacheManager作缓存
     * 但是只能用于本机，在集群时就无法使用，需要使用ehcache
     *  
     * @Author sailei
     * @Date 2019/9/25 13:08
     */
    @Bean(name = "cacheManager")
    public CacheManager cacheManager() {
        MemoryConstrainedCacheManager cacheManager = new MemoryConstrainedCacheManager();//使用内存缓存
        return cacheManager;
    }

    @Bean
    public SessionDAO sessionDAO() {
        return new MemorySessionDAO();
    }

    /**
     * shiro session的管理
     */
    @Bean
    public DefaultWebSessionManager sessionManager() {
        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
        sessionManager.setGlobalSessionTimeout(tomcatTimeout * 1000);
        sessionManager.setSessionDAO(sessionDAO());
        Collection<SessionListener> listeners = new ArrayList<SessionListener>();
        listeners.add(new BDSessionListener());
        sessionManager.setSessionListeners(listeners);
        return sessionManager;
    }

    /**
     * 启用shrio授权注解拦截方式，AOP式方法级权限检查
     */
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(DefaultWebSecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor =
                new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }

    /**
     * 开启Shiro的注解(如@RequiresRoles,@RequiresPermissions)
     */
    @Bean
    public DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        advisorAutoProxyCreator.setProxyTargetClass(true);
        return advisorAutoProxyCreator;
    }

}
