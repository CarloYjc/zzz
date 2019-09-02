package com.zzz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zzz.annotation.SysLog;
import com.zzz.pojo.TbRole;
import com.zzz.pojo.TbUser;
import com.zzz.service.RoleService;
import com.zzz.service.UserService;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o  
 * 2019-05-30
 */

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userServiceImpl;

    @Autowired
    private RoleService roleServiceImpl;

    /**
     * @Desc 获取用户页面
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/getUserList")
    @RequiresPermissions("sys:user:list")
    @ResponseBody
    public ResultUtil getUserList(Integer page, Integer limit) {
        ResultUtil users = userServiceImpl.getUser(page, limit);
        return users;
    }

    /**
     * @Desc 新增用户页面
     * @param req
     * @return
     */
    @RequestMapping("/addUser")
    @RequiresPermissions("sys:user:insert")
    public String addUser(HttpServletRequest req) {
        List<TbRole> roles = roleServiceImpl.getAllRole();
        req.setAttribute("roles", roles);
        return "page/user/addUser";
    }

    /**
     * @Desc 用户名唯一性检查
     * @param username
     * @return
     */
    @RequestMapping("/checkUserName/{username}")
    @ResponseBody
    public ResultUtil checkUserName(@PathVariable("username") String username) {
        TbUser user = userServiceImpl.selectUserByUsername(username);
        if (user != null) {
            return new ResultUtil(500, "用户名已存在!");
        }
        return new ResultUtil(0);
    }

    /**
     * @Desc 新增用户
     * @param user
     * @return
     */
    @SysLog(value = "新增用户")
    @RequestMapping("/insertUser")
    @RequiresPermissions("sys:user:insert")
    @ResponseBody
    public ResultUtil insertUser(TbUser user) {
        // 防止浏览器提交
        TbUser user2 = userServiceImpl.selectUserByUsername(user.getUsername());
        if (user2 != null) {
            return new ResultUtil(500, "用户名已存在,请重试！");
        }
        userServiceImpl.insertUser(user);
        return ResultUtil.ok();
    }

    /**
     * @Desc 编辑用户页面
     * @param req
     * @param id
     * @return
     */
    @RequestMapping("/editUser/{id}")
    @RequiresPermissions("sys:user:update")
    public String updateUser(HttpServletRequest req, @PathVariable("id") Long id) {
        TbUser user = userServiceImpl.selectUserById(id);
        List<TbRole> roles = roleServiceImpl.getAllRole();
        req.setAttribute("user", user);
        req.setAttribute("roles", roles);
        return "page/user/editUser";
    }

    /**
     * @Desc 更新用户
     * @param user
     * @return
     */
    @SysLog(value = "更新用户")
    @RequestMapping("/updateUser")
    @RequiresPermissions("sys:user:update")
    @ResponseBody
    public ResultUtil updateUser(TbUser user) {
        try {
            userServiceImpl.updateUser(user);
            return ResultUtil.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }

}
