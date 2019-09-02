package com.zzz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzz.mapper.TbActualOrderInfoMapper;
import com.zzz.mapper.TbActualOrderMapper;
import com.zzz.mapper.TbSellOrderMapper;
import com.zzz.pojo.SellSearch;
import com.zzz.pojo.TbActualOrder;
import com.zzz.pojo.TbActualOrderExample;
import com.zzz.pojo.TbActualOrderExample.Criteria;
import com.zzz.service.ActualService;
import com.zzz.util.MyUtil;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o  
 * 2019-05-30
 */
@Service
public class ActualServiceImpl implements ActualService {
   
    @Autowired
    private TbActualOrderMapper actualOrderMapper;
    
    @Autowired
    private TbActualOrderInfoMapper actualOrderInfoMapper;
    
    @Autowired
    private TbSellOrderMapper sellOrderMapper;
    
    @Override
    public ResultUtil getOrderList(Integer page, Integer limit, SellSearch search) {
        PageHelper.startPage(page, limit);
        TbActualOrderExample example = new TbActualOrderExample();
        example.setOrderByClause("aid desc");
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
        if (search.getOrderStatus() != null && !"-1".equals(search.getOrderStatus())) {
            criteria.andOrderStatusEqualTo(search.getOrderStatus());
        }
        List<TbActualOrder> orders = actualOrderMapper.selectByExample(example);
        PageInfo<TbActualOrder> pageInfo = new PageInfo<TbActualOrder>(orders);
        ResultUtil resultUtil = new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }


    @Override
    public ResultUtil getOrderInfoList(Integer page, Integer limit, Long aid) {
        PageHelper.startPage(page, limit);
        List<Map<String, Object>> infos = actualOrderInfoMapper.selectByAid(aid);
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(infos);
        ResultUtil resultUtil = new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }


    @Override
    public TbActualOrder selectOrderById(Long aid) {
        return actualOrderMapper.selectByPrimaryKey(aid);
    }


    @Override
    public void updateOrder(TbActualOrder order) {
        actualOrderMapper.updateByPrimaryKey(order);
    }


    @Override
    public List<Map<String, Object>> exportOrder(Long aid, String sids) {
        return actualOrderMapper.exportOrder(aid, sids);
    }


    @Override
    public void updateSellAtamt(Long oid) {
        sellOrderMapper.updateSellAtamt(oid);
    }

}
