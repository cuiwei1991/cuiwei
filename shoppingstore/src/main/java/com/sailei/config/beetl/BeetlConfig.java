package com.sailei.config.beetl;

import org.beetl.core.resource.ClasspathResourceLoader;
import org.beetl.ext.spring.BeetlGroupUtilConfiguration;
import org.beetl.ext.spring.BeetlSpringViewResolver;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

import java.util.Properties;

/**
 * 描述:beetl模板
 *
 * @Author sailei
 * @Date 2019/7/16 13:53
 **/
@Configuration
@DependsOn("globleBeanConfig")
public class BeetlConfig {

    @Value("${beetl.delimiter-statement-start}")
    private String DELIMITER_STATEMENT_START;
    @Value("${beetl.delimiter-statement-end}")
    private String DELIMITER_STATEMENT_END;
    @Value("${beetl.resource-tagroot}")
    private String RESOURCE_TAGROOT;
    @Value("${beetl.resource-tagsuffix}")
    private String RESOURCE_TAGSUFFIX;
    @Value("${beetl.resource-auto-check}")
    private String RESOURCE_AUTOCHECK;
    @Value("${spring.mvc.view.prefix}")
    private String prefix;

    /**
     * beetl的配置
     */
    @Bean(initMethod = "init")
    public BeetlConfiguration getBeetlGroupUtilConfiguration() {
        BeetlConfiguration BeetlConfiguration = new BeetlConfiguration();
        BeetlConfiguration.setResourceLoader(new ClasspathResourceLoader(BeetlConfig.class.getClassLoader(), prefix));
        BeetlConfiguration.setConfigProperties(getProperties());
        BeetlConfiguration.init();
        return BeetlConfiguration;
    }

    /**
     * beetl的视图解析器
     */
    @Bean
    public BeetlSpringViewResolver beetlViewResolver() {
        BeetlSpringViewResolver beetlSpringViewResolver = new BeetlSpringViewResolver();
        beetlSpringViewResolver.setConfig(getBeetlGroupUtilConfiguration());
        beetlSpringViewResolver.setContentType("text/html;charset=UTF-8");
        beetlSpringViewResolver.setOrder(0);
        return beetlSpringViewResolver;
    }

    /**
     * 描述:获取配置参数
     *
     * @Author sailei
     * @Date 2019/7/16 14:29
     */
    public Properties getProperties() {
        Properties properties = new Properties();
        properties.setProperty("DELIMITER_STATEMENT_START", DELIMITER_STATEMENT_START);
        properties.setProperty("DELIMITER_STATEMENT_END", DELIMITER_STATEMENT_END);
        properties.setProperty("RESOURCE.tagRoot", RESOURCE_TAGROOT);
        properties.setProperty("RESOURCE.tagSuffix", RESOURCE_TAGSUFFIX);
        properties.setProperty("RESOURCE.autoCheck", RESOURCE_AUTOCHECK);
        return properties;
    }
}
