package com.bookshop.service;

import com.bookshop.beans.Book;
import com.bookshop.beans.SearchResultsPaging;

import java.util.List;

public interface SearchService {
    //分页查询
    List<Book> paging(SearchResultsPaging searchResultsPaging);//查询列表
    int count(SearchResultsPaging searchResultsPaging);//查询列表数

    //根据书的id查找书
    Book searchBookById(int id);
}
