package com.bookshop;

import org.junit.FixMethodOrder;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@FixMethodOrder(MethodSorters.NAME_ASCENDING) //修复按命名序列测试
@RunWith(SpringJUnit4ClassRunner.class) //使用junit4进行测试
//@ContextConfiguration(value="classpath:applicationContext.xml")//加载配置文件
@ContextConfiguration(locations = { "classpath:applicationContext.xml",
        "file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml" })
//配置事务回滚
@Rollback()
@Transactional
public class SpringTestBase extends AbstractJUnit4SpringContextTests {

}
