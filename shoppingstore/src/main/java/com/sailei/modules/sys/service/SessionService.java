package com.sailei.modules.sys.service;

import com.sailei.common.base.LayuiPage;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.sys.entity.User;
import com.sailei.modules.sys.entity.UserOnline;
import com.xiaoleilu.hutool.date.DateUnit;
import com.xiaoleilu.hutool.date.DateUtil;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * 描述:Session服务类
 *
 * @author sailei
 * @date 2019/9/25 7:47
 **/
@Service
public class SessionService {

    @Autowired
    private SessionDAO sessionDAO;
    
    /** 
     * 描述:获取在线用户列表
     *  
     * @Author sailei
     * @Date 2019/9/25 16:41
     */
    public List<UserOnline> list() {
        List<UserOnline> list = new ArrayList<>();
        Collection<Session> sessions = sessionDAO.getActiveSessions();
        for (Session session : sessions) {
            UserOnline userOnline = new UserOnline();
            if (session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY) == null) {
                continue;
            } else {
                SimplePrincipalCollection principalCollection = (SimplePrincipalCollection) session
                        .getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
                User user = (User) principalCollection.getPrimaryPrincipal();
                userOnline.setUsername(user.getAccount());
            }
            userOnline.setId((String) session.getId());
            userOnline.setHost(session.getHost());
            userOnline.setStartTimestamp(session.getStartTimestamp());
            userOnline.setLastAccessTime(session.getLastAccessTime());
            Long time = DateUtil.between(new Date(), session.getLastAccessTime(), DateUnit.MS);
            time = session.getTimeout() - time;
            userOnline.setTimeout(time);
            long minute = (time )/(60*1000);
            long second = (time - minute*60*1000)/1000;
            userOnline.setTimeoutStr(minute + "分" + second + "秒");
            list.add(userOnline);
        }
        return list;
    }


    /** 
     * 描述:强制下线
     *  
     * @Author sailei
     * @Date 2019/9/25 16:40
     */
    public boolean forceLogout(String sessionId) {
        Session session = sessionDAO.readSession(sessionId);
        session.setTimeout(0);
        return true;
    }
    
    /** 
     * 描述:获取在线用户数据列表
     *  
     * @Author sailei
     * @Date 2019/9/25 15:55
     */
    public LayuiPage queryPage(Map<String, Object> params) {
        List<UserOnline> listAll = list();
        List<UserOnline> list = new ArrayList<>();
        for(UserOnline user : listAll){
            String username = (String)params.get("username");
            /** 排除不符合要求的数据 */
            if(ToolUtils.isNotEmpty(username) && !username.equals(user.getUsername())){
                continue;
            }
            /** 超时时间为0的排除 */
            if(user.getTimeout() != null && user.getTimeout().longValue() <= 0){
                continue;
            }
            list.add(user);
        }

        /**初始化LayuiPage*/
        LayuiPage page = new LayuiPage(list, list.size());

        return page;
    }
    
    /** 
     * 描述:强制用户下线
     *  
     * @Author sailei
     * @Date 2019/9/25 17:00
     */
    public boolean forceLogoutUser(String userId) {
        Collection<Session> sessions = sessionDAO.getActiveSessions();
        for (Session session : sessions) {
            SimplePrincipalCollection principalCollection;
            if (session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY) == null) {
                continue;
            } else {
                principalCollection = (SimplePrincipalCollection) session
                        .getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
                User user = (User) principalCollection.getPrimaryPrincipal();
                if(userId.equals(user.getUserId())){
                    session.setTimeout(0);
                    return true;
                }
            }
        }
        return false;
    }
}
