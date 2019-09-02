package com.zzz.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zzz.annotation.SysLog;
import com.zzz.pojo.TbRole;
import com.zzz.service.RoleService;
import com.zzz.util.JsonUtils;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o  
 * 2019-05-31
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleServiceImpl;

    /**
     * @Desc 获取角色页面
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/getRoleList")
    @RequiresPermissions("sys:role:list")
    @ResponseBody
    public ResultUtil getRoleList(Integer page, Integer limit) {
        return roleServiceImpl.selectRoles(page, limit);
    }

    /**
     * @Desc 新增角色页面
     * @param req
     * @return
     */
    @RequestMapping("/addRole")
    @RequiresPermissions("sys:role:insert")
    public String addRole() {
        return "page/role/addRole";
    }

    /**
     * 得到角色权限树
     * @param roleId
     * @param roleName
     * @return
     */
    @RequestMapping(value = "/xtreedata", produces = { "text/json;charset=UTF-8" })
    @ResponseBody
    public String xtreeData(@RequestParam(value = "roleId", defaultValue = "-1") Long roleId) {
        return JsonUtils.objectToJson(roleServiceImpl.selectXtreeData(roleId));
    }

    /**
     * @Desc 角色唯一性检查
     * @param username
     * @return
     */
    @RequestMapping("/checkRoleName/{roleName}")
    @ResponseBody
    public ResultUtil checkUserName(@PathVariable("roleName") String roleName) {
        TbRole role = roleServiceImpl.selectRoleByName(roleName);
        if (role != null) {
            return new ResultUtil(500, "角色已存在!");
        }
        return new ResultUtil(0);
    }

    /**
     * @Desc 新增角色
     * @param role
     * @return
     */
    @SysLog(value = "新增角色")
    @RequestMapping("/insertRole")
    @RequiresPermissions("sys:role:insert")
    @ResponseBody
    public ResultUtil insertRole(TbRole role, String menu) {
        TbRole role2 = roleServiceImpl.selectRoleByName(role.getRoleName());
        if (role2 != null) {
            return new ResultUtil(500, "角色已存在,请重试！");
        }
        try {
            roleServiceImpl.insertRole(role, menu);
            return ResultUtil.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }

    /**
     * @Desc 编辑角色页面
     * @param req
     * @param id
     * @return
     */
    @RequestMapping("/editRole/{roleId}")
    @RequiresPermissions("sys:role:update")
    public String updateRole(HttpServletRequest req, @PathVariable("roleId") Long roleId) {
        TbRole role = roleServiceImpl.selectRoleById(roleId);
        req.setAttribute("role", role);
        return "page/role/editRole";
    }

    /**
     * @Desc 更新角色
     * @param role
     * @return
     */
    @SysLog(value = "更新角色")
    @RequestMapping("/updateRole")
    @RequiresPermissions("sys:role:update")
    @ResponseBody
    public ResultUtil updateRole(TbRole role, String menu) {
        try {
            roleServiceImpl.updateRole(role, menu);
            return ResultUtil.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }

    /**
     * 批量删除角色
     * @param rolesId
     * @return
     */
    @SysLog(value = "批量删除角色")
    @RequestMapping("/deleteRole/{rolesId}")
    @RequiresPermissions("sys:role:delete")
    @ResponseBody
    public ResultUtil deleteRoles(@PathVariable("rolesId") String rolesId) {
        ResultUtil resultUtil = new ResultUtil();
        try {
            roleServiceImpl.deleteRoles(rolesId);
            resultUtil.setCode(0);
        } catch (Exception e) {
            resultUtil.setCode(500);
            e.printStackTrace();
        }
        return resultUtil;
    }

}
