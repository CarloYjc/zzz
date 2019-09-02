package com.zzz.shiro;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zzz.mapper.TbUserMapper;
import com.zzz.mapper.UserMenuMapper;
import com.zzz.pojo.TbMenu;
import com.zzz.pojo.TbUser;
import com.zzz.pojo.TbUserExample;
import com.zzz.pojo.TbUserExample.Criteria;

/**
 * 
 * @author Car1o  
 * 2019-05-27
 */
public class CustRealm extends AuthorizingRealm {
    
    @Autowired
    private TbUserMapper tbUserMapper;

    @Autowired
    private UserMenuMapper userMenuMapper;
    
    private static Logger logger = LoggerFactory.getLogger(CustRealm.class);

    public CustRealm() {
        logger.info("CustRealm...");
    }

    @Override
    public String getName() {
        return "CustRealm";
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        TbUser user = (TbUser) principals.getPrimaryPrincipal();
        Long roleId = user.getRoleId();
        List<String> permsList = null;
        
        List<TbMenu> menuList = userMenuMapper.getMenu(roleId);
        permsList = new ArrayList<>(menuList.size());
        for (TbMenu menu : menuList) {
            if (menu.getPerms() != null && !"".equals(menu.getPerms())) {
                permsList.add(menu.getPerms());
            }
        }

        Set<String> permsSet = new HashSet<String>();
        for (String perms : permsList) {
            if (StringUtils.isBlank(perms)) {
                continue;
            }
            permsSet.addAll(Arrays.asList(perms.trim().split(",")));
        }

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setStringPermissions(permsSet);
        return info;
    }
    
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        String password = new String((char[]) token.getCredentials());
        
        // 查询用户信息
        TbUserExample example = new TbUserExample();
        Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        criteria.andStatusEqualTo("1");
        List<TbUser> user = tbUserMapper.selectByExample(example);
        
        // 账号不存在
        if (user == null || user.size() == 0) {
            throw new UnknownAccountException("账号不存在!");
        }
        password = new Md5Hash(password).toString();
        
        // 密码错误
        if (!password.equals(user.get(0).getPassword())) {
            throw new IncorrectCredentialsException("账号或密码不正确!");
        }

        // 账号未分配角色
        if (user.get(0).getRoleId() == null || user.get(0).getRoleId() == 0) {
            throw new UnknownAccountException("账号未分配角色!");
        }

        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user.get(0), password, getName());
        return info;
    }

}
