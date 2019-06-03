package com.bookshop.controller;

import com.bookshop.SpringTestBase;
import com.bookshop.beans.Book;
import com.bookshop.beans.Msg;
import com.bookshop.beans.Userinfo;
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

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebAppConfiguration
public class BookControllerTest extends SpringTestBase{
    @Autowired
    WebApplicationContext context;
    MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.context).build();
    }

    /*
    @Test
    public void testA() throws Exception {
        MvcResult result = mockMvc
                .perform(MockMvcRequestBuilders.get("/getbook").param("pn", "1"))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();

        MockHttpServletResponse res = result.getResponse();
        ObjectMapper mapper = new ObjectMapper();
        Msg pi = mapper.readValue(res.getContentAsString(), Msg.class);
        assertEquals(pi.getCode(), 100);
        String str = pi.getExtend().get("pageInfo").toString();
        System.out.println(str);
    }
    */

    @Test
    public void testB() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/toHomePage").param("pn", "1"))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();

        MockHttpServletRequest request = result.getRequest();
        PageInfo page = (PageInfo) request.getAttribute("pageInfo");
        List<Book> list = page.getList();
        assertFalse(list.isEmpty());
        for (Book book : list) {
            System.out.println("ID："+book.getId()+"==>Name:"+book.getAuthor()+book.getPublicationdate()+book.getRemark());
        }
    }

    @Test
    public void testC() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/toPersonalCenter").param("pn", "1"))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();

        MockHttpServletRequest request = result.getRequest();
        PageInfo page = (PageInfo) request.getAttribute("pageInfo");
        List<Book> list = page.getList();
        assertFalse(list.isEmpty());
        for (Book book : list) {
            System.out.println("ID："+book.getId()+"==>Name:"+book.getAuthor()+book.getPublicationdate()+book.getRemark());
        }
    }

    @Test
    public void testD() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/toLogin"))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();
    }

    @Test
    public void testE() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/toRegister"))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();
    }

    @Test
    public void testF() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/text"))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();
    }

    @Test
    public void testG() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/logout"))
                .andDo(MockMvcResultHandlers.print())
                .andReturn();

        MockHttpServletRequest request = result.getRequest();
        Userinfo userinfo = (Userinfo) request.getSession().getAttribute("user");
        assertEquals("NUll",userinfo, null);
    }
}

