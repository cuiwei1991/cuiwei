package com.sailei.common.base;

import java.util.List;

/**
 * jquery ztree 插件的节点
 *
 * @Author sailei
 * @Date 2017年2月17日 下午8:25:14
 */
public class TreeviewNode{

    /**
     * 附加信息，一般用于存业务id
     */
    private String tags;

    /**
     * 父级id
     */
    private String parentId;

    /**
     * 节点名称
     */
    private String text;

    /**
     * 子节点
     */
    private List<TreeviewNode> nodes;

    public String getNodeId() {
        return tags;
    }

    public String getNodeParentId() {
        return parentId;
    }

    public void setChildrenNodes(List childrenNodes) {
        this.nodes = childrenNodes;
    }
}
