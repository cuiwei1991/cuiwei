package com.sailei.modules.test.lefttree.service;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sailei.common.base.LayuiPage;
import com.sailei.common.service.R;
import com.sailei.common.utils.IdUtils;
import com.sailei.common.utils.PageUtils;
import com.sailei.modules.test.lefttree.entity.TestGoodInfo;
import com.sailei.modules.test.lefttree.mapper.TestGoodInfoMapper;

/**
 * 商品表服务类
 *
 * @Author gaojin
 * @date 2019-10-08 14:20:22
 */
@Service
public class TestGoodInfoService{

	 @Autowired
     private TestGoodInfoMapper testGoodInfoMapper;

	/**
     * 根据条件查询列表
     *
     * @Author gaojin
     * @date 2019-10-08 14:20:22
     */
    public LayuiPage queryPage(Map<String, Object> params) {

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
     * 根据ID查询记录
     *
     * @param id 记录ID
     */
     public R getById(String id) {
        TestGoodInfo testGoodInfo = testGoodInfoMapper.getById(id);
        return R.ok().put("data", testGoodInfo);
    }

    /**
     * 保存记录
     *
     * @param testGoodInfo 保存的对象
     */
    public R saveOrupdate(TestGoodInfo testGoodInfo) {

        if(testGoodInfo.getId() != null && !"".equals(testGoodInfo.getId())){
			testGoodInfo.setUpdateDate(new Date());
            testGoodInfoMapper.updateById(testGoodInfo);
        }else{
            String id= IdUtils.getNumberId();
            testGoodInfo.setId(id);
			testGoodInfo.setCreateDate(new Date());
            testGoodInfoMapper.save(testGoodInfo);
        }
        return R.ok();
    }

    /**
     * 根据ID移除记录
     *
     * @param id 记录ID
     */
    public R remove(String id) {
        testGoodInfoMapper.remove(id);
        return R.ok();
    }

}