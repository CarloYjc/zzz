package com.zzz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzz.mapper.TbUserMapper;
import com.zzz.pojo.TbRole;
import com.zzz.pojo.TbUser;
import com.zzz.pojo.TbUserExample;
import com.zzz.service.RoleService;
import com.zzz.service.UserService;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o  
 * 2019-05-30
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private TbUserMapper userMapper;
    
    @Autowired
    private RoleService roleServiceImpl;
    
    @Override
    public ResultUtil getUser(Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        TbUserExample example = new TbUserExample();
        List<TbUser> list = userMapper.selectByExample(example);
        for (TbUser user : list) {
            List<TbRole> roles = roleServiceImpl.getAllRole();
            for (TbRole tbRole : roles) {
                if (tbRole.getRoleId() == user.getRoleId()) {
                    user.setRoleName(tbRole.getRoleName());
                }
            }
        }
        PageInfo<TbUser> pageInfo = new PageInfo<TbUser>(list);
        ResultUtil resultUtil = new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }
    
    @Override
    public TbUser selectUserByUsername(String username) {
        TbUserExample example = new TbUserExample();
        TbUserExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<TbUser> user = userMapper.selectByExample(example);
        if (user != null && user.size() > 0) {
            return user.get(0);
        }
        return null;
    }

    @Override
    public void insertUser(TbUser user) {
        // 对密码md5加密
        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        userMapper.insert(user);
    }

    @Override
    public TbUser selectUserById(Long id) {
        TbUser user = userMapper.selectByPrimaryKey(id);
        user.setPassword("");
        return user;
    }

    @Override
    public void updateUser(TbUser user) {
        TbUser user2 = userMapper.selectByPrimaryKey(user.getId());
        user.setPassword(user2.getPassword());
        userMapper.updateByPrimaryKey(user);
    }
    
}
