package com.bookshop.dao;

import com.bookshop.SpringTestBase;
import com.bookshop.beans.Book;
import com.bookshop.beans.SearchResultsPaging;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class SearchMapperTest extends SpringTestBase {
    @Autowired
    SearchMapper searchMapper;

    @Test
    public void testA (){
        SearchResultsPaging searchResultsPaging=new SearchResultsPaging();
        int pageSize = 20;
        searchResultsPaging.setPageSize(pageSize);
        searchResultsPaging.setPageNumber(1);
        searchResultsPaging.setListCount(searchMapper.count(searchResultsPaging));
        searchResultsPaging.setTotalPageCount(searchResultsPaging.getListCount()%pageSize==0? searchResultsPaging.getListCount()/pageSize : searchResultsPaging.getListCount()/pageSize+1 );
        searchResultsPaging.setBookList(searchMapper.paging(searchResultsPaging));
        assertTrue("书籍搜索测试失败", searchResultsPaging.getListCount()!=0);
    }

    @Test
    public void testB(){
        Book book = searchMapper.searchBookById(1);
        System.out.println(book.getAuthor());
        assertEquals("根据id查询书籍测试失败", book.getAuthor(), "刘慈欣");
    }

}
