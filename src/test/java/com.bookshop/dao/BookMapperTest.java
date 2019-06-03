package com.bookshop.dao;

import com.bookshop.SpringTestBase;
import com.bookshop.beans.Book;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

public class BookMapperTest extends SpringTestBase {
    @Autowired
    BookMapper bookMapper;

    @Test
    public void testA(){
        //书籍无条件查询测试
        List<Book> book = bookMapper.selectByExample(null);
        assertFalse("书籍查询测试失败, 返回为空!", book.isEmpty());
    }

    @Test
    public void testB(){
        //书籍据主键查询测试
        Book book = bookMapper.selectByPrimaryKey(1);
        assertEquals("书籍查询测试失败", book.getAuthor(), "刘慈欣");
    }
}
