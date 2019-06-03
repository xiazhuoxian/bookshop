package com.bookshop.service;


import com.bookshop.beans.Book;
import com.bookshop.dao.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2019/5/2.
 */
@Service
public class BookService {

    @Autowired
    BookMapper bookMapper;
    public List<Book> getAll() {

        return bookMapper.selectByExample(null);
    }

    public Book selectBook(Integer id) {
            Book book=bookMapper.selectByPrimaryKey(id);
            return book;
    }

}
