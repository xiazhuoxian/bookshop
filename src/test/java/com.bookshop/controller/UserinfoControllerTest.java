package com.bookshop.controller;

import com.bookshop.SpringTestBase;
import com.bookshop.beans.Msg;
import com.bookshop.beans.Userinfo;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import javax.servlet.http.HttpSession;
import static org.junit.Assert.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebAppConfiguration
public class UserinfoControllerTest extends SpringTestBase {
    @Autowired
    WebApplicationContext context;
    MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.context).build();
    }

    @Test
    public void testA() throws Exception {
        //注册测试
        MvcResult result = mockMvc
                .perform(post("/addUserinfo?username=test&password=12345"))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();
    }

    @Test
    public void testB() throws Exception {
        //根据条件查询用户内容，登录测试
        MvcResult result = mockMvc
                .perform(post("/getUserinfoById?userId=1&pwd=1"))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();

        MockHttpServletResponse res = result.getResponse();
        ObjectMapper mapper = new ObjectMapper();
        Msg pi = mapper.readValue(res.getContentAsString(), Msg.class);
        assertEquals("登录测试失败", pi.getCode(), 100);
        String str = pi.getExtend().toString();
        System.out.println(str);

    }

    @Test
    public void testC() throws Exception {
        //根据条件查询用户内容，修改测试
        MvcResult result = mockMvc
                .perform(MockMvcRequestBuilders.get("/toPersonalInformationChange")
                        .session((MockHttpSession)getLoginSession()))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();

        MockHttpServletRequest request = result.getRequest();
        Userinfo userinfo = (Userinfo)request.getAttribute("userinfo");
        assertEquals("xiaxiaxiazhuo", userinfo.getUsername());
        System.out.println(userinfo.getUsername());
    }

    @Test
    public void testD() throws Exception {
        //更新用户内容测试
        MvcResult result = mockMvc
                .perform(MockMvcRequestBuilders
                        .post("/updateUserinfo?username=xiaxiaxiazhuo&password=1&location=广东省广州市&phone=test19562445128")
                        .session((MockHttpSession)getLoginSession()))
                .andDo(MockMvcResultHandlers.print())
                .andReturn();

        MockHttpServletRequest request = result.getRequest();
        Userinfo userinfo = (Userinfo)request.getSession().getAttribute("user");
        System.out.println(userinfo.getUsername());
    }

    //获得登录身份
    private HttpSession getLoginSession() throws Exception{
        MvcResult result = this.mockMvc
                .perform((post("/getUserinfoById?userId=1&pwd=1")))
                .andExpect(status().isOk())
                .andReturn();
        return result.getRequest().getSession();
    }
}
