package com.zzz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzz.mapper.TbItemMapper;
import com.zzz.pojo.ItemSearch;
import com.zzz.pojo.TbItem;
import com.zzz.pojo.TbItemExample;
import com.zzz.pojo.TbItemExample.Criteria;
import com.zzz.service.ItemService;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o  
 * 2019-05-30
 */
@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private TbItemMapper itemMapper;

    @Override
    public List<TbItem> getAllItem() {
        return itemMapper.selectByExample(new TbItemExample());
    }

    @Override
    public ResultUtil getItem(Integer page, Integer limit, ItemSearch search) {
        PageHelper.startPage(page, limit);
        TbItemExample example = new TbItemExample();
        example.setOrderByClause("id");
        Criteria criteria = example.createCriteria();
        if (search.getItemno() != null && !"".equals(search.getItemno())) {
            criteria.andItemnoLike("%" + search.getItemno() + "%");
        }
        if (search.getItemName() != null && !"".equals(search.getItemName())) {
            criteria.andItemNameLike("%" + search.getItemName() + "%");
        }
        if (search.getStatus() != null && !"".equals(search.getStatus()) && !"-1".equals(search.getStatus())) {
            criteria.andStatusEqualTo(search.getStatus());
        }
        List<TbItem> items = itemMapper.selectByExample(example);
        PageInfo<TbItem> pageInfo = new PageInfo<TbItem>(items);
        ResultUtil resultUtil = new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }

    @Override
    public TbItem selectItemByItemno(String itemno) {
        TbItemExample example = new TbItemExample();
        Criteria criteria = example.createCriteria();
        criteria.andItemnoEqualTo(itemno);
        List<TbItem> item = itemMapper.selectByExample(example);
        if (item != null && item.size() > 0) {
            return item.get(0);
        }
        return null;
    }

    @Override
    public void inserItem(TbItem item) {
        item.setItemno(item.getItemno().toUpperCase());
        itemMapper.insertSelective(item);
    }

    @Override
    public TbItem selectItemById(Long id) {
        return itemMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateItem(TbItem item) {
        itemMapper.updateByPrimaryKey(item);
    }

    @Override
    public ResultUtil getSellItem(Integer page, Integer limit, ItemSearch search) {
        PageHelper.startPage(page, limit);
        TbItemExample example = new TbItemExample();
        example.setOrderByClause("id");
        Criteria criteria = example.createCriteria();
        if (search.getItemno() != null && !"".equals(search.getItemno())) {
            criteria.andItemnoLike("%" + search.getItemno() + "%");
        }
        if (search.getItemName() != null && !"".equals(search.getItemName())) {
            criteria.andItemNameLike("%" + search.getItemName() + "%");
        }
        if (search.getStatus() != null && !"".equals(search.getStatus()) && !"-1".equals(search.getStatus())) {
            criteria.andStatusEqualTo(search.getStatus());
        }
        criteria.andItemnoNotEqualTo("999999");
        criteria.andItemnoNotEqualTo("999998");
        List<TbItem> items = itemMapper.selectByExample(example);
        PageInfo<TbItem> pageInfo = new PageInfo<TbItem>(items);
        ResultUtil resultUtil = new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }

}
