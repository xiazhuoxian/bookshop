package com.bookshop.beans;

import java.util.Date;

public class Trade {
    private Integer tradeid;

    private Integer userid;

    private Date tradetime;

    private Userinfo userinfo;

    public Trade(Integer tradeid, Integer userid, Date tradetime) {
        this.tradeid = tradeid;
        this.userid = userid;
        this.tradetime = tradetime;
    }

    public Trade() {
    }

    public Userinfo getUserinfo() {
        return userinfo;
    }

    public void setUserinfo(Userinfo userinfo) {
        this.userinfo = userinfo;
    }

    public Integer getTradeid() {
        return tradeid;
    }

    public void setTradeid(Integer tradeid) {
        this.tradeid = tradeid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getTradetime() {
        return tradetime;
    }

    public void setTradetime(Date tradetime) {
        this.tradetime = tradetime;
    }
}