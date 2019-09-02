package com.zzz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzz.mapper.TbActualOrderInfoMapper;
import com.zzz.mapper.TbActualOrderMapper;
import com.zzz.mapper.TbSellOrderInfoMapper;
import com.zzz.mapper.TbSellOrderMapper;
import com.zzz.mapper.TbShipOrderInfoMapper;
import com.zzz.mapper.TbShipOrderMapper;
import com.zzz.pojo.SellSearch;
import com.zzz.pojo.TbActualOrder;
import com.zzz.pojo.TbActualOrderInfo;
import com.zzz.pojo.TbSellOrder;
import com.zzz.pojo.TbSellOrderExample;
import com.zzz.pojo.TbSellOrderExample.Criteria;
import com.zzz.pojo.TbSellOrderInfo;
import com.zzz.pojo.TbShipOrder;
import com.zzz.pojo.TbShipOrderInfo;
import com.zzz.service.SellService;
import com.zzz.util.MyUtil;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o 2019-06-06
 */
@Service
public class SellServiceImpl implements SellService {
	@Autowired
	private TbSellOrderMapper sellOrderMapper;
	
	@Autowired
	private TbSellOrderInfoMapper sellOrderInfoMapper;
	
	@Autowired
    private TbShipOrderMapper shipOrderMapper;
    
	@Autowired
	private TbShipOrderInfoMapper shipOrderInfoMapper;
	
	@Autowired
	private TbActualOrderMapper actualOrderMapper;
	
	@Autowired
	private TbActualOrderInfoMapper actualOrderInfoMapper;
	
	@Override
	public ResultUtil getSellList(Integer page, Integer limit, SellSearch search) {
		PageHelper.startPage(page, limit);
		TbSellOrderExample example = new TbSellOrderExample();
		example.setOrderByClause("oid desc");
		Criteria criteria = example.createCriteria();
		if (search.getOid() != null && !"".equals(search.getOid())) {
			criteria.andOidEqualTo(Long.parseLong(search.getOid()));
		}
		if (search.getCustName() != null && !"".equals(search.getCustName())) {
			criteria.andCustNameLike("%" + search.getCustName() + "%");
		}
		if (search.getOrderDateStart() != null && !"".equals(search.getOrderDateStart())) {
			criteria.andOrderDateGreaterThanOrEqualTo(MyUtil.getDateByString(search.getOrderDateStart()));
		}
		if (search.getOrderDateEnd() != null && !"".equals(search.getOrderDateEnd())) {
			criteria.andOrderDateLessThanOrEqualTo(MyUtil.getDateByString(search.getOrderDateEnd()));
		}
		if (search.getOrderStatus() != null && !"未选择状态".equals(search.getOrderStatus())) {
			criteria.andOrderStatusEqualTo(search.getOrderStatus());
		}
		if (search.getNote() != null && !"".equals(search.getNote())) {
			criteria.andNoteLike("%" + search.getNote() + "%");
		}
		criteria.andStatusEqualTo("1");
		List<TbSellOrder> sells = sellOrderMapper.selectByExample(example);
		PageInfo<TbSellOrder> pageInfo = new PageInfo<TbSellOrder>(sells);
		ResultUtil resultUtil = new ResultUtil();
		resultUtil.setCode(0);
		resultUtil.setCount(pageInfo.getTotal());
		resultUtil.setData(pageInfo.getList());
		return resultUtil;
	}

    @Override
    public void insertSell(TbSellOrder sell) {
        sellOrderMapper.insertSelective(sell);
    }

    @Override
    public TbSellOrder selectSellById(Long oid) {
        return sellOrderMapper.selectByPrimaryKey(oid);
    }

    @Override
    public void updateSell(TbSellOrder sell) {
        sellOrderMapper.updateByPrimaryKey(sell);
    }
    
    @Override
    public ResultUtil getSellInfoList(Integer page, Integer limit, Long oid) {
        PageHelper.startPage(page, limit);
        List<TbSellOrderInfo> infos = sellOrderInfoMapper.selectByOid(oid);
        PageInfo<TbSellOrderInfo> pageInfo = new PageInfo<TbSellOrderInfo>(infos);
        ResultUtil resultUtil = new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }

    @Override
    public void inserInfo(TbSellOrderInfo info) {
        sellOrderInfoMapper.insert(info);
    }

	@Override
	public TbSellOrderInfo selectSellOrderInfoByCondition(TbSellOrderInfo info) {
        List<TbSellOrderInfo> info2 = sellOrderInfoMapper.selectByOidItemno(info.getOid(), info.getItemno());
        if (info2 != null && info2.size() > 0) {
            return info2.get(0);
        }
        return null;
	}

	@Override
	public void updateInfo(TbSellOrderInfo info) {
		sellOrderInfoMapper.updateByPrimaryKeySelective(info);
	}

	@Override
	public TbSellOrderInfo selectSellInfoById(Long id) {
		return sellOrderInfoMapper.selectById(id);
	}

	@Override
	public void deleteInfoById(Long id) {
		sellOrderInfoMapper.deleteByPrimaryKey(id);
	}

    @Override
    public ResultUtil getShipInfoList(Long oid) {
        List<TbSellOrderInfo> sellInfos = sellOrderInfoMapper.selectItemnoByOid(oid);
        String s = "";
        String msg = "";
        for (int i = 0; i < sellInfos.size(); i++) {
            s += "SUM(IF(itemno='" + sellInfos.get(i).getItemno() + "', num, 0)) AS '" + sellInfos.get(i).getItemno() + "',";
            msg += sellInfos.get(i).getItemno() + ",";
        }
        if("".equals(s)) {
            return null;
        }
        s = s.substring(0, s.length() - 1);
        msg = msg.substring(0, msg.length() - 1);
        List<Map<String, Object>> shipInfos = shipOrderInfoMapper.getShipInfo(oid, s);
        ResultUtil resultUtil = new ResultUtil();
        resultUtil.setData(shipInfos);
        resultUtil.setMsg(msg);
        return resultUtil;
    }

    @Override
    public TbShipOrder selectShipInfoById(Long sid) {
        return shipOrderMapper.selectByPrimaryKey(sid);
    }

    @Override
    public void updateShip(TbShipOrder ship) {
        shipOrderMapper.updateByPrimaryKeySelective(ship);
    }

    @Override
    public ResultUtil getAddShipInfo(Integer page, Integer limit, Long oid) {
        PageHelper.startPage(page, limit);
        List<Map<String, Object>> shipInfos = shipOrderInfoMapper.getAddShipInfo(oid);
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(shipInfos);
        ResultUtil resultUtil = new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }

	@Override
	public void insertShip(TbShipOrder order) {
		shipOrderMapper.insert(order);
	}

	@Override
	public void insertShipInfo(TbShipOrderInfo shipInfo) {
		shipOrderInfoMapper.insert(shipInfo);
	}

	@Override
	public ResultUtil getMergeInfo(Integer page, Integer limit, Long oid, String sid) {
		PageHelper.startPage(page, limit);
        List<Map<String, Object>> mergeInfos = shipOrderInfoMapper.getMergeInfo(oid, sid);
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(mergeInfos);
        ResultUtil resultUtil = new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
	}

    @Override
    public void updateShipStatus(String sid) {
        shipOrderMapper.updateShipOrderStatus(sid);
    }

	@Override
	public void insertOrder(TbActualOrder order) {
		actualOrderMapper.insertSelective(order);
	}

	@Override
	public void insertOrderInfo(TbActualOrderInfo info) {
		actualOrderInfoMapper.insertSelective(info);
	}

    @Override
    public void updateOrderTamt(Long aid) {
        actualOrderMapper.updateOrderTamt(aid);
    }

    @Override
    public void updateSellTamt(Long oid) {
        sellOrderMapper.updateSellTamt(oid);
    }

}
