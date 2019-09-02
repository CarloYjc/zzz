package com.zzz.mapper;

import com.zzz.pojo.TbSellOrder;
import com.zzz.pojo.TbSellOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbSellOrderMapper {
    long countByExample(TbSellOrderExample example);

    int deleteByExample(TbSellOrderExample example);

    int deleteByPrimaryKey(Long oid);

    int insert(TbSellOrder record);

    int insertSelective(TbSellOrder record);

    List<TbSellOrder> selectByExample(TbSellOrderExample example);

    TbSellOrder selectByPrimaryKey(Long oid);

    int updateByExampleSelective(@Param("record") TbSellOrder record, @Param("example") TbSellOrderExample example);

    int updateByExample(@Param("record") TbSellOrder record, @Param("example") TbSellOrderExample example);

    int updateByPrimaryKeySelective(TbSellOrder record);

    int updateByPrimaryKey(TbSellOrder record);
    
    int updateSellTamt(Long oid);
    
    int updateSellAtamt(Long oid);
}