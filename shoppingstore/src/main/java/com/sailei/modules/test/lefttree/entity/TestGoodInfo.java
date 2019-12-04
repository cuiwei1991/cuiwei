package com.sailei.modules.test.lefttree.entity;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 商品表实体类
 *
 * @Author gaojin
 * @date 2019-10-08 14:20:22
 */
public class TestGoodInfo{

    /**
     * ID
     */
    private String id;
    /**
     * 商品编码
     */
    private String goodCode;
    /**
     * 商品名称
     */
    private String title;
    /**
     * 商品描述
     */
    private String deion;
    /**
     * 商品图片
     */
    private String image;
    /**
     * 是否热门
     */
    private Integer isRecommend;
    /**
     * 价格
     */
    private BigDecimal price;
    /**
     * 分类
     */
    private String classId;
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
    private String classIdName;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGoodCode() {
        return goodCode;
    }

    public void setGoodCode(String goodCode) {
        this.goodCode = goodCode;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDeion() {
        return deion;
    }

    public void setDeion(String deion) {
        this.deion = deion;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(Integer isRecommend) {
        this.isRecommend = isRecommend;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
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

    public String getClassIdName() {
        return classIdName;
    }

    public void setClassIdName(String classIdName) {
        this.classIdName = classIdName;
    }
}