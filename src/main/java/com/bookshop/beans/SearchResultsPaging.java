package com.bookshop.beans;

import java.util.List;

public class SearchResultsPaging {
    int pageNumber;//当前页数
    int totalPageCount;//总页数
    int listCount;//列表数
    int pageSize;//每页显示的列表数
    String queryCondition;//查询条件
    List<Book> bookList;//查询结果列表

    public SearchResultsPaging() {
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getTotalPageCount() {
        return totalPageCount;
    }

    public void setTotalPageCount(int totalPageCount) {
        this.totalPageCount = totalPageCount;
    }

    public int getListCount() {
        return listCount;
    }

    public void setListCount(int listCount) {
        this.listCount = listCount;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getQueryCondition() {
        return queryCondition;
    }

    public void setQueryCondition(String queryCondition) {
        this.queryCondition = queryCondition;
    }

    public List<Book> getBookList() {
        return bookList;
    }

    public void setBookList(List<Book> bookList) {
        this.bookList = bookList;
    }

    public SearchResultsPaging(int pageNumber, int totalPageCount, int listCount, int pageSize, String queryCondition, List<Book> bookList) {

        this.pageNumber = pageNumber;
        this.totalPageCount = totalPageCount;
        this.listCount = listCount;
        this.pageSize = pageSize;
        this.queryCondition = queryCondition;
        this.bookList = bookList;
    }
}
