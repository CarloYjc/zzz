package com.zzz.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zzz.pojo.LogSearch;
import com.zzz.service.LogService;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o  
 * 2019-05-29
 */
@Controller
@RequestMapping("/log")
public class LogController {
    @Autowired
    private LogService logServiceImpl;

    @RequestMapping("/logList")
    @RequiresPermissions("log:log:list")
    public String logList() {
        return "page/log/logList";
    }

    @RequestMapping("/getLogList")
    @RequiresPermissions("log:log:list")
    @ResponseBody
    public ResultUtil getLogList(Integer page, Integer limit, LogSearch search) {
        return logServiceImpl.getLogList(page, limit, search);
    }
}
