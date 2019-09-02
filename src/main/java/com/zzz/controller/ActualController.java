package com.zzz.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRichTextString;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zzz.annotation.SysLog;
import com.zzz.pojo.SellSearch;
import com.zzz.pojo.TbActualOrder;
import com.zzz.service.ActualService;
import com.zzz.util.ResultUtil;

/**
 * 
 * @author Car1o  
 * 2019-05-30
 */
@Controller
@RequestMapping("/actual")
public class ActualController {

    @Autowired
    private ActualService actualServiceImpl;

    /**
     * @Desc 根据查询条件获取结算订单列表
     * @param page 起始页
     * @param limit 限制
     * @param search 查询条件
     * @return 查询结果
     */
    @RequestMapping("/getOrderList")
    @ResponseBody
    public ResultUtil getOrderList(Integer page, Integer limit, SellSearch search) {
        return actualServiceImpl.getOrderList(page, limit, search);
    }

    /**
     * @Desc 订单明细
     * @param model
     * @param aid 
     * @return 跳转页面
     */
    @RequestMapping("/openOrderInfo/{aid}")
    public String openOrderInfo(Model model, @PathVariable("aid") Long aid) {
        model.addAttribute("aid", aid);
        return "page/actual/orderInfo";
    }

    /**
     * @Desc 根据id查询结算订单明细列表
     * @param page 起始页
     * @param limit 限制
     * @param aid
     * @return 查询结果
     */
    @RequestMapping("/getOrderInfoList/{aid}")
    @ResponseBody
    public ResultUtil getOrderInfoList(Integer page, Integer limit, @PathVariable("aid") Long aid) {
        return actualServiceImpl.getOrderInfoList(page, limit, aid);
    }

    /**
     * @Desc 结算订单确认
     * @param aid
     * @return 确认结果
     */
    @RequestMapping("/confirmOrder/{aid}")
    @ResponseBody
    public ResultUtil confirmOrder(@PathVariable("aid") Long aid) {
        try {
            TbActualOrder order = actualServiceImpl.selectOrderById(aid);
            order.setOrderStatus("1");
            actualServiceImpl.updateOrder(order);
            return ResultUtil.ok("确认成功！");
        } catch (Exception e) {
            return ResultUtil.error("确认失败！");
        }
    }

    /**
     * @Desc 结算订单回款金额修改
     * @param aid
     * @param atamt 回款金额
     * @return 修改结果
     */
    @SysLog(value = "结算订单回款金额修改")
    @RequestMapping("/updateOrderAtamt")
    @ResponseBody
    public ResultUtil updateOrderAtamt(Long aid, BigDecimal atamt) {
        try {
            TbActualOrder order = actualServiceImpl.selectOrderById(aid);
            order.setAtamt(atamt);
            actualServiceImpl.updateOrder(order);
            actualServiceImpl.updateSellAtamt(order.getOid());
            return ResultUtil.ok("修改成功！");
        } catch (NumberFormatException e) {
            return ResultUtil.error("修改失败！");
        }
    }

    /**
     * @Desc 列头样式
     * @param wb 工作簿
     * @return 字体
     */
    public XSSFCellStyle initColumnHeadStyle(XSSFWorkbook wb) {
        XSSFCellStyle columnHeadStyle = wb.createCellStyle();
        XSSFFont columnHeadFont = wb.createFont();
        columnHeadFont.setFontName("宋体");
        columnHeadFont.setFontHeightInPoints((short) 18);
        columnHeadFont.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
        columnHeadStyle.setFont(columnHeadFont);
        columnHeadStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);// 左右居中
        columnHeadStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);// 上下居中
        columnHeadStyle.setLocked(true);
        columnHeadStyle.setWrapText(true);
        columnHeadStyle.setLeftBorderColor(new XSSFColor(java.awt.Color.BLACK));// 左边框的颜色
        columnHeadStyle.setBorderLeft((short) 1);// 边框的大小
        columnHeadStyle.setRightBorderColor(new XSSFColor(java.awt.Color.BLACK));// 右边框的颜色
        columnHeadStyle.setBorderRight((short) 1);// 边框的大小
        columnHeadStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体
        columnHeadStyle.setBottomBorderColor(new XSSFColor(java.awt.Color.BLACK)); // 设置单元格的边框颜色
        columnHeadStyle.setFillForegroundColor(new XSSFColor(java.awt.Color.WHITE));
        return columnHeadStyle;
    }

    /**
     * @Desc 单元格样式
     * @param wb 工作簿
     * @param size 字体大小
     * @return 字体
     */
    public XSSFCellStyle initColumnCenterstyle(XSSFWorkbook wb, int size) {
        XSSFFont font = wb.createFont();
        font.setFontName("宋体");
        font.setFontHeightInPoints((short) size);
        XSSFCellStyle centerstyle = wb.createCellStyle();
        centerstyle.setFont(font);
        centerstyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);// 左右居中
        centerstyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);// 上下居中
        centerstyle.setWrapText(true);
        centerstyle.setLeftBorderColor(new XSSFColor(java.awt.Color.BLACK));
        centerstyle.setBorderLeft((short) 1);
        centerstyle.setRightBorderColor(new XSSFColor(java.awt.Color.BLACK));
        centerstyle.setBorderRight((short) 1);
        centerstyle.setBorderBottom(XSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体
        centerstyle.setBottomBorderColor(new XSSFColor(java.awt.Color.BLACK)); // 设置单元格的边框颜色．
        centerstyle.setFillForegroundColor(new XSSFColor(java.awt.Color.WHITE));// 设置单元格的背景颜色．
        return centerstyle;
    }

    /**
     * @Desc 导出订单明细
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/exportOrder/{aid}")
    public void exportOrder(HttpServletRequest request, HttpServletResponse response, @PathVariable("aid") Long aid)
            throws Exception {
        TbActualOrder order = actualServiceImpl.selectOrderById(aid);
        String sids = order.getSid();
        List<Map<String, Object>> list = actualServiceImpl.exportOrder(aid, sids);
        response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("对账单", "UTF-8") + ".xlsx");
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet("Sheet1");
        sheet.setDefaultColumnWidth(20);
        XSSFCellStyle heanderStyleCenter = initColumnHeadStyle(workbook);
        XSSFCellStyle cellStyleCenter = initColumnCenterstyle(workbook, 12);
        XSSFCellStyle cellStyleLeft1 = initColumnCenterstyle(workbook, 14);
        XSSFCellStyle cellStyleLeft2 = initColumnCenterstyle(workbook, 12);
        cellStyleCenter.setAlignment(XSSFCellStyle.ALIGN_CENTER);
        cellStyleLeft1.setAlignment(XSSFCellStyle.ALIGN_LEFT);
        cellStyleLeft2.setAlignment(XSSFCellStyle.ALIGN_LEFT);
        XSSFRow row = null;
        XSSFCell cell = null;
        for (int i = 0; i < list.size() + 4; i++) {
            row = sheet.createRow(i);
            for (int j = 0; j <= 6; j++) {
                cell = row.createCell(j);
                switch (i) {
                case 0:
                    cell.setCellStyle(heanderStyleCenter);
                    break;
                case 1:
                    cell.setCellStyle(cellStyleLeft1);
                    break;
                case 2:
                    cell.setCellStyle(cellStyleCenter);
                    break;
                default:
                    cell.setCellStyle(cellStyleLeft2);
                    break;
                }
            }
        }

        sheet.getRow(0).getCell(0).setCellValue("宁波市海曙佰亮塑料工贸有限公司对账单");
        sheet.getRow(1).getCell(0).setCellValue("客户名称：" + order.getCustName());
        sheet.getRow(1).getCell(2).setCellValue("对账时间：" + new SimpleDateFormat("yyyy/MM/dd").format(new Date()));
        sheet.getRow(1).getCell(4).setCellValue("合同号：");
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 6));
        sheet.addMergedRegion(new CellRangeAddress(1, 1, 0, 1));
        sheet.addMergedRegion(new CellRangeAddress(1, 1, 2, 3));
        sheet.addMergedRegion(new CellRangeAddress(1, 1, 4, 6));

        // 产生表格标题行
        String[] headers = { "序号", "发货日期", "货号", "数量", "单价", "金额", "备注" };
        for (int j = 0; j < headers.length; j++) {
            sheet.getRow(2).getCell(j).setCellValue(new XSSFRichTextString(headers[j]));
        }
        for (int i = 0; i < list.size(); i++) {
            sheet.getRow(i + 3).getCell(0).setCellValue(String.valueOf(i + 1));
            sheet.getRow(i + 3).getCell(1).setCellValue(String.valueOf(list.get(i).get("ship_date")));
            sheet.getRow(i + 3).getCell(2).setCellValue(String.valueOf(list.get(i).get("itemno")));
            sheet.getRow(i + 3).getCell(3).setCellValue(String.valueOf(list.get(i).get("num")));
            sheet.getRow(i + 3).getCell(4).setCellValue(String.valueOf(list.get(i).get("aprice")));
            sheet.getRow(i + 3).getCell(5).setCellValue(String.valueOf(list.get(i).get("amt")));
            sheet.getRow(i + 3).getCell(6).setCellValue(String.valueOf(list.get(i).get("note")));
        }
        sheet.getRow(list.size() + 3).getCell(4).setCellValue("合计");
        sheet.getRow(list.size() + 3).getCell(5).setCellValue(String.valueOf(order.getTamt()));
        try {
            workbook.write(response.getOutputStream());
            workbook.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
