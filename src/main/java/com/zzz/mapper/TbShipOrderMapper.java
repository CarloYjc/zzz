package com.zzz.mapper;

import com.zzz.pojo.TbShipOrder;
import com.zzz.pojo.TbShipOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

public interface TbShipOrderMapper {
    long countByExample(TbShipOrderExample example);

    int deleteByExample(TbShipOrderExample example);

    int deleteByPrimaryKey(Long sid);

    int insert(TbShipOrder record);

    int insertSelective(TbShipOrder record);

    List<TbShipOrder> selectByExample(TbShipOrderExample example);

    TbShipOrder selectByPrimaryKey(Long sid);

    int updateByExampleSelective(@Param("record") TbShipOrder record, @Param("example") TbShipOrderExample example);

    int updateByExample(@Param("record") TbShipOrder record, @Param("example") TbShipOrderExample example);

    int updateByPrimaryKeySelective(TbShipOrder record);

    int updateByPrimaryKey(TbShipOrder record);

    @Update("UPDATE tb_ship_order SET ship_status = '2' WHERE sid IN (#{sid});")
    int updateShipOrderStatus(String sid);
}