package com.sailei.modules.gen.entity;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.List;

/**
 * 描述:代码生成配置中心
 *
 * @Author sailei
 * @Date 2019/7/9 11:29
 */
@XmlRootElement(name = "config")
public class GenConfig implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 生成类型集合
     */
    private List<GenCategory> categoryList;
    /**
     * Java类型集合
     */
    private List<DictInfo> javaTypeList;
    /**
     * 查询类型集合
     */
    private List<DictInfo> queryTypeList;
    /**
     * 显示类型集合
     */
    private List<DictInfo> showTypeList;

    @XmlElementWrapper(name = "category")
    @XmlElement(name = "category")
    public List<GenCategory> getCategoryList() {
        return this.categoryList;
    }

    public void setCategoryList(List<GenCategory> categoryList) {
        this.categoryList = categoryList;
    }

    @XmlElementWrapper(name = "javaType")
    @XmlElement(name = "dict")
    public List<DictInfo> getJavaTypeList() {
        return this.javaTypeList;
    }

    public void setJavaTypeList(List<DictInfo> javaTypeList) {
        this.javaTypeList = javaTypeList;
    }

    @XmlElementWrapper(name = "queryType")
    @XmlElement(name = "dict")
    public List<DictInfo> getQueryTypeList() {
        return this.queryTypeList;
    }

    public void setQueryTypeList(List<DictInfo> queryTypeList) {
        this.queryTypeList = queryTypeList;
    }

    @XmlElementWrapper(name = "showType")
    @XmlElement(name = "dict")
    public List<DictInfo> getShowTypeList() {
        return this.showTypeList;
    }

    public void setShowTypeList(List<DictInfo> showTypeList) {
        this.showTypeList = showTypeList;
    }
}
