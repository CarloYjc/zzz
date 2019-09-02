package com.zzz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.zzz.pojo.Report1;
import com.zzz.pojo.Report2;

public interface ReportMapper {

    @Select("SELECT a.ym, IfNULL(b.atamt, 0.00) AS atamt , IfNULL(b.tamt, 0.00) AS tamt FROM ( SELECT DATE_FORMAT(CURDATE(), '%Y-%m') AS `ym` UNION SELECT DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m') AS `ym` UNION SELECT DATE_FORMAT(CURDATE() - INTERVAL 2 MONTH, '%Y-%m') AS `ym` UNION SELECT DATE_FORMAT(CURDATE() - INTERVAL 3 MONTH, '%Y-%m') AS `ym` UNION SELECT DATE_FORMAT(CURDATE() - INTERVAL 4 MONTH, '%Y-%m') AS `ym` UNION SELECT DATE_FORMAT(CURDATE() - INTERVAL 5 MONTH, '%Y-%m') AS `ym` UNION SELECT DATE_FORMAT(CURDATE() - INTERVAL 6 MONTH, '%Y-%m') AS `ym` UNION SELECT DATE_FORMAT(CURDATE() - INTERVAL 7 MONTH, '%Y-%m') AS `ym` UNION SELECT DATE_FORMAT(CURDATE() - INTERVAL 8 MONTH, '%Y-%m') AS `ym` UNION SELECT DATE_FORMAT(CURDATE() - INTERVAL 9 MONTH, '%Y-%m') AS `ym` UNION SELECT DATE_FORMAT(CURDATE() - INTERVAL 10 MONTH, '%Y-%m') AS `ym` UNION SELECT DATE_FORMAT(CURDATE() - INTERVAL 11 MONTH, '%Y-%m') AS `ym` ) a LEFT JOIN ( SELECT DATE_FORMAT(order_date, '%Y-%m') AS `ym`, SUM(tamt) AS `tamt` , SUM(atamt) AS `atamt` FROM tb_sell_order WHERE order_date > DATE_FORMAT(CURDATE() - INTERVAL 11 MONTH, '%Y-%m') GROUP BY DATE_FORMAT(order_date, '%Y-%m') ) b ON a.ym = b.ym ORDER BY ym")
    List<Report1> loadReport1();
    
    @Select("SELECT cust_name AS custName, SUM(tamt) AS tamt FROM tb_sell_order GROUP BY cust_name HAVING SUM(tamt) > 0 ORDER BY tamt DESC LIMIT 10")
    List<Report2> loadReport2();
}