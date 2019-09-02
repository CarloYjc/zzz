package com.zzz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.zzz.mapper.ReportMapper;
import com.zzz.mapper.TbUserMapper;
import com.zzz.pojo.Report1;
import com.zzz.pojo.Report2;
import com.zzz.pojo.TbUser;
import com.zzz.pojo.TbUserExample;
import com.zzz.pojo.TbUserExample.Criteria;
import com.zzz.service.SysService;

@Service
public class SysServiceImpl implements SysService {

	@Autowired
	private TbUserMapper userMapper;
	
	@Autowired
    private ReportMapper reportMapper;

	@Override
	public TbUser login(String username, String password) {
		// 对密码加密
		password = DigestUtils.md5DigestAsHex(password.getBytes());
		TbUserExample example = new TbUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(password);
		List<TbUser> user = userMapper.selectByExample(example);
		if (user != null && user.size() > 0) {
			return user.get(0);
		}
		return null;
	}

	@Override
	public void updatePwd(TbUser user) {
		user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
		userMapper.updateByPrimaryKey(user);
	}

    @Override
    public List<Report1> loadReport1() {
        return reportMapper.loadReport1();
    }
    
    @Override
    public List<Report2> loadReport2() {
        return reportMapper.loadReport2();
    }

}
