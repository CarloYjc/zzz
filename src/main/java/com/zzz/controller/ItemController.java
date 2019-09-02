package com.zzz.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zzz.annotation.SysLog;
import com.zzz.pojo.ItemSearch;
import com.zzz.pojo.TbItem;
import com.zzz.pojo.TbItemImport;
import com.zzz.service.ItemService;
import com.zzz.util.ExportExcelUtil;
import com.zzz.util.ExportExcelWrapper;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o  
 * 2019-05-30
 */
@Controller
@RequestMapping("/item")
public class ItemController {

    @Autowired
    private ItemService itemServiceImpl;

    /**
     * @Desc 根据查询条件获取货号信息
     * @param page 起始页
     * @param limit 数量限制
     * @return 查询结果
     */
    @RequestMapping("/getItemList")
    @ResponseBody
    public ResultUtil getItemList(Integer page, Integer limit, ItemSearch search) {
        return itemServiceImpl.getItem(page, limit, search);
    }

    /**
     * @Desc 根据查询条件获取货号信息(排除模具费和运输费)
     * @param page 起始页
     * @param limit 数量限制
     * @return 查询结果
     */
    @RequestMapping("/getSellItem")
    @ResponseBody
    public ResultUtil getSellItem(Integer page, Integer limit, ItemSearch search) {
        return itemServiceImpl.getSellItem(page, limit, search);
    }

    /**
     * @Desc 新增货号页面
     * @return 跳转页面
     */
    @RequestMapping("/addItem")
    public String addItem() {
        return "page/item/addItem";
    }

    /**
     * @Desc 货号唯一性检查
     * @param username 用户名
     * @return 检查结果
     */
    @RequestMapping("/checkItemno/{itemno}")
    @ResponseBody
    public ResultUtil checkItemno(@PathVariable("itemno") String itemno) {
        TbItem item = itemServiceImpl.selectItemByItemno(itemno);
        if (item != null) {
            return ResultUtil.error("货号已存在！");
        }
        return ResultUtil.ok();
    }

    /**
     * @Desc 添加货号
     * @param user
     * @return 添加结果
     */
    @SysLog(value = "添加货号")
    @RequestMapping("/insertItem")
    @ResponseBody
    public ResultUtil insertItem(TbItem item) {
        try {
            TbItem item2 = itemServiceImpl.selectItemByItemno(item.getItemno().toUpperCase());
            if (item2 != null) {
                return ResultUtil.error("货号已存在！");
            }
            itemServiceImpl.inserItem(item);
            return ResultUtil.ok("添加成功！");
        } catch (Exception e) {
            return ResultUtil.error("添加失败！");
        }
    }

    /**
     * @Desc 编辑货号页面
     * @param req
     * @param id
     * @return 跳转页面
     */
    @RequestMapping("/editItem/{id}")
    public String updateItem(HttpServletRequest req, @PathVariable("id") Long id) {
        TbItem item = itemServiceImpl.selectItemById(id);
        req.setAttribute("item", item);
        return "page/item/editItem";
    }

    /**
     * @Desc 修改货号
     * @param user
     * @return 修改结果
     */
    @SysLog(value = "修改货号")
    @RequestMapping("/updateItem")
    @ResponseBody
    public ResultUtil updateItem(TbItem item) {
        try {
            itemServiceImpl.updateItem(item);
            return ResultUtil.ok("修改成功！");
        } catch (Exception e) {
            return ResultUtil.error("修改失败！");
        }
    }

    /**
     * @Desc 导出货号明细
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/exportItem")
    public void exportItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<TbItem> list = itemServiceImpl.getAllItem();
        for (TbItem item : list) {
            item.setStatus("1".equals(item.getStatus()) ? "正常" : "禁用");
        }
        String[] columnNames = { "ID", "货号", "品名", "单价", "规格", "重量", "状态" };
        String fileName = "货号信息";
        ExportExcelWrapper<TbItem> util = new ExportExcelWrapper<TbItem>();
        util.exportExcel(fileName, fileName, columnNames, list, response, ExportExcelUtil.EXCEl_FILE_2007);
    }

    /**
     * @Desc 下载模板
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/exportTemplate")
    public void exportTemplate(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<TbItemImport> list = new ArrayList<TbItemImport>();
        TbItemImport tbItemImport;
        for (int i = 1; i < 4; i++) {
            tbItemImport = new TbItemImport();
            tbItemImport.setItemno("货号" + i);
            tbItemImport.setItemName("品名" + i);
            tbItemImport.setPrice(new BigDecimal(i + ".00"));
            tbItemImport.setItemSpec("1000*800*600");
            tbItemImport.setWeight(i * 10 + "g");
            list.add(tbItemImport);
        }
        String[] columnNames = { "货号", "品名", "单价", "规格", "重量" };
        String fileName = "导入模板";
        ExportExcelWrapper<TbItemImport> util = new ExportExcelWrapper<TbItemImport>();
        util.exportExcel(fileName, fileName, columnNames, list, response, ExportExcelUtil.EXCEl_FILE_2007);
    }

    /**
     * @Desc 上传模板
     * @param file 文件
     * @return
     */
    @RequestMapping("/importExcel")
    @ResponseBody
    public ResultUtil importExcel(@RequestParam MultipartFile file) {
        if (file == null)
            return ResultUtil.error("文件为空！");
        try {
            String filename = file.getOriginalFilename();
            String ext = filename.substring(filename.lastIndexOf("."));
            Workbook wb = null;
            if (ext.equals(".xls")) {
                wb = new HSSFWorkbook(file.getInputStream());
            } else if (ext.equals(".xlsx")) {
                wb = new XSSFWorkbook(file.getInputStream());
            } else {
                return ResultUtil.error("文件格式错误！");
            }
            Sheet sheet = wb.getSheetAt(0);
            List<TbItem> list = new ArrayList<TbItem>();
            TbItem item = null;
            boolean flag = true;
            StringBuilder msg = new StringBuilder("");
            for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
                item = new TbItem();
                String itemno = sheet.getRow(rowNum).getCell(0).toString();
                String itemName = sheet.getRow(rowNum).getCell(1).toString();
                String price = sheet.getRow(rowNum).getCell(2).toString();
                String itemSpec = sheet.getRow(rowNum).getCell(3).toString();
                String weight = sheet.getRow(rowNum).getCell(4).toString();
                if ("".equals(itemno)) {
                    msg.append("第" + rowNum + "行货号为空，");
                    flag = false;
                }
                if ("".equals(itemName)) {
                    msg.append("第" + rowNum + "行货品名为空，");
                    flag = false;
                }
                if (!"".equals(price)) {
                    String pattern = "^\\d{1,4}(\\.\\d{1,2})?$";
                    if (!Pattern.matches(pattern, price)) {
                        msg.append("第" + rowNum + "行价格格式不正确，");
                        flag = false;
                    }
                }
                if (flag) {
                    item.setItemno(itemno);
                    item.setItemName(itemName);
                    if (!"".equals(price))
                        item.setPrice(new BigDecimal(price));
                    item.setItemSpec(itemSpec);
                    item.setWeight(weight);
                    item.setStatus("1");
                    list.add(item);
                }
            }
            wb.close();
            if (!flag) {
                return ResultUtil.error(msg.substring(0, msg.length() - 1));
            }
            for (int i = 0; i < list.size(); i++) {
                item = list.get(i);
                TbItem item2 = itemServiceImpl.selectItemByItemno(item.getItemno().toUpperCase());
                if (item2 != null) {
                    return ResultUtil.error("货号" + item.getItemno() + "已存在，请重试！");
                }
                itemServiceImpl.inserItem(item);
            }
            return ResultUtil.ok();
        } catch (Exception e) {
            return ResultUtil.error("导入失败！");
        }
    }

    /**
     * @Desc 订单货号查询页面
     * @param req
     * @param parentName
     * @return
     */
    @RequestMapping("/searchItem/{parentName}")
    public String searchItem(HttpServletRequest req, @PathVariable("parentName") String parentName) {
        req.setAttribute("parentName", parentName);
        return "page/sell/searchItem";
    }
}
