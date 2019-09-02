package com.zzz.mapper;

import com.zzz.pojo.TbSellOrderInfo;
import com.zzz.pojo.TbSellOrderInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface TbSellOrderInfoMapper {
    long countByExample(TbSellOrderInfoExample example);

    int deleteByExample(TbSellOrderInfoExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbSellOrderInfo record);

    int insertSelective(TbSellOrderInfo record);

    List<TbSellOrderInfo> selectByExample(TbSellOrderInfoExample example);
    
    @Select("select a.id, oid, a.itemno, item_name as itemName, item_spec as itemSpec, weight, num from tb_sell_order_info a left join tb_item b on a.itemno = b.itemno where a.oid = #{arg0} order by id")
    List<TbSellOrderInfo> selectByOid(Long oid);
    
    @Select("select a.id, oid, a.itemno, item_name as itemName, item_spec as itemSpec, weight, num from tb_sell_order_info a left join tb_item b on a.itemno = b.itemno where a.oid = #{arg0} and a.itemno = #{arg1};")
    List<TbSellOrderInfo> selectByOidItemno(Long oid, String itemno);
    
    @Select("select a.id, oid, a.itemno, item_name as itemName, item_spec as itemSpec, weight, num from tb_sell_order_info a left join tb_item b on a.itemno = b.itemno where a.id = #{arg0};")
    TbSellOrderInfo selectById(Long id);
    
    @Select("SELECT itemno FROM tb_sell_order_info WHERE oid = #{arg0} ORDER BY id;")
    List<TbSellOrderInfo> selectItemnoByOid(Long oid);

    TbSellOrderInfo selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbSellOrderInfo record, @Param("example") TbSellOrderInfoExample example);

    int updateByExample(@Param("record") TbSellOrderInfo record, @Param("example") TbSellOrderInfoExample example);

    int updateByPrimaryKeySelective(TbSellOrderInfo record);

    int updateByPrimaryKey(TbSellOrderInfo record);
}