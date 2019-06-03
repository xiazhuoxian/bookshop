package com.bookshop.beans;

import java.util.Date;

public class Book {
    private Integer id;

    private String author;

    private String title;

    private Integer price;

    private Date publicationdate;

    private Integer salesvolume;

    private String address;

    private String remark;

    private String picture;

    public Book(Integer id, String author, String title, Integer price, Date publicationdate, Integer salesvolume, String address, String remark, String picture) {
        this.id = id;
        this.author = author;
        this.title = title;
        this.price = price;
        this.publicationdate = publicationdate;
        this.salesvolume = salesvolume;
        this.address = address;
        this.remark = remark;
        this.picture = picture;
    }

    public Book() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Date getPublicationdate() {
        return publicationdate;
    }

    public void setPublicationdate(Date publicationdate) {
        this.publicationdate = publicationdate;
    }

    public Integer getSalesvolume() {
        return salesvolume;
    }

    public void setSalesvolume(Integer salesvolume) {
        this.salesvolume = salesvolume;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }
}