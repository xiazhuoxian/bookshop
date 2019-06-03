package com.bookshop.controller;

import com.bookshop.SpringTestBase;
import com.bookshop.beans.Book;
import com.bookshop.beans.Msg;
import com.bookshop.beans.SearchResultsPaging;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebAppConfiguration
public class SearchControllerTest extends SpringTestBase {
    @Autowired
    WebApplicationContext context;
    MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.context).build();
    }

    @Test
    public void testA() throws Exception {
        //查找书籍测试
        MvcResult result = mockMvc
                .perform(MockMvcRequestBuilders.post("/toSearchResultsPage?pageNumber=1"))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();

        MockHttpServletRequest request = result.getRequest();
        SearchResultsPaging search = (SearchResultsPaging) request.getAttribute("result");
        assertFalse(search.getBookList().isEmpty());
        System.out.println(search.getBookList().get(1).getAuthor());
    }

    @Test
    public void testB() throws Exception {
        //据id查找书籍测试
        MvcResult result = mockMvc
                .perform(MockMvcRequestBuilders.post("/toBookInfoPage?id=1"))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();

        MockHttpServletRequest request = result.getRequest();
        Book book = (Book) request.getAttribute("book");
        assertEquals(book.getAuthor(), "刘慈欣");
        System.out.println(book.getAuthor()+book.getAddress());
    }
}
