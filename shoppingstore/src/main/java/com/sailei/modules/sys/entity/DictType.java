package com.sailei.modules.sys.entity;

import javax.validation.constraints.NotNull;
import java.util.*;
import java.math.BigDecimal;
import java.util.List;

/**
 * 字典类型表实体类
 *
 * @Author admin
 * @date 2019-07-15 15:19:39
 */
public class DictType{

    /**
     * 字典类型id
     */
    private String dictTypeId;
    /**
     * 字典类型编码
     */
    private String code;
    /**
     * 字典类型名称
     */
    private String name;
    /**
     * 字典描述
     */
    private String deion;
    /**
     * 排序
     */
    private BigDecimal sort;
    /**
     * 删除标记 0 默认 1 已删除
     */
    private Integer delFlag;
    /**
     * 子表列表
     */
	private List<Dict> dictList = new ArrayList<>();
	/**
     * 子表列表数据接收Map
     */
	private List<Map<String,Object>> dictMapList = new ArrayList<>();
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

    public String getDeion() {
        return deion;
    }

    public void setDeion(String deion) {
        this.deion = deion;
    }

    public BigDecimal getSort() {
        return sort;
    }

    public void setSort(BigDecimal sort) {
        this.sort = sort;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

	public List<Dict> getDictList() {
		return dictList;
	}

	public void setDictList(List<Dict> dictList) {
		this.dictList = dictList;
	}

	public List<Map<String, Object>> getDictMapList() {
		return dictMapList;
	}

	public void setDictMapList(List<Map<String, Object>>dictMapList) {
		this.dictMapList = dictMapList;
	}
}