package com.zzz.service;

import com.zzz.pojo.LogSearch;
import com.zzz.pojo.TbLog;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o  
 * 2019-05-27
 */
public interface LogService {
    // 添加日志
    void insertLog(TbLog log);

    // 获取日志列表
    ResultUtil getLogList(Integer page, Integer limit, LogSearch search);
}
