package com.zzz.mapper;

import com.zzz.pojo.TbActualOrder;
import com.zzz.pojo.TbActualOrderExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface TbActualOrderMapper {
    long countByExample(TbActualOrderExample example);

    int deleteByExample(TbActualOrderExample example);

    int deleteByPrimaryKey(Long aid);

    int insert(TbActualOrder record);

    int insertSelective(TbActualOrder record);

    List<TbActualOrder> selectByExample(TbActualOrderExample example);

    TbActualOrder selectByPrimaryKey(Long aid);

    int updateByExampleSelective(@Param("record") TbActualOrder record, @Param("example") TbActualOrderExample example);

    int updateByExample(@Param("record") TbActualOrder record, @Param("example") TbActualOrderExample example);

    int updateByPrimaryKeySelective(TbActualOrder record);

    int updateByPrimaryKey(TbActualOrder record);

    int updateOrderTamt(Long aid);
    
    @Select("select ship_date, b.itemno, b.num, c.aprice, b.num * c.aprice as amt, '' as note from tb_ship_order a left join tb_ship_order_info b on a.sid = b.sid left join tb_actual_order_info c on b.itemno = c.itemno and aid = #{arg0} where a.sid in (${arg1}) union all select '', b.item_name, num, aprice, amt, '' from tb_actual_order_info a, tb_item b where a.itemno in ('999998', '999999') and a.itemno = b.itemno and aid = #{arg0}")
    List<Map<String, Object>> exportOrder(Long aid, String sids);
}