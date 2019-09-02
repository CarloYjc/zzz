package com.zzz.controller;

import java.awt.image.BufferedImage;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Producer;
import com.zzz.pojo.Report1;
import com.zzz.pojo.Report2;
import com.zzz.pojo.TbUser;
import com.zzz.service.SysService;
import com.zzz.util.ResultUtil;
import com.zzz.util.ShiroUtils;

/**
 * 
 * @author Car1o  
 * 2019-05-27
 */

@Controller
@RequestMapping("/sys")
public class SysController {

    @Autowired
    private SysService sysServiceImpl;

    @Autowired
    private Producer captchaProducer;

    /**
     * 验证码
     * @param req
     * @param resp
     * @throws Exception
     */
    @RequestMapping("/vcode")
    public void vcode(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String text = captchaProducer.createText();
        BufferedImage image = captchaProducer.createImage(text);
        req.getSession().setAttribute("kaptcha", text);
        ImageIO.write(image, "JPEG", resp.getOutputStream());
    }

    /**
     * @Desc 登录
     * @param req
     * @param 账号
     * @param 密码
     * @param 验证码
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public ResultUtil login(HttpServletRequest req, String username, String password, String vcode) {
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password) || StringUtils.isEmpty(vcode)) {
            return ResultUtil.error("参数不能为空");
        }
        if (!vcode.toLowerCase().equals(((String) req.getSession().getAttribute("kaptcha")).toLowerCase())) {
            return ResultUtil.error("验证码不正确");
        }
        try {
            Subject subject = ShiroUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            subject.login(token);
        } catch (UnknownAccountException e) {
            return ResultUtil.error(e.getMessage());
        } catch (IncorrectCredentialsException e) {
            return ResultUtil.error(e.getMessage());
        } catch (LockedAccountException e) {
            return ResultUtil.error(e.getMessage());
        } catch (AuthenticationException e) {
            return ResultUtil.error("账户验证失败!");
        } catch (Exception e) {
            return ResultUtil.error("出错!");
        }
        return ResultUtil.ok();
    }

    /**
     * @Desc 修改密码
     * @param req
     * @param oldPwd
     * @param newPwd
     * @return
     */
    @RequestMapping("/updatePwd")
    @ResponseBody
    public ResultUtil updatePwd(HttpServletRequest req, String oldPwd, String newPwd) {
        TbUser user = (TbUser) SecurityUtils.getSubject().getPrincipal();
        if (user != null) {
            user = sysServiceImpl.login(user.getUsername(), oldPwd);
            if (user != null) {
                user.setPassword(newPwd);
                sysServiceImpl.updatePwd(user);
                // 修改密码后移除作用域重新登陆
                SecurityUtils.getSubject().logout();
                return ResultUtil.ok();
            }
            return new ResultUtil(501, "旧密码错误,请重新填写！");
        }
        return new ResultUtil(500, "请求错误！");
    }

    /**
     * @Desc: 主页面
     * @param req
     * @return
     */
    @RequestMapping("/index")
    public String index(HttpServletRequest req) {
        TbUser user = (TbUser) SecurityUtils.getSubject().getPrincipal();
        req.setAttribute("user", user);
        return "redirect:/index.jsp";
    }

    /**
     * @Desc: 后台首页
     * @return
     */
    @RequestMapping("/main")
    public String main() {
        return "/page/main";
    }

    /**
     * @Desc: 修改密码页面
     * @return
     */
    @RequestMapping("/changePwd")
    public String changePwd() {
        return "/page/changePwd";
    }

    /**
     * @Desc 登出
     * @return
     */
    @RequestMapping("/loginOut")
    public String loginOut() {
        ShiroUtils.logout();
        return "redirect:/login.jsp";
    }

    /**
     * @Desc 用户页面
     * @return
     */
    @RequestMapping("/userList")
    public String userList() {
        return "page/user/userList";
    }

    /**
     * @Desc druid页面
     * @return
     */
    @RequestMapping("/druid")
    @RequiresPermissions("sys:druid:list")
    public String druid() {
        return "redirect:/druid/index.html";
    }

    /**
     * @Desc 货号页面
     * @return
     */
    @RequestMapping("/itemList")
    public String itemList() {
        return "page/item/itemList";
    }

    /**
     * @Desc 角色页面
     * @return
     */
    @RequestMapping("/roleList")
    public String roleList() {
        return "page/role/roleList";
    }

    /**
     * @Desc 菜单管理
     * @return
     */
    @RequestMapping("/menuList")
    public String menuList() {
        return "page/menu/menuList";
    }

    /**
     * @Desc 销售订单
     * @return
     */
    @RequestMapping("/sellOrdList")
    public String sellList() {
        return "page/sell/sellList";
    }

    /**
     * @Desc 结算订单
     * @return
     */
    @RequestMapping("/actualOrdList")
    public String actualOrdList() {
        return "page/actual/orderList";
    }
    
    /**
     * @Desc 最近一年销售数据
     * @return 查询结果
     */
    @RequestMapping("/loadReport1")
    @ResponseBody
    public List<Report1> loadReport1() {
        return sysServiceImpl.loadReport1();
    }
    
    /**
     * @Desc 客户销售额TOP10
     * @return 查询结果
     */
    @RequestMapping("/loadReport2")
    @ResponseBody
    public List<Report2> loadReport2() {
        return sysServiceImpl.loadReport2();
    }
}
