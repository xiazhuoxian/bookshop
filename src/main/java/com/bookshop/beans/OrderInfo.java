package com.bookshop.beans;

import java.util.Date;

public class OrderInfo {
    int orderid;
    Userinfo userinfo;
    Book book;
    int state;//购买状态,1:购物车，2：待支付，3：待发货，4：待收货
    int quantity;
    Date time;
    String evaluate;

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public Userinfo getUserinfo() {
        return userinfo;
    }

    public void setUserinfo(Userinfo userinfo) {
        this.userinfo = userinfo;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(String evaluate) {
        this.evaluate = evaluate;
    }

    public OrderInfo(int orderid, Userinfo userinfo, Book book, int state, int quantity, Date time, String evaluate) {

        this.orderid = orderid;
        this.userinfo = userinfo;
        this.book = book;
        this.state = state;
        this.quantity = quantity;
        this.time = time;
        this.evaluate = evaluate;
    }

    public OrderInfo() {

    }
}
