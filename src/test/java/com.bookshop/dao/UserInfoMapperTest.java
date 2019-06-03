package com.bookshop.dao;

import com.bookshop.SpringTestBase;
import com.bookshop.beans.Userinfo;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.assertEquals;

public class UserInfoMapperTest extends SpringTestBase {
    @Autowired
    UserinfoMapper userinfoMapper;

    @Test
    public void testA(){
        //用户信息插入测试
        int rs = userinfoMapper.insertSelective(new Userinfo(100, "test", 3, 12345, "广州大学城", "13223227437"));
        assertEquals("用户信息插入测试失败", rs, 1);
    }

    @Test
    public void testB(){
        //用户信息查询测试
        Userinfo userinfo=userinfoMapper.selectByPrimaryKeyWithAccount(1);
        assertEquals("用户信息查询测试失败", userinfo.getUsername(), "xiaxiaxiazhuo");
    }

    @Test
    public void testC(){
        //用户信息更新测试
        int rs = userinfoMapper.updateByPrimaryKeySelective(new Userinfo(100, "test02", 3, 123456, "广州大学城", "13223227437"));
        assertEquals("用户信息更新测试失败", rs, 1);
    }

    //@AfterClass
    @Test
    public void testD(){
        int rs = userinfoMapper.deleteByPrimaryKey(100);
        assertEquals("用户信息测试恢复现场失败", rs , 1);
    }
}
