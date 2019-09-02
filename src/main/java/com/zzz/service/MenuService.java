package com.zzz.service;

import java.util.List;

import com.zzz.pojo.Menu;
import com.zzz.pojo.TbMenu;
import com.zzz.pojo.TbUser;

/**
 * 
 * @author Car1o  
 * 2019-06-05
 */
public interface MenuService {
    // 根据用户获取菜单
    List<Menu> getMenu(TbUser user);

    // 获取菜单列表
    List<TbMenu> getMenuList();

    // 根据ID查询菜单信息
    TbMenu selectMenuById(Long menuId);
    
    // 更新菜单排序
    void updateMenuSortingById(TbMenu menu);
    
    // 根据ID查询子菜单信息
    List<TbMenu> selectSubmenuById(Long menuId);

    // 根据ID删除菜单
    void deleteMenuById(Long menuId);

    // 检查同级菜单名是否相同
	List<TbMenu> checkMenuTitle(TbMenu menu);
	
    // 新增菜单
    void insertMenu(TbMenu menu);

    //编辑菜单
	void updateMenu(TbMenu menu);
}
