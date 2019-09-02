package com.zzz.service;

import java.util.List;

import com.zzz.pojo.Report1;
import com.zzz.pojo.Report2;
import com.zzz.pojo.TbUser;

public interface SysService {
	// 登陆
	TbUser login(String username, String password);

	// 修改密码
	void updatePwd(TbUser user);

    // 报表1
	List<Report1> loadReport1();
	
	// 报表2
	List<Report2> loadReport2();
}
