package com.zzz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzz.mapper.TbMenuMapper;
import com.zzz.mapper.TbRoleMapper;
import com.zzz.mapper.TbRoleMenuMapper;
import com.zzz.pojo.TbMenu;
import com.zzz.pojo.TbMenuExample;
import com.zzz.pojo.TbRole;
import com.zzz.pojo.TbRoleExample;
import com.zzz.pojo.TbRoleExample.Criteria;
import com.zzz.pojo.TbRoleMenuExample;
import com.zzz.pojo.TbRoleMenuKey;
import com.zzz.service.RoleService;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o  
 * 2019-05-31
 */
@Service
public class RoleServiceImpl implements RoleService {
  
    @Autowired
    private TbRoleMapper roleMapper;
    
    @Autowired
    private TbRoleMenuMapper roleMenuMapper;
    
    @Autowired
    private TbMenuMapper menuMapper;
    
    @Override
    public List<TbRole> getAllRole() {
        TbRoleExample example = new TbRoleExample();
        List<TbRole> list = roleMapper.selectByExample(example);
        return list;
    }
    
    @Override
    public ResultUtil selectRoles(Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        PageInfo<TbRole> pageInfo = new PageInfo<TbRole>(getAllRole());
        ResultUtil resultUtil = new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }

    @Override
    public TbRole selectRoleByName(String roleName) {
        TbRoleExample example = new TbRoleExample();
        Criteria criteria = example.createCriteria();
        criteria.andRoleNameEqualTo(roleName);
        List<TbRole> role = roleMapper.selectByExample(example);
        if (role != null && role.size() > 0) {
            return role.get(0);
        }
        return null;
    }
    
    @Override
    public Object selectXtreeData(Long roleId) {
        TbMenuExample example = new TbMenuExample();
        List<TbMenu> allMenus = menuMapper.selectByExample(example);
        if (!roleId.equals(Long.valueOf("-1"))) {
            TbRoleMenuExample roleMenuexample = new TbRoleMenuExample();
            TbRoleMenuExample.Criteria criteria = roleMenuexample.createCriteria();
            criteria.andRoleIdEqualTo(roleId);
            List<TbRoleMenuKey> roleMenus = roleMenuMapper.selectByExample(roleMenuexample);
            for (TbMenu m : allMenus) {
                for (TbRoleMenuKey tbMenus : roleMenus) {
                    if (tbMenus.getMenuId() == m.getMenuId()) {
                        m.setChecked("true");
                    }
                }
            }
        }
        return allMenus;
    }

    @Override
    public void insertRole(TbRole role, String menu) {
        roleMapper.insert(role);
        if (menu != null && menu.length() != 0) {
            String[] result = menu.split(",");
            // 重新赋予权限
            if (result != null && result.length > 0) {
                for (int i = 0; i < result.length; i++) {
                    TbRoleMenuKey record = new TbRoleMenuKey();
                    record.setMenuId(Long.parseLong(result[i]));
                    record.setRoleId(role.getRoleId());
                    roleMenuMapper.insert(record);
                }
            }
        }
    }

    @Override
    public TbRole selectRoleById(Long roleId) {
        return roleMapper.selectByPrimaryKey(roleId);
    }

    @Override
    public void updateRole(TbRole role, String menu) {
		roleMapper.updateByPrimaryKey(role);
		// 先删除角色所有权限
		TbRoleMenuExample example = new TbRoleMenuExample();
		TbRoleMenuExample.Criteria criteria = example.createCriteria();
		criteria.andRoleIdEqualTo(role.getRoleId());
		roleMenuMapper.deleteByExample(example);
		// 维护角色-菜单表
		if (menu != null && menu.length() != 0) {
			String[] result = menu.split(",");
			// 重新赋予权限
			if (result != null && result.length > 0) {
				for (int i = 0; i < result.length; i++) {
				    TbRoleMenuKey record = new TbRoleMenuKey();
					record.setMenuId(Long.parseLong(result[i]));
					record.setRoleId(role.getRoleId());
					roleMenuMapper.insert(record);
				}
			}
		}
    }

    @Override
    public void deleteRoles(String rolesId) {
        String[] rids = rolesId.split(",");
        for (String id : rids) {
            roleMapper.deleteByPrimaryKey(Long.parseLong(id));
        }
    }
}
