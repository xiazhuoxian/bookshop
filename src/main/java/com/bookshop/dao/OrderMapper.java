package com.bookshop.dao;

import com.bookshop.beans.OrderInfo;
import com.bookshop.beans.Userinfo;

import java.util.List;

public interface OrderMapper {
    //根据用户id查询用户的订单信息
    List<OrderInfo> queryOrderByUserId(Userinfo userinfo);
    //根据用户id增加订单数量
    int addOrderQuantity(OrderInfo orderInfo);
    //根据用户id减少订单数量
    int reduceOrderQuantity(OrderInfo orderInfo);
    //根据用户id删除订单
    int deleteOrder(OrderInfo orderInfo);
    //添加到购物车
    int addToCart(OrderInfo orderInfo);
    //根据订单id查询订单
    OrderInfo queryOrderByOrderid(int orderid);
    //更新订单的状态
    int updateOrderState(OrderInfo orderInfo);
    //立即购买
    int buyNow(OrderInfo orderInfo);
}
