package com.sailei.modules.sys.service;

import com.sailei.common.base.ZTreeNode;
import com.sailei.common.rebbitmq.RabbitMqUtil;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.sys.entity.Area;
import com.sailei.modules.sys.mapper.AreaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AreaService {

    @Autowired
    private AreaMapper mapper;

    public List<Area> selectAreaTree() {
        return mapper.selectAreaTree();
    }

    public Area getAreaById(String areaId) {
        return mapper.getAreaById(areaId);
    }

    public List<ZTreeNode> tree() {
        return mapper.tree();
    }

    /** 
     * 描述:添加地区
     *  
     * @Author sailei
     * @Date 2019/8/20 13:19
     */
    @Transactional(rollbackFor = Exception.class)
    public void addArea(Area area) {
        /**设置parentIds和levels*/
        area = areaSetParentId(area);
        mapper.addArea(area);

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("添加地区", "1", area);
    }

    private Area areaSetParentId(Area area) {

        if (ToolUtils.isEmpty(area.getParentId()) || "0".equals(area.getParentId())) {
            area.setParentId("0");
            area.setParentName("顶级");
            area.setParentIds("0,");
        } else {
            String pid = area.getParentId();
            Area parent = mapper.getAreaById(pid);

            /** 如果编号和父编号一致会导致无限递归 */
            if (area.getId().equals(area.getParentId())) {
                throw new RuntimeException("如果编号和父编号一致会导致无限递归");
            }

            area.setParentIds(parent.getParentIds() + parent.getId() + ",");
        }
        return area;
    }
    
    /** 
     * 描述:修改地区
     *  
     * @Author sailei
     * @Date 2019/8/20 13:36
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateById(Area area) {
        /**设置parentIds和levels*/
        area = areaSetParentId(area);
        mapper.updateById(area);

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("修改地区", "1", area);
    }

    /** 
     * 描述:删除地区
     *  
     * @Author sailei
     * @Date 2019/8/20 13:36
     */
    @Transactional(rollbackFor = Exception.class)
    public void deleteArea(String id) {
        Area area = mapper.getAreaById(id);
        mapper.deleteArea(id);
        /** 删除所有子地区 */
        mapper.deleteByparentId(id);

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("删除地区", "1", area);
    }
}
