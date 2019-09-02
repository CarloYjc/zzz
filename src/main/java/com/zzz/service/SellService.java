package com.zzz.service;

import com.zzz.pojo.SellSearch;
import com.zzz.pojo.TbActualOrder;
import com.zzz.pojo.TbActualOrderInfo;
import com.zzz.pojo.TbSellOrder;
import com.zzz.pojo.TbSellOrderInfo;
import com.zzz.pojo.TbShipOrder;
import com.zzz.pojo.TbShipOrderInfo;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o 2019-06-06
 */
public interface SellService {
	// 根据条件获取订单信息
	ResultUtil getSellList(Integer page, Integer limit, SellSearch search);

	// 新增销售订单getMergeInfo
	void insertSell(TbSellOrder sell);

	// 根据订单号查询订单信息
	TbSellOrder selectSellById(Long oid);

	// 编辑销售订单
	void updateSell(TbSellOrder sell);

	// 根据订单号查询订单明细
	ResultUtil getSellInfoList(Integer page, Integer limit, Long oid);

	// 新增订单明细
	void inserInfo(TbSellOrderInfo info);

	// 订单货号唯一性校验
	TbSellOrderInfo selectSellOrderInfoByCondition(TbSellOrderInfo info);

	// 编辑订单没明细
	void updateInfo(TbSellOrderInfo info);

	// 根据id查询订单明细信息
	TbSellOrderInfo selectSellInfoById(Long id);

	// 根据id删除订单明细信息
	void deleteInfoById(Long id);

	// 根据订单号查询出货明细
	ResultUtil getShipInfoList(Long oid);

	// 根据id查询出货订单信息
	TbShipOrder selectShipInfoById(Long sid);

	// 编辑出货订单
	void updateShip(TbShipOrder ship);

	// 根据订单号新增出货明细
	ResultUtil getAddShipInfo(Integer page, Integer limit, Long oid);

	// 新增出货订单头
	void insertShip(TbShipOrder order);

	// 新增出货明细
	void insertShipInfo(TbShipOrderInfo shipInfo);

	// 根据条件查询合并订单信息
	ResultUtil getMergeInfo(Integer page, Integer limit, Long oid, String sid);

	// 修改合并订单的状态
	void updateShipStatus(String sid);

	// 新增订单
	void insertOrder(TbActualOrder order);

	// 新增订单明细
	void insertOrderInfo(TbActualOrderInfo info);

	// 修改结算订单金额
	void updateOrderTamt(Long aid);

    // 修改销售订单金额
    void updateSellTamt(Long oid);
}
