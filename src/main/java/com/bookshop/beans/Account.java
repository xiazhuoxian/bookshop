package com.bookshop.beans;

public class Account {
    private Integer accountid;

    private Integer balance;

    public Account(Integer accountid, Integer balance) {
        this.accountid = accountid;
        this.balance = balance;
    }

    public Account() {
    }

    public Integer getAccountid() {
        return accountid;
    }

    public void setAccountid(Integer accountid) {
        this.accountid = accountid;
    }

    public Integer getBalance() {
        return balance;
    }

    public void setBalance(Integer balance) {
        this.balance = balance;
    }
}