package com.zzz.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zzz.annotation.SysLog;
import com.zzz.pojo.MergeShip;
import com.zzz.pojo.SellSearch;
import com.zzz.pojo.TbActualOrder;
import com.zzz.pojo.TbActualOrderInfo;
import com.zzz.pojo.TbSellOrder;
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
@Controller
@RequestMapping("/sell")
public class SellController {
    @Autowired
    private SellService sellServiceImpl;

    /**
     * @Desc 根据查询条件获取订单信息
     * @param page 起始页
     * @param limit 数量限制
     * @param search 查询条件
     * @return 查询结果
     */
    @RequestMapping("/getSellList")
    @ResponseBody
    public ResultUtil getSellList(Integer page, Integer limit, SellSearch search) {
        return sellServiceImpl.getSellList(page, limit, search);
    }

    /**
     * @Desc 新增销售订单页面
     * @param model
     * @return 跳转页面
     */
    @RequestMapping("/addSell")
    public String addSell(Model model) {
        TbSellOrder sell = new TbSellOrder();
        sell.setOrderStatus("订单输入");
        sell.setStatus("1");
        model.addAttribute("sell", sell);
        return "page/sell/sellInfo";
    }

    /**
     * @Desc 编辑销售订单页面
     * @param model
     * @param oid 订单号
     * @return 跳转页面
     */
    @RequestMapping("/editSell/{oid}")
    public String editSell(Model model, @PathVariable("oid") Long oid) {
        TbSellOrder sell = sellServiceImpl.selectSellById(oid);
        model.addAttribute("sell", sell);
        return "page/sell/sellInfo";
    }

    /**
     * @Desc 删除销售订单
     * @param oid 订单号
     * @return 删除结果
     */
    @SysLog(value = "删除销售订单")
    @RequestMapping("/deleteSell/{oid}")
    @ResponseBody
    public ResultUtil deleteSell(@PathVariable("oid") Long oid) {
        try {
            TbSellOrder sell = sellServiceImpl.selectSellById(oid);
            if (!"订单输入".equals(sell.getOrderStatus())) {
                return ResultUtil.error("当前状态无法删除订单！");
            }
            sell.setStatus("0");
            sellServiceImpl.updateSell(sell);
            return ResultUtil.ok("删除成功！");
        } catch (Exception e) {
            return ResultUtil.error("删除失败！");
        }
    }

    /**
     * @Desc 修改订单状态,待收款->订单结束
     * @param oid 订单号
     * @return 修改结果
     */
    @SysLog(value = "结束销售订单")
    @RequestMapping("/endSell/{oid}")
    @ResponseBody
    public ResultUtil endSell(@PathVariable("oid") Long oid) {
        try {
            TbSellOrder sell = sellServiceImpl.selectSellById(oid);
            if (!"待收款".equals(sell.getOrderStatus())) {
                return ResultUtil.error("当前状态无法结束订单！");
            }
            sell.setOrderStatus("订单结束");
            sellServiceImpl.updateSell(sell);
            return ResultUtil.ok("修改成功！");
        } catch (Exception e) {
            return ResultUtil.error("修改失败！");
        }
    }

    /**
     * @Desc 添加/修改销售订单
     * @param sell 订单
     * @return 添加/修改结果
     */
    @SysLog(value = "添加/修改销售订单")
    @RequestMapping("/saveSell")
    @ResponseBody
    public ResultUtil saveSell(TbSellOrder sell) {
        try {
            if (sell.getOid() == null) {
                sellServiceImpl.insertSell(sell);
                return ResultUtil.ok(sell.getOid().toString());
            } else {
                TbSellOrder sell2 = sellServiceImpl.selectSellById(sell.getOid());
                if (!"订单输入".equals(sell2.getOrderStatus())) {
                    return ResultUtil.error("当前状态无法修改！");
                }
                sellServiceImpl.updateSell(sell);
                return ResultUtil.ok("保存成功！");
            }
        } catch (Exception e) {
            return ResultUtil.error("保存失败！");
        }
    }

    /**
     * @Desc 根据查询条件获取销售明细
     * @param page 起始页
     * @param limit 数量限制
     * @param oid 订单号
     * @return 查询结果
     */
    @RequestMapping("/getSellInfoList")
    @ResponseBody
    public ResultUtil getSellInfoList(Integer page, Integer limit, Long oid) {
        return sellServiceImpl.getSellInfoList(page, limit, oid);
    }

    /**
     * @Desc 新增销售明细页面
     * @param model
     * @param oid 订单号
     * @return 跳转页面
     */
    @RequestMapping("/addSellInfo/{oid}")
    public String addSellInfo(Model model, @PathVariable("oid") Long oid) {
        model.addAttribute("oid", oid);
        return "page/sell/addSellItemInfo";
    }

    /**
     * @Desc 添加销售明细
     * @param info 明细
     * @return 添加结果
     */
    @SysLog(value = "添加销售明细")
    @RequestMapping("/insertSellInfo")
    @ResponseBody
    public ResultUtil insertSellInfo(TbSellOrderInfo info) {
        try {
            TbSellOrder sell = sellServiceImpl.selectSellById(info.getOid());
            if ("订单结束".equals(sell.getOrderStatus())) {
                return ResultUtil.error("当前状态无法添加明细！");
            }
            TbSellOrderInfo info2 = sellServiceImpl.selectSellOrderInfoByCondition(info);
            if (info2 != null) {
                return ResultUtil.error("此货号已存在！");
            }
            sellServiceImpl.inserInfo(info);
            return ResultUtil.ok("添加成功！");
        } catch (Exception e) {
            return ResultUtil.error("添加失败！");
        }
    }

    /**
     * @Desc 编辑销售明细页面
     * @param model
     * @param id 
     * @return 跳转页面
     */
    @RequestMapping("/editSellInfo/{id}")
    public String editSellInfo(Model model, @PathVariable("id") Long id) {
        TbSellOrderInfo info = sellServiceImpl.selectSellInfoById(id);
        model.addAttribute("info", info);
        return "page/sell/editSellItemInfo";
    }

    /**
     * @Desc 修改销售明细
     * @param info 明细
     * @return 修改结果
     */
    @SysLog(value = "修改销售明细")
    @RequestMapping("/updateSellInfo")
    @ResponseBody
    public ResultUtil updateSellInfo(TbSellOrderInfo info) {
        try {
            TbSellOrder sell = sellServiceImpl.selectSellById(info.getOid());
            if (!"订单输入".equals(sell.getOrderStatus())) {
                return ResultUtil.error("当前状态无法修改明细！");
            }
            sellServiceImpl.updateInfo(info);
            return ResultUtil.ok("修改成功！");
        } catch (Exception e) {
            return ResultUtil.error("修改失败！");
        }
    }

    /**
     * @Desc 删除销售明细
     * @param info 明细
     * @return 删除结果
     */
    @SysLog(value = "删除销售明细")
    @RequestMapping("/deleteSellInfo/{idStr}")
    @ResponseBody
    public ResultUtil deleteSellInfo(@PathVariable("idStr") String idStr) {
        try {
            String[] ids = idStr.split(",");
            TbSellOrderInfo info = sellServiceImpl.selectSellInfoById(Long.parseLong(ids[0]));
            TbSellOrder sell = sellServiceImpl.selectSellById(info.getOid());
            if (!"订单输入".equals(sell.getOrderStatus())) {
                return ResultUtil.error("当前状态无法删除明细！");
            }
            for (int i = 0; i < ids.length; i++) {
                sellServiceImpl.deleteInfoById(Long.parseLong(ids[i]));
            }
            return ResultUtil.ok("删除成功！");
        } catch (Exception e) {
            return ResultUtil.error("删除失败！");
        }
    }

    /**
     * @Desc 制作中
     * @param oid 订单号
     * @return 制作结果
     */
    @RequestMapping("/makeSell/{oid}")
    @ResponseBody
    public ResultUtil makeSell(@PathVariable("oid") Long oid) {
        try {
            TbSellOrder sell = sellServiceImpl.selectSellById(oid);
            if ("订单输入".equals(sell.getOrderStatus())) {
                sell.setOrderStatus("制作中");
                sellServiceImpl.updateSell(sell);
                return ResultUtil.ok("制作中");
            }
            ResultUtil resultUtil = new ResultUtil();
            resultUtil.setCode(0);
            resultUtil.setMsg("打印中！");
            resultUtil.setData(sellServiceImpl.getSellInfoList(1, 200, oid));
            return resultUtil;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("制作失败！");
        }
    }

    /**
     * @Desc 根据订单号获取出货明细
     * @param oid 订单号
     * @return 查询结果
     */
    @RequestMapping("/getShipInfoList")
    @ResponseBody
    public ResultUtil getShipInfoList(Long oid) {
        return sellServiceImpl.getShipInfoList(oid);
    }

    /**
     * @Desc 新增出货明细页面
     * @param model
     * @param oid 订单号
     * @param parentName 父页面
     * @return 跳转页面
     */
    @RequestMapping("/addShip/{oid}/{parentName}")
    public String addShip(Model model, @PathVariable("oid") Long oid, @PathVariable("parentName") String parentName) {
        model.addAttribute("parentName", parentName);
        model.addAttribute("oid", oid);
        return "page/sell/addShip";
    }

    /**
     * @Desc 新增出货明细
     * @param page 起始页
     * @param limit 数量控制
     * @param oid 订单号
     * @return 出货明细
     */
    @RequestMapping("/getShipInfo")
    @ResponseBody
    public ResultUtil getShipInfo(Integer page, Integer limit, Long oid) {
        return sellServiceImpl.getAddShipInfo(page, limit, oid);
    }

    /**
     * @Desc 添加出货明细
     * @param list 明细
     * @param oid 订单号
     * @return 添加结果
     */
    @SysLog(value = "添加出货明细")
    @RequestMapping(value = "/insertShip/{oid}", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil insertShip(@RequestBody List<TbShipOrderInfo> list, @PathVariable("oid") Long oid) {
        try {
            TbSellOrder sell = sellServiceImpl.selectSellById(oid);
            if ("制作中".equals(sell.getOrderStatus())) {
                sell.setOrderStatus("发货中");
                sellServiceImpl.updateSell(sell);
            }
            TbShipOrder order = new TbShipOrder();
            order.setShipDate(new SimpleDateFormat("yyyy/MM/dd").format(new Date()));
            order.setShipStatus("1");
            order.setOid(oid);
            sellServiceImpl.insertShip(order);
            for (TbShipOrderInfo shipInfo : list) {
                shipInfo.setSid(order.getSid());
                sellServiceImpl.insertShipInfo(shipInfo);
            }
            return ResultUtil.ok("新增成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("新增失败！");
        }
    }

    /**
     * @Desc 删除出货明细
     * @param sid 
     * @return 删除结果
     */
    @SysLog(value = "删除出货明细")
    @RequestMapping("/deleteShip/{sid}")
    @ResponseBody
    public ResultUtil deleteShip(@PathVariable("sid") Long sid) {
        try {
            TbShipOrder ship = sellServiceImpl.selectShipInfoById(sid);
            ship.setShipStatus("0");
            sellServiceImpl.updateShip(ship);
            return ResultUtil.ok("删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("删除失败！");
        }
    }

    /**
     * @Desc 合并出货明细页面
     * @param model
     * @return 跳转页面
     */
    @RequestMapping(value = "/mergeShip")
    public String mergeShip(Model model) {
        return "page/sell/mergeShip";
    }

    /**
     * @Desc 合并出货明细信息
     * @param page 起始页
     * @param limit 数量控制
     * @param oid 订单号
     * @param sid 
     * @return 查询结果
     */
    @RequestMapping("/getMergeInfo")
    @ResponseBody
    public ResultUtil getMergeInfo(Integer page, Integer limit, Long oid, String sid) {
        return sellServiceImpl.getMergeInfo(page, limit, oid, sid);
    }

    /**
     * @Desc 新增结算订单
     * @param 合并订单
     * @return 新增结果
     */
    @SysLog(value = "新增结算订单")
    @RequestMapping(value = "/mergeShipInfo", method = RequestMethod.POST)
    @ResponseBody
    public ResultUtil mergeShipInfo(@RequestBody List<MergeShip> ships) {
        try {
            if (ships.size() != 1) {
                return ResultUtil.error("合并失败！");
            }
            String sids = ships.get(0).getSid();
            String[] arrSid = sids.split(",");
            for (int i = 0; i < arrSid.length; i++) {
                TbShipOrder ship = sellServiceImpl.selectShipInfoById(Long.parseLong(arrSid[i]));
                ship.setShipStatus("2");
                sellServiceImpl.updateShip(ship);
            }
            Long oid = ships.get(0).getOid();
            TbSellOrder sell = sellServiceImpl.selectSellById(oid);
            if ("发货中".equals(sell.getOrderStatus())) {
                sell.setOrderStatus("对账中");
                sellServiceImpl.updateSell(sell);
            }
            TbActualOrder order = new TbActualOrder();
            order.setOid(sell.getOid());
            order.setCustName(sell.getCustName());
            order.setOrderDate(MyUtil.getNowDateStr2());
            order.setOrderStatus("0");
            order.setSid(sids);
            sellServiceImpl.insertOrder(order);
            Long aid = order.getAid();
            List<TbActualOrderInfo> infos = ships.get(0).getData();
            for (int i = 0; i < infos.size(); i++) {
                TbActualOrderInfo info = infos.get(i);
                info.setAid(aid);
                sellServiceImpl.insertOrderInfo(info);
            }
            sellServiceImpl.updateOrderTamt(aid);
            sellServiceImpl.updateSellTamt(oid);
            return ResultUtil.ok("对账单已生成！");
        } catch (Exception e) {
            return ResultUtil.error("对账单生成失败！");
        }
    }

}
