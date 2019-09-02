package com.zzz.service;

import java.util.List;

import com.zzz.pojo.TbRole;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o  
 * 2019-05-31
 */
public interface RoleService {

    // 获取所有角色
    List<TbRole> getAllRole();

    // 获取角色
    ResultUtil selectRoles(Integer page, Integer limit); 
    
    // 角色名唯一性校验
    TbRole selectRoleByName(String roleName);

    // 新增角色
    void insertRole(TbRole role, String menu);

    // 根据ID查询角色
    TbRole selectRoleById(Long roleId);

    // 编辑角色
    void updateRole(TbRole role, String menu);

    // 删除角色
    void deleteRoles(String rolesId);
    
    // 查询角色菜单
    Object selectXtreeData(Long roleId);
}
