package com.zzz.service;

import com.zzz.pojo.TbUser;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o  
 * 2019-05-30
 */
public interface UserService {
    // 获取所有用户
    ResultUtil getUser(Integer page, Integer limit);

    // 用户名唯一性校验
    TbUser selectUserByUsername(String username);

    // 新增用户
    void insertUser(TbUser user);

    // 根据ID查询用户
    TbUser selectUserById(Long id);

    // 编辑用户
    void updateUser(TbUser user);
}
