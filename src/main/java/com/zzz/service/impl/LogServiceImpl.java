package com.zzz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzz.mapper.TbLogMapper;
import com.zzz.pojo.LogSearch;
import com.zzz.pojo.TbLog;
import com.zzz.pojo.TbLogExample;
import com.zzz.pojo.TbLogExample.Criteria;
import com.zzz.service.LogService;
import com.zzz.util.MyUtil;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o  
 * 2019-05-27
 */
@Service
public class LogServiceImpl implements LogService {
    @Autowired
    private TbLogMapper tbLogMapper;

    @Override
    public void insertLog(TbLog log) {
        tbLogMapper.insert(log);
    }

    @Override
    public ResultUtil getLogList(Integer page, Integer limit, LogSearch search) {
        PageHelper.startPage(page, limit);
        TbLogExample example = new TbLogExample();
        example.setOrderByClause("id DESC");
        Criteria criteria = example.createCriteria();
        if (search.getOperation() != null && !"".equals(search.getOperation())) {
            criteria.andOperationLike("%" + search.getOperation() + "%");
        }
        if (search.getCreateTimeStart() != null && !"".equals(search.getCreateTimeStart())) {
            criteria.andCreateTimeGreaterThanOrEqualTo(MyUtil.getDateByString(search.getCreateTimeStart()));
        }
        if (search.getCreateTimeEnd() != null && !"".equals(search.getCreateTimeEnd())) {
            criteria.andCreateTimeLessThanOrEqualTo(MyUtil.getDateByString(search.getCreateTimeEnd()));
        }
        List<TbLog> logs = tbLogMapper.selectByExample(example);
        PageInfo<TbLog> pageInfo = new PageInfo<TbLog>(logs);
        ResultUtil resultUtil = new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }

}
