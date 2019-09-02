package com.zzz.mapper;

import com.zzz.pojo.TbRoleMenuExample;
import com.zzz.pojo.TbRoleMenuKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbRoleMenuMapper {
    long countByExample(TbRoleMenuExample example);

    int deleteByExample(TbRoleMenuExample example);

    int deleteByPrimaryKey(TbRoleMenuKey key);

    int insert(TbRoleMenuKey record);

    int insertSelective(TbRoleMenuKey record);

    List<TbRoleMenuKey> selectByExample(TbRoleMenuExample example);

    int updateByExampleSelective(@Param("record") TbRoleMenuKey record, @Param("example") TbRoleMenuExample example);

    int updateByExample(@Param("record") TbRoleMenuKey record, @Param("example") TbRoleMenuExample example);
}