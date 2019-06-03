package com.bookshop.beans;

public class Tradeitem {
    private Integer itemid;

    private Integer bookid;

    private Integer quantity;

    private Integer tradeid;

    private Book book;

    private Trade trade;

    public Tradeitem(Integer itemid, Integer bookid, Integer quantity, Integer tradeid) {
        this.itemid = itemid;
        this.bookid = bookid;
        this.quantity = quantity;
        this.tradeid = tradeid;
    }

    public Tradeitem() {
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Trade getTrade() {
        return trade;
    }

    public void setTrade(Trade trade) {
        this.trade = trade;
    }

    public Integer getItemid() {
        return itemid;
    }

    public void setItemid(Integer itemid) {
        this.itemid = itemid;
    }

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getTradeid() {
        return tradeid;
    }

    public void setTradeid(Integer tradeid) {
        this.tradeid = tradeid;
    }
}