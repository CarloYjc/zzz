package com.zzz.test;

import java.math.BigDecimal;
import java.util.Random;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zzz.mapper.TbItemMapper;
import com.zzz.pojo.TbItem;

/**
 * 随机生成货号
 * 推荐Spring的项目就可以使用Spring的单元测试，可以自动注入我们需要的组件
 *  1、导入SpringTest模块
 *  2、@ContextConfiguration指定Spring配置文件的位置 
 *  3、直接autowired要使用的组件即可
 * @author Car1o  
 * 2019-01-03
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/applicationContext-dao.xml")
public class MapperTest {
    @Autowired
    TbItemMapper itemMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void testCRUD() {
        // 批量插入货号，使用可以执行批量操作的sqlSession。
        TbItemMapper mapper = sqlSession.getMapper(TbItemMapper.class);
        for (int i = 0; i < 1000; i++) {
            String uid = UUID.randomUUID().toString().substring(0, 8).toUpperCase();
            mapper.insertSelective(new TbItem(null, uid, "货号" + i,
                    BigDecimal.valueOf(((double) new Random().nextInt(1000)) / 100), "", "", "1"));
        }
        System.out.println("批量完成");
    }
}
