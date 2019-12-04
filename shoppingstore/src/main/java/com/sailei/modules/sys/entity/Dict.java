package com.sailei.modules.sys.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

/**
 * 基础字典实体类
 *
 * @Author admin
 * @date 2019-07-15 15:19:39
 */
@ApiModel(description = "字典")
public class Dict {

    /**
     * 字典id
     */
    @ApiModelProperty(value = "主键")
    private String dictId;
    /**
     * 所属字典类型的id
     */
    @ApiModelProperty(value = "字典编号")
    private String dictTypeId;
    /**
     * 字典编码
     */
    @ApiModelProperty(value = "字典编码")
    private String code;
    /**
     * 字典名称
     */
    @ApiModelProperty(value = "字典名称")
    private String name;
    /**
     * 排序
     */
    @ApiModelProperty(value = "排序")
    private BigDecimal sort;
    /**
     * 字典的描述
     */
    @ApiModelProperty(value = "字典的描述")
    private String deion;
    /**
     * 删除标记 0 默认 1 已删除
     */
    private Integer delFlag;
    public String getDictId() {
        return dictId;
    }

    public void setDictId(String dictId) {
        this.dictId = dictId;
    }

    public String getDictTypeId() {
        return dictTypeId;
    }

    public void setDictTypeId(String dictTypeId) {
        this.dictTypeId = dictTypeId;
    }
    @NotNull(message="编码不能为空")
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    @NotNull(message="名称不能为空")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getSort() {
        return sort;
    }

    public void setSort(BigDecimal sort) {
        this.sort = sort;
    }

    public String getDeion() {
        return deion;
    }

    public void setDeion(String deion) {
        this.deion = deion;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

}