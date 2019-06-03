package com.bookshop.beans;

public class Userinfo {
    private Integer userid;

    private String username;

    private Integer accountid;

    private Integer password;

    private String location;

    private String phone;

    private Account account;

    public Account getAccount() {
        return account;
    }

    public Userinfo() {
    }

    public Userinfo(Integer userid, String username, Integer accountid, Integer password, String location, String phone) {

        this.userid = userid;
        this.username = username;
        this.accountid = accountid;
        this.password = password;
        this.location = location;
        this.phone = phone;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Integer getAccountid() {
        return accountid;
    }

    public void setAccountid(Integer accountid) {
        this.accountid = accountid;
    }

    public Integer getPassword() {
        return password;
    }

    public void setPassword(Integer password) {
        this.password = password;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location == null ? null : location.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }
}