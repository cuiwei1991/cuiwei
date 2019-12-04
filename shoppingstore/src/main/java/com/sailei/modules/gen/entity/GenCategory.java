package com.sailei.modules.gen.entity;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

/**
 * 描述:代码生成类型实体类
 *
 * @Author sailei
 * @Date 2019/7/13 11:18
 */
@XmlRootElement(name = "category")
public class GenCategory extends DictInfo {

    private static final long serialVersionUID = 1L;
    /**
     * 模板列表
     */
    private List<String> template;
    /**
     * 子模板列表
     */
    private List<String> childTableTemplate;

    @XmlElement(name = "template")
    public List<String> getTemplate() {
        return this.template;
    }

    public void setTemplate(List<String> template) {
        this.template = template;
    }

    @XmlElementWrapper(name = "childTable")
    @XmlElement(name = "template")
    public List<String> getChildTableTemplate() {
        return this.childTableTemplate;
    }

    public void setChildTableTemplate(List<String> childTableTemplate) {
        this.childTableTemplate = childTableTemplate;
    }
}
