package com.sailei.modules.api;

import com.sailei.common.service.ServiceResult;
import com.sailei.common.utils.AuthSecretUtil;
import com.sailei.common.utils.Md5Util;
import com.sailei.modules.sys.entity.Dict;
import com.sailei.modules.sys.utils.DictUtils;
import com.xiaoleilu.hutool.util.NumberUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 描述:测试控制类 移植到多模块或cloud时可忽略
 *
 * @author sailei
 * @date 2019/7/2 13:55
 **/
@RestController
@RequestMapping("/api")
@Api(value = "/api", tags = {"测试模块"}, description = "测试接口")
public class TestController {

    /**
     * 记录日志
     */
    private static final Logger logger = LoggerFactory.getLogger(TestController.class);

    /**
     * 描述:测试数据接口
     *
     * @author sailei
     * @date 2019/7/2 13:55
     **/
    @ResponseBody
    @PostMapping(value = "/list")
    @ApiOperation(value = "测试数据接口", notes = "根据请求参数获取相应的测试数据")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", name = "name", value = "名称", dataType = "String"),
            @ApiImplicitParam(paramType = "query", name = "requestFrom", value = "请求来源", required = true, dataType = "String"),
            @ApiImplicitParam(paramType = "query", name = "pageNo", value = "页码", required = true, dataType = "String"),
            @ApiImplicitParam(paramType = "query", name = "pageSize", value = "每页数量", required = true, dataType = "String"),
            @ApiImplicitParam(paramType = "query", name = "sign", value = "签名", required = true, dataType = "String")
    })
    public ServiceResult<Dict> list(String name, String requestFrom, String pageNo, String pageSize, String sign) {
        /** 定义返回结果 */
        ServiceResult result = new ServiceResult();

        /** 校验参数 */
        if (!NumberUtil.isNumber(pageNo) || !NumberUtil.isNumber(pageSize) || !NumberUtil.isNumber(requestFrom)) {
            result.setCode(ServiceResult.PARAMETER_ERROR);
            result.setMessage("参数错误!");
            return result;
        }

        /** 校验签名 */
        String key = AuthSecretUtil.getAuthSecretKey(requestFrom);
        String signStr = requestFrom + pageNo + pageSize + key;
        String signBg = Md5Util.getMd5Upper(signStr);
        if (!signBg.equals(sign)) {
            result.setCode(ServiceResult.SIGN_ERROR);
            result.setMessage("签名验证失败!");
            logger.warn("【测试获取数据】签名验证失败,签名拼接参数signStr：" + signStr + "传参sign：" + sign);
            return result;
        }

        /** 从数据库获取数据 */
        Map<String, Object> params = new HashMap<>();
        params.put("name", name);
        params.put("pageNo", pageNo);
        params.put("pageSize", pageSize);
        List<Dict> list = DictUtils.getDictList("DEL_FLAG");
        result.setCode(ServiceResult.STATUS_SUCCEED);
        result.setMessage("获取成功!");
        result.setResult(list);

        return result;
    }

}
