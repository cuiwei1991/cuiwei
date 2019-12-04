package com.sailei.modules.test.tree.service;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sailei.common.service.R;
import com.sailei.common.utils.IdUtils;
import com.sailei.common.base.ZTreeNode;
import org.springframework.transaction.annotation.Transactional;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.test.tree.entity.TestGenealogy;
import com.sailei.modules.test.tree.mapper.TestGenealogyMapper;

/**
 * 族谱表服务类
 *
 * @Author admin
 * @Date 2019-10-08 14:20:14
 */
@Service
public class TestGenealogyService{

	@Autowired
    private TestGenealogyMapper testGenealogyMapper;

    /**
     * 获取列表
     *
     * @Author admin
     * @Date 2019-10-08 14:20:14
     */
    public List<TestGenealogy> selectTestGenealogyTree() {
        return testGenealogyMapper.queryPage();
    }

    /**
     * 获取单个实体
     *
     * @Author admin
     * @Date 2019-10-08 14:20:14
     */
    public TestGenealogy getById(String id) {
        return testGenealogyMapper.getById(id);
    }

    /**
     * 获取树结构
     *
     * @Author admin
     * @Date 2019-10-08 14:20:14
     */
    public List<ZTreeNode> tree() {
        return testGenealogyMapper.tree();
    }

	/**
     * 根据条件查询列表
     *
     * @Author admin
     * @Date 2019-10-08 14:20:14
     */
    public R save(TestGenealogy testGenealogy) {
        /** 是否需要设置主键 */
        /**设置parentIds和levels*/
        testGenealogy = testGenealogySetParentId(testGenealogy);
        Date now = new Date();
        testGenealogy.setCreateDate(now);
        testGenealogy.setUpdateDate(now);
        testGenealogyMapper.save(testGenealogy);
        return R.ok();
    }

    /**
     * 设置父节点
     *
     * @Author admin
     * @Date 2019-10-08 14:20:14
     */
    private TestGenealogy testGenealogySetParentId(TestGenealogy testGenealogy) {

        if (ToolUtils.isEmpty(testGenealogy.getParentId()) || "0".equals(testGenealogy.getParentId())) {
            testGenealogy.setParentId("0");
            testGenealogy.setParentName("顶级");
            testGenealogy.setParentIds("0,");
        } else {
            String pid = testGenealogy.getParentId();
            TestGenealogy parent = testGenealogyMapper.getById(pid);

            /** 如果编号和父编号一致会导致无限递归 */
            if (testGenealogy.getId() != null && testGenealogy.getId().equals(testGenealogy.getParentId())) {
                throw new RuntimeException("如果编号和父编号一致会导致无限递归");
            }

            testGenealogy.setParentIds(parent.getParentIds() + parent.getId() + ",");
        }
        return testGenealogy;
    }

    /**
     * 修改记录
     */
    public R updateById(TestGenealogy testGenealogy) {
        /**设置parentIds和levels*/
        testGenealogy = testGenealogySetParentId(testGenealogy);
        testGenealogy.setUpdateDate(new Date());
        testGenealogyMapper.updateById(testGenealogy);
        return R.ok();
    }

    /**
     * 移除记录
     */
    @Transactional(rollbackFor = Exception.class)
    public R remove(String id) {
        testGenealogyMapper.remove(id);
        /** 删除所有子节点 */
        testGenealogyMapper.removeRelation(id);
        return R.ok();
    }

}