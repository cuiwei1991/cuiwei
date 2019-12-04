package com.sailei.modules.test.news.service;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sailei.common.base.LayuiPage;
import com.sailei.common.service.R;
import com.sailei.common.utils.IdUtils;
import com.sailei.common.utils.PageUtils;
import com.sailei.modules.test.news.entity.TestNews;
import com.sailei.modules.test.news.mapper.TestNewsMapper;

/**
 * 新闻表服务类
 *
 * @Author 高进
 * @Date 2019-10-08 14:21:02
 */
@Service
public class TestNewsService{

	 @Autowired
     private TestNewsMapper testNewsMapper;

	/**
     * 根据条件查询列表
     *
     * @Author 高进
     * @Date 2019-10-08 14:21:02
     */
    public LayuiPage queryPage(Map<String, Object> params) {

        /**处理分页参数*/
        PageUtils.changeForMap(params);
        /**获取分页列表*/
        List<TestNews> testNewss = testNewsMapper.queryPage(params);
        /**获取总条数*/
        long count = testNewsMapper.queryCount(params);
        /**初始化LayuiPage*/
        LayuiPage page = new LayuiPage(testNewss, count);

        return page;
    }

    /**
     * 根据ID查询记录
     *
     * @param id 记录ID
     */
     public R getById(String id) {
        TestNews testNews = testNewsMapper.getById(id);
        return R.ok().put("data", testNews);
    }

    /**
     * 保存记录
     *
     * @param testNews 保存的对象
     */
    public R saveOrupdate(TestNews testNews) {

        if(testNews.getId() != null && !"".equals(testNews.getId())){
			testNews.setUpdateDate(new Date());
            testNewsMapper.updateById(testNews);
        }else{
            String id= IdUtils.getNumberId();
            testNews.setId(id);
			testNews.setCreateDate(new Date());
            testNewsMapper.save(testNews);
        }
        return R.ok();
    }

    /**
     * 根据ID移除记录
     *
     * @param id 记录ID
     */
    public R remove(String id) {
        testNewsMapper.remove(id);
        return R.ok();
    }

}