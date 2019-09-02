package com.zzz.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzz.mapper.TbMenuMapper;
import com.zzz.mapper.TbRoleMenuMapper;
import com.zzz.mapper.UserMenuMapper;
import com.zzz.pojo.Menu;
import com.zzz.pojo.TbMenu;
import com.zzz.pojo.TbMenuExample;
import com.zzz.pojo.TbRoleMenuExample;
import com.zzz.pojo.TbRoleMenuKey;
import com.zzz.pojo.TbUser;
import com.zzz.service.MenuService;

/**
 * 
 * @author Car1o  
 * 2019-06-05
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private TbRoleMenuMapper roleMenuMapper;
    
    @Autowired
    private UserMenuMapper userMenuMapper;
    
    @Autowired
    private TbMenuMapper menuMapper;
    
    @Override
    public List<Menu> getMenu(TbUser user) {
        List<Menu> results = new ArrayList<>();
        Long roleId = user.getRoleId();
        TbRoleMenuExample example = new TbRoleMenuExample();
        TbRoleMenuExample.Criteria criteria = example.createCriteria();
        criteria.andRoleIdEqualTo(roleId);
        List<TbRoleMenuKey> list = roleMenuMapper.selectByExample(example);
        if (list != null && list.size() > 0) {
            List<TbMenu> menus = userMenuMapper.getMenu(roleId);
            for (int i = 0; i < menus.size(); i++) {
                if (menus.get(i).getParentId() == 0) {
                    Menu menu = new Menu();
                    menu.setTitle(menus.get(i).getTitle());
                    menu.setIcon(menus.get(i).getIcon());
                    menu.setHref(menus.get(i).getHref());
                    List<Menu> menus2 = new ArrayList<>();
                    for (int j = 0; j < menus.size(); j++) {
                        if (menus.get(j).getParentId() == menus.get(i).getMenuId()) {
                            Menu menu2 = new Menu();
                            menu2.setTitle(menus.get(j).getTitle());
                            menu2.setIcon(menus.get(j).getIcon());
                            menu2.setHref(menus.get(j).getHref());
                            menus2.add(menu2);
                        }
                    }
                    menu.setChildren(menus2);
                    results.add(menu);
                }
            }
        }
        return results;
    }

    @Override
    public List<TbMenu> getMenuList() {
        TbMenuExample example = new TbMenuExample();
        example.setOrderByClause("sorting DESC");
        List<TbMenu> data = menuMapper.selectByExample(example);
        return data;
    }
    
    @Override
    public TbMenu selectMenuById(Long menuId) {
        TbMenuExample example = new TbMenuExample();
        TbMenuExample.Criteria criteria = example.createCriteria();
        criteria.andMenuIdEqualTo(menuId);
        List<TbMenu> data = menuMapper.selectByExample(example);
        if (data != null && data.size() > 0) {
            return data.get(0);
        }
        return null;
    }

    @Override
    public void updateMenuSortingById(TbMenu menu) {
        TbMenu m = menuMapper.selectByPrimaryKey(menu.getMenuId());
        m.setSorting(menu.getSorting());
        menuMapper.updateByPrimaryKey(m);
    }

    @Override
    public List<TbMenu> selectSubmenuById(Long menuId) {
        TbMenuExample example = new TbMenuExample();
        TbMenuExample.Criteria criteria = example.createCriteria();
        criteria.andParentIdEqualTo(menuId);
        List<TbMenu> data = menuMapper.selectByExample(example);
        return data;
    }

    @Override
    public void deleteMenuById(Long menuId) {
        menuMapper.deleteByPrimaryKey(menuId);
    }
    
	@Override
	public List<TbMenu> checkMenuTitle(TbMenu menu) {
		TbMenuExample example = new TbMenuExample();
		TbMenuExample.Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(menu.getParentId());
		criteria.andTitleEqualTo(menu.getTitle());
		if(menu.getMenuId() != null) {
		    criteria.andMenuIdNotEqualTo(menu.getMenuId());
		}
		return menuMapper.selectByExample(example);
	}
	
	@Override
	public void updateMenu(TbMenu menu) {
		menuMapper.updateByPrimaryKey(menu);
	}

    @Override
    public void insertMenu(TbMenu menu) {
        menuMapper.insert(menu);
    }

}
