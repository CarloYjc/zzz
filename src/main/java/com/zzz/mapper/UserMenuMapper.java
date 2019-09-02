package com.zzz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.zzz.pojo.TbMenu;

/**
 * 
 * @author Car1o  
 * 2019-05-27
 */
public interface UserMenuMapper {
    @Select("SELECT m.menu_id AS menuId, m.title, m.icon, m.href, m.parent_id as parentId, m.perms FROM tb_role_menu r LEFT JOIN tb_menu m ON r.menu_id = m.menu_id WHERE r.role_id = #{arg0} ORDER BY sorting DESC;")
    List<TbMenu> getMenu(Long roleId);
}
