package com.zzz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zzz.annotation.SysLog;
import com.zzz.pojo.Menu;
import com.zzz.pojo.TbMenu;
import com.zzz.pojo.TbUser;
import com.zzz.service.MenuService;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o  
 * 2019-06-05
 */
@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuServiceImpl;

    /**
     * @Desc 获取用户菜单
     * @param req
     * @param resp
     * @return
     */
    @RequestMapping(value = "/getMenu", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=utf-8")
    @ResponseBody
    public List<Menu> getMenu(HttpServletRequest req, HttpServletResponse resp) {
        TbUser user = (TbUser) SecurityUtils.getSubject().getPrincipal();
        List<Menu> menus = null;
        if (user != null) {
            // 得到用户菜单
            menus = menuServiceImpl.getMenu(user);
        }
        return menus;
    }

    /**
     * @Desc 获取菜单列表
     * @param menu
     * @return
     */
    @RequestMapping("/menuList")
    @RequiresPermissions("sys:menu:list")
    @ResponseBody
    public ResultUtil menuData() {
        List<TbMenu> list = menuServiceImpl.getMenuList();
        ResultUtil resultUtil = new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(list.size() + 0L);
        resultUtil.setData(list);
        return resultUtil;
    }

    @RequestMapping("/addMenu/{parentId}")
    @RequiresPermissions("sys:menu:insert")
    public String addMenu(@PathVariable("parentId") Long parentId, Model model) {
        if (parentId != null && parentId != 1) {
            TbMenu menu = new TbMenu();
            menu.setParentId(parentId);
            model.addAttribute("menu", menu);
            return "page/menu/addMenu";
        } else {
            model.addAttribute("msg", "不允许操作！");
            return "page/active";
        }
    }

    /**
     * @Desc 新增菜单
     * @param menu
     * @return
     */
    @SysLog("新增菜单")
    @RequestMapping("/insertMenu")
    @RequiresPermissions("sys:menu:update")
    @ResponseBody
    public ResultUtil insertMenu(TbMenu menu) {
        try {
            // 规定只能3级菜单
            TbMenu m1 = menuServiceImpl.selectMenuById(menu.getParentId());
            if (m1 != null && m1.getParentId() != 0) {
                TbMenu m2 = menuServiceImpl.selectMenuById(m1.getParentId());
                if (m2 != null && m2.getParentId() != 0) {
                    return ResultUtil.error("此菜单不允许添加子菜单！");
                }
            }
            // 同级菜单名不相同
            List<TbMenu> data = menuServiceImpl.checkMenuTitle(menu);
            if (data.size() > 0) {
                return ResultUtil.error("同级菜单名不能相同！");
            }
            menuServiceImpl.insertMenu(menu);
            return ResultUtil.ok("添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("添加失败！");
        }
    }

    @RequestMapping("/editMenu/{menuId}")
    @RequiresPermissions("sys:menu:update")
    public String EditMenu(@PathVariable("menuId") Long menuId, Model model) {
        if (menuId != null && menuId != 1) {
            TbMenu menu = menuServiceImpl.selectMenuById(menuId);
            model.addAttribute("menu", menu);
            return "page/menu/editMenu";
        } else if (menuId == 1) {
            model.addAttribute("msg", "不允许操作此菜单!");
            return "page/active";
        } else {
            model.addAttribute("msg", "不允许操作!");
            return "page/active";
        }
    }

    /**
     * @Desc 更新菜单
     * @param menu
     * @return
     */
    @SysLog("更新菜单")
    @RequestMapping("/updateMenu")
    @RequiresPermissions("sys:menu:update")
    @ResponseBody
    public ResultUtil updateMenu(TbMenu menu) {
        try {
            // 同级菜单名不相同
            List<TbMenu> data = menuServiceImpl.checkMenuTitle(menu);
            if (data.size() > 0) {
                return ResultUtil.error("同级菜单名不能相同！");
            }
            menuServiceImpl.updateMenu(menu);
            return ResultUtil.ok("修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("修改失败！");
        }
    }

    @RequestMapping("/updateMenuSort")
    @RequiresPermissions("sys:menu:update")
    @ResponseBody
    public ResultUtil updateMenuSortingById(Long menuId, String sorting) {
        TbMenu menu = new TbMenu();
        menu.setMenuId(menuId);
        try {
            Long.parseLong(sorting);
        } catch (NumberFormatException e) {
            return ResultUtil.error("修改失败只允许输入整数！");
        }
        menu.setSorting(Long.parseLong(sorting));
        menuServiceImpl.updateMenuSortingById(menu);
        return ResultUtil.ok();
    }

    @SysLog(value = "删除菜单")
    @RequestMapping("/deleteMenu/{menuId}")
    @RequiresPermissions("sys:menu:delete")
    @ResponseBody
    public ResultUtil delMenuById(@PathVariable("menuId") Long menuId) {
        try {
            if (menuId == 1) {
                return ResultUtil.error("此菜单不允许删除！");
            }
            List<TbMenu> data = menuServiceImpl.selectSubmenuById(menuId);
            if (data != null && data.size() > 0) {
                return ResultUtil.error("包含子菜单,不允许删除!");
            }
            menuServiceImpl.deleteMenuById(menuId);
            return ResultUtil.ok("删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("系统错误！");
        }
    }
}
