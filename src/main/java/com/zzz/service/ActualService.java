package com.zzz.service;

import java.util.List;
import java.util.Map;

import com.zzz.pojo.SellSearch;
import com.zzz.pojo.TbActualOrder;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o  
 * 2019-07-23
 */
public interface ActualService {
    // 根据条件获取订单信息
    ResultUtil getOrderList(Integer page, Integer limit, SellSearch search);

    // 根据ID获取订单明细
    ResultUtil getOrderInfoList(Integer page, Integer limit, Long aid);
    
    // 根据订单号查询订单信息
    TbActualOrder selectOrderById(Long oid);

    // 编辑结算订单
    void updateOrder(TbActualOrder order);

    // 导出对账单
    List<Map<String, Object>> exportOrder(Long aid, String sids);

    // 修改销售订单实收金额
    void updateSellAtamt(Long oid);
}
