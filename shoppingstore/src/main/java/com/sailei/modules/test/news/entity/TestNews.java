package com.sailei.modules.test.news.entity;

import java.util.Date;

/**
 * 新闻表实体类
 *
 * @Author 高进
 * @Date 2019-10-08 14:21:02
 */
public class TestNews{

    /**
     * sdsdsd
     */
    private Integer type;
    /**
     * ID
     */
    private String id;
    /**
     * 创建时间
     */
    private Date createDate;
    /**
     * 修改时间
     */
    private Date updateDate;
    /**
     * 删除标记
     */
    private Integer delFlag;
    /**
     * 标题7
     */
    private String title;
    /**
     * 内容3
     */
    private String content;
    /**
     * 发布时间
     */
    private String publicTime;

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPublicTime() {
        return publicTime;
    }

    public void setPublicTime(String publicTime) {
        this.publicTime = publicTime;
    }

}