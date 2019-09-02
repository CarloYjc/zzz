package com.zzz.annotation;

import java.lang.reflect.Method;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.zzz.pojo.TbLog;
import com.zzz.pojo.TbUser;
import com.zzz.service.LogService;
import com.zzz.util.JsonUtils;
import com.zzz.util.MyUtil;
import com.zzz.util.WebUtils;

/**
 * 
 * @author Car1o  
 * 2019-05-27
 */

@Aspect
@Component
public class SystemLogAspect {
    // 注入Service用于把日志保存数据库
    @Resource
    private LogService logServiceImp;

    // 本地异常日志记录对象
    private static final Logger logger = LoggerFactory.getLogger(SystemLogAspect.class);

    // Controller层切点
    @Pointcut("@annotation(com.zzz.annotation.SysLog)")
    public void controllerAspect() {
    }

    /**
     * @Desc 前置通知:用于拦截Controller层记录用户的操作
     * @param joinPoint 切点
     */
    @Before("controllerAspect()")
    public void doBefore(JoinPoint joinPoint) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                .getRequest();
        // 读取session中的用户
        // HttpSession session = request.getSession();
        TbUser user = (TbUser) SecurityUtils.getSubject().getPrincipal();
        String requestURI = request.getRequestURI();
        String ip = WebUtils.getRemoteAddr(request);
        // String method = joinPoint.getSignature().getDeclaringTypeName() + "." +
        // joinPoint.getSignature().getName();
        String params = "";
        if (joinPoint.getArgs() != null && joinPoint.getArgs().length > 0) {
            for (int i = 0; i < joinPoint.getArgs().length; i++) {
                params += JsonUtils.objectToJson(joinPoint.getArgs()[i]) + ";";
            }
        }
        try {
            String operation = getControllerMethodDescription(joinPoint);
            String username = user.getUsername();
            TbLog log = new TbLog();
            log.setCreateTime(MyUtil.getNowDateStr2());
            log.setIp(ip);
            log.setOperation(operation);
            log.setParams(params);
            log.setUsername(username);
            log.setMethod(requestURI);
            logServiceImp.insertLog(log);
        } catch (Exception e) {
            logger.error("== 前置通知异常 ==");
            logger.error("异常信息:{}", e.getMessage());
        }
    }

    /**  
     * 获取注解中对方法的描述信息 用于Controller层注解  
     *  
     * @param joinPoint 切点  
     * @return 方法描述  
     * @throws Exception  
     */
    public static String getControllerMethodDescription(JoinPoint joinPoint) throws Exception {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class<?> targetClass = Class.forName(targetName);
        Method[] methods = targetClass.getMethods();
        String description = "";
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class<?>[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    description = method.getAnnotation(SysLog.class).value();
                    break;
                }
            }
        }
        return description;
    }
}
