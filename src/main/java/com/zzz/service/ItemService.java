package com.zzz.service;

import java.util.List;

import com.zzz.pojo.ItemSearch;
import com.zzz.pojo.TbItem;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o  
 * 2019-05-30
 */
public interface ItemService {
    // 获取所有货号信息
    List<TbItem> getAllItem();

    // 根据查询条件获取货号信息
    ResultUtil getItem(Integer page, Integer limit, ItemSearch search);

    // 货号唯一性检查
    TbItem selectItemByItemno(String itemno);

    // 添加货号
    void inserItem(TbItem item);

    // 根据ID查询货号信息
    TbItem selectItemById(Long id);

    // 修改货号
    void updateItem(TbItem item);

    // 根据查询条件获取货号信息(排除模具费和运输费)
    ResultUtil getSellItem(Integer page, Integer limit, ItemSearch search);
}
