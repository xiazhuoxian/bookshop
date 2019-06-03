package com.bookshop.service;

import com.bookshop.beans.Book;
import com.bookshop.beans.SearchResultsPaging;
import com.bookshop.dao.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchServiceImpl implements SearchService {
    @Autowired
    SearchMapper searchMapper;

    @Override
    public List<Book> paging(SearchResultsPaging searchResultsPaging) {
        return searchMapper.paging(searchResultsPaging);
    }

    @Override
    public int count(SearchResultsPaging searchResultsPaging) {
        return searchMapper.count(searchResultsPaging);
    }

    @Override
    public Book searchBookById(int id) {
        return searchMapper.searchBookById(id);
    }
}
