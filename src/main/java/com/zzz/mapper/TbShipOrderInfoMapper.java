package com.zzz.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zzz.pojo.TbShipOrderInfo;
import com.zzz.pojo.TbShipOrderInfoExample;

public interface TbShipOrderInfoMapper {
    long countByExample(TbShipOrderInfoExample example);

    int deleteByExample(TbShipOrderInfoExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbShipOrderInfo record);

    int insertSelective(TbShipOrderInfo record);

    List<TbShipOrderInfo> selectByExample(TbShipOrderInfoExample example);

    TbShipOrderInfo selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbShipOrderInfo record, @Param("example") TbShipOrderInfoExample example);

    int updateByExample(@Param("record") TbShipOrderInfo record, @Param("example") TbShipOrderInfoExample example);

    int updateByPrimaryKeySelective(TbShipOrderInfo record);

    int updateByPrimaryKey(TbShipOrderInfo record);

    @Select("SELECT '' sid, '2' ship_status, '共计' ship_date, ${arg1} FROM tb_ship_order a, tb_ship_order_info b WHERE a.sid = b.sid AND a.ship_status <> '0' AND a.oid = #{arg0} UNION ALL SELECT sid, ship_status, REPLACE(substring(ship_date, 3), '/', '') AS ship_date, ${arg1} FROM (SELECT a.sid, a.ship_status, a.ship_date, b.itemno, ifnull(c.num, 0) AS num FROM tb_ship_order a LEFT JOIN tb_sell_order_info b ON a.oid = b.oid LEFT JOIN tb_ship_order_info c ON b.itemno = c.itemno AND a.sid = c.sid WHERE a.oid = #{arg0} AND a.ship_status <> '0') A GROUP BY sid, ship_date ORDER BY sid;")
    List<Map<String, Object>> getShipInfo(Long oid, String s);
    
    @Select("SELECT a.itemno, b.item_name AS itemName, '' AS num FROM tb_sell_order_info a LEFT JOIN tb_item b ON a.itemno = b.itemno where oid = #{arg0}")
    List<Map<String, Object>> getAddShipInfo(Long oid);

    @Select("SELECT a.itemno, b.item_name AS itemName, b.item_spec AS itemSpec, b.weight, c.num, b.price, '' aprice, '' amt FROM tb_sell_order_info a LEFT JOIN tb_item b ON a.itemno = b.itemno LEFT JOIN (SELECT itemno, sum(num) AS num FROM tb_ship_order_info WHERE sid IN (${arg1}) GROUP BY itemno UNION ALL SELECT '999998', 1 UNION ALL SELECT '999999', 1) c ON a.itemno = c.itemno WHERE oid = #{arg0} AND c.num IS NOT NULL UNION ALL SELECT A.itemno, B.item_name AS itemName, B.item_spec AS itemSpec, B.weight, 1 AS num, B.price, '' aprice, '' amt FROM (SELECT '999998' AS itemno UNION ALL SELECT '999999') A LEFT JOIN tb_item B ON A.itemno = B.itemno")
	List<Map<String, Object>> getMergeInfo(Long oid, String sid);
}