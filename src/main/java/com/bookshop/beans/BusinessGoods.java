package com.bookshop.beans;

public class BusinessGoods {
    int id;
    int businessid;
    int bookid;
    Business business;
    Book book;

    public BusinessGoods(int businessid, int bookid) {
        this.businessid = businessid;
        this.bookid = bookid;
    }

    public BusinessGoods(int id, int businessid, int bookid, Business business, Book book) {

        this.id = id;
        this.businessid = businessid;
        this.bookid = bookid;
        this.business = business;
        this.book = book;
    }

    public int getBusinessid() {

        return businessid;
    }

    public void setBusinessid(int businessid) {
        this.businessid = businessid;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Business getBusiness() {
        return business;
    }

    public void setBusiness(Business business) {
        this.business = business;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public BusinessGoods(int id, Business business, Book book) {

        this.id = id;
        this.business = business;
        this.book = book;
    }

    public BusinessGoods() {

    }
}
