package com.sailei.config;

import com.github.xiaoymin.swaggerbootstrapui.annotations.EnableSwaggerBootstrapUI;
import io.swagger.annotations.ApiOperation;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * 描述:接口文档swagger配置中心  移植到多模块或cloud时可忽略
 *
 * @author sailei
 * @ApiModelProperty 对象属性 用在出入参数对象的字段上
 * @Api 协议集描述 用于controller类上
 * @ApiOperation 协议描述 用在controller的方法上
 * @ApiResponses Response集 用在controller的方法上
 * @ApiResponse Response 用在 @ApiResponses里边
 * @ApiImplicitParams 非对象参数集 用在controller的方法上
 * @ApiImplicitParam 非对象参数描述 用在@ApiImplicitParams的方法里边
 * @ApiModel 描述返回对象的意义 用在返回对象类上
 * @RequestMapping此注解的推荐配置
 * @date 2019/7/2 10:01
 **/
@Configuration
@EnableSwagger2
@EnableSwaggerBootstrapUI
public class SwaggerConfig {

    /**
     * 创建API应用
     * apiInfo() 增加API相关信息
     * 通过select()函数返回一个ApiSelectorBuilder实例,用来控制哪些接口暴露给Swagger来展现，
     * "com.sailei"采用指定扫描的包路径来定义指定要建立API的目录。
     * 描述:swagger2的配置文件，这里可以配置swagger2的一些基本的内容，比如扫描的包等等
     *
     * @author sailei
     * @date 2019/7/2 10:01
     **/
    @Bean
    public Docket api() {
        boolean flag = "true".equals(GlobalBean.SWAGGER_ACTIVE);
        if (flag) {
            return new Docket(DocumentationType.SWAGGER_2)
                    .apiInfo(apiInfo())
                    .groupName("全部接口")
                    .select() // 选择那些路径和api会生成document
                    .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
                    //.apis(RequestHandlerSelectors.any()) // 对所有api进行监控
                    //.paths(PathSelectors.any()) // 对所有路径进行监控
                    .build();
        } else {
            return new Docket(DocumentationType.SWAGGER_2)
                    .apiInfo(apiInfo())
                    .groupName("全部接口")
                    .select()
                    .apis(RequestHandlerSelectors.none()) // 不对任何api进行监控
                    .build();
        }

    }

    /**
     * api接口作者相关信息
     * 创建该API的基本信息（这些基本信息会展现在文档页面中）
     */
    private ApiInfo apiInfo() {
        Contact contact = new Contact("赛雷", "http://www.saileikeji.com", "dev@saileikeji.com");
        ApiInfo apiInfo = new ApiInfoBuilder()
                .title("赛雷API接口文档")
                .description("接口服务端")
                .termsOfServiceUrl("http://www.sailei.com/")
                .contact(contact)
                .version("1.0")
                .build();
        return apiInfo;
    }
}
