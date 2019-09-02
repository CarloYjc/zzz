package com.zzz.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zzz.pojo.TbActualOrderInfo;
import com.zzz.pojo.TbActualOrderInfoExample;

public interface TbActualOrderInfoMapper {
    long countByExample(TbActualOrderInfoExample example);

    int deleteByExample(TbActualOrderInfoExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbActualOrderInfo record);

    int insertSelective(TbActualOrderInfo record);

    List<TbActualOrderInfo> selectByExample(TbActualOrderInfoExample example);

    TbActualOrderInfo selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbActualOrderInfo record, @Param("example") TbActualOrderInfoExample example);

    int updateByExample(@Param("record") TbActualOrderInfo record, @Param("example") TbActualOrderInfoExample example);

    int updateByPrimaryKeySelective(TbActualOrderInfo record);

    int updateByPrimaryKey(TbActualOrderInfo record);

    @Select("select a.id, a.itemno, b.item_name as itemName, b.item_spec as itemSpec, b.weight, num, aprice, amt from tb_actual_order_info a left join tb_item b on a.itemno = b.itemno where aid = #{arg0}")
    List<Map<String, Object>> selectByAid(Long aid);
    
}