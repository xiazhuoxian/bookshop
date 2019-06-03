package com.bookshop.dao;

import com.bookshop.SpringTestBase;
import com.bookshop.beans.Book;
import com.bookshop.beans.OrderInfo;
import com.bookshop.beans.Userinfo;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

public class OrderMapperTest extends SpringTestBase {
    @Autowired
    OrderMapper orderMapper;

    @Test
    public void testA(){
        //据用户id查询订单测试
        List<OrderInfo> orderInfos = orderMapper.queryOrderByUserId(new Userinfo(1, null, 1, 1, null, null));
        assertFalse("据用户id查询订单测试失败", orderInfos.isEmpty());
        for(OrderInfo o:orderInfos){
            Userinfo u=o.getUserinfo();
            Book b=o.getBook();
            System.out.println(u.getUsername()+":"+b.getAuthor());
        }
    }

    @Test
    public void testB(){
        //据订单id查询订单测试
        OrderInfo orderInfo = orderMapper.queryOrderByOrderid(1);
        assertEquals("据订单id查询订单测试失败", orderInfo.getBook().getAuthor(), "刘慈欣");
    }

    @Test
    public void testC(){
        //据订单id更新订单测试
        Userinfo userinfo = new Userinfo(1, "xiaxiaxiazhuo", 1, 1, "广东省广州市", "15119254299");
        Book book = new Book(1 , null, null, null, null, null, null, null, null);
        int rs = orderMapper.updateOrderState(new OrderInfo(21, userinfo, book, 4, 1, null, null));
        assertEquals("据订单id查询订单测试失败", rs, 1);
    }

    @Test
    public void testD(){
        //立刻购买 //订单插入
        Userinfo userinfo = new Userinfo(1, "xiaxiaxiazhuo", 1, 1, "广东省广州市", "15119254299");
        Book book = new Book(1 , null, null, null, null, null, null, null, null);
        int rs = orderMapper.buyNow(new OrderInfo(100, userinfo, book, 4, 1, null, null));
        assertEquals("订单插入测试失败", rs, 1);
    }

    @Test
    public void testE(){
        //据用户id增加订单数量测试
        Userinfo userinfo = new Userinfo(1, "xiaxiaxiazhuo", 1, 1, "广东省广州市", "15119254299");
        Book book = new Book(1 , null, null, null, null, null, null, null, null);
        int rs = orderMapper.addOrderQuantity(new OrderInfo(21, userinfo, book, 4, 1, null, null));
        assertEquals("据用户id增加订单数量测试失败", rs, 1);
    }

    @Test
    public void testF(){
        //根据用户id减少订单数量测试
        Userinfo userinfo = new Userinfo(1, "xiaxiaxiazhuo", 1, 1, "广东省广州市", "15119254299");
        Book book = new Book(1 , null, null, null, null, null, null, null, null);
        int rs = orderMapper.reduceOrderQuantity(new OrderInfo(21, userinfo, book, 4, 2, null, null));
        assertEquals("根据用户id减少订单数量测试失败", rs, 1);
    }

    /*
    @Test
    public void testG(){
        //根据用户id删除订单测试
        Userinfo userinfo = new Userinfo(1, "xiaxiaxiazhuo", 1, 1, "广东省广州市", "15119254299");
        Book book = new Book(1 , null, null, null, null, null, null, null, null);
        int rs = orderMapper.deleteOrder(new OrderInfo(22, userinfo, book, 4, 2, null, null));
        assertEquals("根据用户id删除订单测试失败", rs, 1);
    }
    */

    @Test
    public void testH(){
        //添加购物车
        Userinfo userinfo = new Userinfo(1, "xiaxiaxiazhuo", 1, 1, "广东省广州市", "15119254299");
        Book book = new Book(1 , null, null, null, null, null, null, null, null);
        int rs = orderMapper.addToCart(new OrderInfo(22, userinfo, book, 4, 1, null, null));
        assertEquals("添加购物车测试失败", rs, 1);
    }
}
