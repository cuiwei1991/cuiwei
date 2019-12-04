package com.sailei.config.shiro;

import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.sys.entity.Menu;
import com.sailei.modules.sys.entity.User;
import com.sailei.modules.sys.utils.MenuUtils;
import com.sailei.modules.sys.utils.RoleUtils;
import com.sailei.modules.sys.utils.UserUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 描述:权限信息验证
 *
 * @Author sailei
 * @Date 2019/7/16 15:53
 */
public class ShiroDbRealm extends AuthorizingRealm {

    /**
     * 登录认证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
            throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        /** 根据用户账号查询用户信息 */
        User user = UserUtils.getByAccount(token.getUsername());

        if(user.getStatus() != null && user.getStatus() != 1){
            throw new UnknownAccountException("账号已冻结,暂时不能登录!");
        }

        String password = new String((char[]) token.getCredentials());
        password = ShiroKit.md5(password, user.getSalt());
        if(!password.equals(user.getPassword())){
            throw new UnknownAccountException("账号或密码不正确!");
        }
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, password, new Md5Hash(user.getSalt()), getName());
        return info;
    }

    /**
     * 权限认证
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        Set<String> permissionSet = new HashSet<>();
        /**
         * 获取当前用户的角色
         */
        String roles = RoleUtils.getUserRoles();
        /**
         * 根据角色获取其权限内的菜单
         */
        List<Menu> menus = MenuUtils.selectMenuList(roles, null);

        /** 将菜单中的权限标识添加到权限列表 */
        if(ToolUtils.isNotEmpty(menus)){
            for (Menu menu : menus) {
                String permission = menu.getPermission();
                if (ToolUtils.isNotEmpty(permission)) {
                    /**
                     * 添加到权限列表
                     */
                    permissionSet.add(permission);
                }
            }
        }

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addStringPermissions(permissionSet);
        return info;
    }

    /**
     * 设置认证加密方式
     */
    @Override
    public void setCredentialsMatcher(CredentialsMatcher credentialsMatcher) {
        HashedCredentialsMatcher md5CredentialsMatcher = new HashedCredentialsMatcher();
        md5CredentialsMatcher.setHashAlgorithmName(ShiroKit.hashAlgorithmName);
        md5CredentialsMatcher.setHashIterations(ShiroKit.hashIterations);
        super.setCredentialsMatcher(md5CredentialsMatcher);
    }
}
