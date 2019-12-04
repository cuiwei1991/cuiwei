package com.sailei.modules.test.lefttree.service;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sailei.common.base.LayuiPage;
import com.sailei.common.utils.PageUtils;
import com.sailei.common.service.R;
import com.sailei.common.utils.IdUtils;
import com.sailei.common.base.ZTreeNode;
import org.springframework.transaction.annotation.Transactional;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.test.lefttree.entity.TestGoodClass;
import com.sailei.modules.test.lefttree.mapper.TestGoodClassMapper;
import com.sailei.modules.test.lefttree.entity.TestGoodInfo;
import com.sailei.modules.test.lefttree.mapper.TestGoodInfoMapper;

/**
 * 商品分类服务类
 *
 * @Author gaojin
 * @Date 2019-10-08 14:20:22
 */
@Service
public class TestGoodClassService{

	@Autowired
    private TestGoodClassMapper testGoodClassMapper;
     @Autowired
     private TestGoodInfoMapper testGoodInfoMapper;

    /**
     * 获取列表
     *
     * @Author gaojin
     * @Date 2019-10-08 14:20:22
     */
    public List<TestGoodClass> selectTestGoodClassTree() {
        return testGoodClassMapper.queryPage();
    }

    /**
     * 获取单个实体
     *
     * @Author gaojin
     * @Date 2019-10-08 14:20:22
     */
    public TestGoodClass getById(String id) {
        return testGoodClassMapper.getById(id);
    }

    /**
     * 获取树结构
     *
     * @Author gaojin
     * @Date 2019-10-08 14:20:22
     */
    public List<ZTreeNode> tree() {
        return testGoodClassMapper.tree();
    }

	/**
     * 根据条件查询列表
     *
     * @Author gaojin
     * @Date 2019-10-08 14:20:22
     */
    public R save(TestGoodClass testGoodClass) {
        /** 是否需要设置主键 */
        String id= IdUtils.getNumberId();
        testGoodClass.setId(id);
        /**设置parentIds和levels*/
        testGoodClass = testGoodClassSetParentId(testGoodClass);
        Date now = new Date();
        testGoodClass.setCreateDate(now);
        testGoodClass.setUpdateDate(now);
        testGoodClassMapper.save(testGoodClass);
        return R.ok();
    }

    /**
     * 设置父节点
     *
     * @Author gaojin
     * @Date 2019-10-08 14:20:22
     */
    private TestGoodClass testGoodClassSetParentId(TestGoodClass testGoodClass) {

        if (ToolUtils.isEmpty(testGoodClass.getParentId()) || "0".equals(testGoodClass.getParentId())) {
            testGoodClass.setParentId("0");
            testGoodClass.setParentName("顶级");
            testGoodClass.setParentIds("0,");
        } else {
            String pid = testGoodClass.getParentId();
            TestGoodClass parent = testGoodClassMapper.getById(pid);

            /** 如果编号和父编号一致会导致无限递归 */
            if (testGoodClass.getId() != null && testGoodClass.getId().equals(testGoodClass.getParentId())) {
                throw new RuntimeException("如果编号和父编号一致会导致无限递归");
            }

            testGoodClass.setParentIds(parent.getParentIds() + parent.getId() + ",");
        }
        return testGoodClass;
    }

    /**
     * 修改记录
     */
    public R updateById(TestGoodClass testGoodClass) {
        /**设置parentIds和levels*/
        testGoodClass = testGoodClassSetParentId(testGoodClass);
        testGoodClass.setUpdateDate(new Date());
        testGoodClassMapper.updateById(testGoodClass);
        return R.ok();
    }

    /**
     * 移除记录
     */
    @Transactional(rollbackFor = Exception.class)
    public R remove(String id) {
        testGoodClassMapper.remove(id);
        /** 删除所有子节点 */
        testGoodClassMapper.removeRelation(id);
        return R.ok();
    }

    /**
     * 根据条件查询列表
     *
     * @Author gaojin
     * @Date 2019-10-08 14:20:22
     */
    public LayuiPage queryPageSub(Map<String, Object> params) {

        /**处理分页参数*/
        PageUtils.changeForMap(params);
        /**获取分页列表*/
        List<TestGoodInfo> testGoodInfos = testGoodInfoMapper.queryPage(params);
        /**获取总条数*/
        long count = testGoodInfoMapper.queryCount(params);
        /**初始化LayuiPage*/
        LayuiPage page = new LayuiPage(testGoodInfos, count);

        return page;
    }

    /**
     * 保存子表数据
     *
     * @Author gaojin
     * @Date 2019-10-08 14:20:22
     */
    public R saveSub(TestGoodInfo testGoodInfo) {
        if(ToolUtils.isNotEmpty(testGoodInfo.getId())){
            /** 是否需要设置主键 */
            String id= IdUtils.getNumberId();
            testGoodInfo.setId(id);
            Date now = new Date();
            testGoodInfo.setCreateDate(now);
            testGoodInfo.setUpdateDate(now);
            testGoodInfoMapper.save(testGoodInfo);
        }else{
            testGoodInfo.setUpdateDate(new Date());
            testGoodInfoMapper.updateById(testGoodInfo);
        }

        return R.ok();
    }

    /**
     * 根据ID查询记录
     *
     * @param id 记录ID
     */
     public R getSubById(String id) {
        R result = R.ok();
        TestGoodInfo testGoodInfo = testGoodInfoMapper.getById(id);
        result.put("data", testGoodInfo);
        return result;
    }

    /**
     * 根据ID移除记录
     *
     * @param id 记录ID
     */
    public R subRemove(String id) {
        testGoodInfoMapper.remove(id);
        return R.ok();
    }


}