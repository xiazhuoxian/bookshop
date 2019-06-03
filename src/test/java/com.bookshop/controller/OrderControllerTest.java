package com.bookshop.controller;

import com.bookshop.SpringTestBase;
import com.bookshop.beans.Book;
import com.bookshop.beans.Msg;
import com.bookshop.beans.OrderInfo;
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

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebAppConfiguration
public class OrderControllerTest extends SpringTestBase {
    @Autowired
    WebApplicationContext context;
    MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.context).build();
    }

    @Test
    public void testA() throws Exception {
        MvcResult result = mockMvc
                .perform(get("/toAllOrderPage")
                .session((MockHttpSession) getLoginSession()))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();

        MockHttpServletRequest request = result.getRequest();
        List<OrderInfo> orderInfo = (List<OrderInfo>) request.getAttribute("orders");
        for(OrderInfo o:orderInfo){
            Userinfo u=o.getUserinfo();
            Book b=o.getBook();
            System.out.println(u.getUsername()+":"+b.getAuthor());
        }
    }

    @Test
    public void testB() throws Exception {
        //购物车结算测试
        MvcResult result = mockMvc
                .perform(get("/settlement_cart")
                        .param("selection", "1")
                        .session((MockHttpSession) getLoginSession()))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();
        List<OrderInfo> orders;
        MockHttpServletRequest request = result.getRequest();
        orders = (List<OrderInfo>) request.getAttribute("orders");
        int totalPrice = (int) request.getAttribute("totalPrice");
        assertEquals(totalPrice, 33);
        System.out.println(totalPrice);
        System.out.println(orders);
    }

    @Test
    public void testC() throws Exception {
        //马上购买结算测试
        MvcResult result = mockMvc
                .perform(get("/settlement_now")
                        .param("bookid", "1")
                        .param("quantity", "4")
                        .session((MockHttpSession) getLoginSession()))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();

        MockHttpServletRequest request = result.getRequest();
        Book book = (Book) request.getAttribute("b");
        int totalPrice = (int) request.getAttribute("totalPrice");
        int quantity = (int) request.getAttribute("quantity");
        assertEquals(totalPrice, 132);
        assertEquals(quantity, 4);
        assertEquals("刘慈欣", book.getAuthor());
        System.out.println(totalPrice);
        System.out.println(quantity);
        System.out.println(book.getAuthor());
    }

    @Test
    public void testD() throws Exception {
        //付钱payCart测试
        MockHttpSession session = getPay();
        MvcResult result = mockMvc
                .perform(get("/payCart")
                        .session(session))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();
    }

    @Test
    public void testE() throws Exception {
        //付钱payNow测试
        MvcResult result = mockMvc
                .perform(get("/payNow")
                        .param("bookid", "1")
                        .param("quantity", "4")
                        .session((MockHttpSession) getLoginSession()))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();
    }

    @Test
    public void testF() throws Exception {
        //据订单id增加数量测试
        MvcResult result = mockMvc
                .perform(get("/addOrderQuantity")
                        .param("orderid", "2")
                        .param("quantity", "11")
                        .session((MockHttpSession) getLoginSession()))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();
    }

    @Test
    public void testG() throws Exception {
        //据订单id减少数量测试
        MvcResult result = mockMvc
                .perform(get("/addOrderQuantity")
                        .param("orderid", "2")
                        .param("quantity", "11")
                        .session((MockHttpSession) getLoginSession()))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();
    }

    @Test
    public void testH() throws Exception {
        //据订单id删除订单测试
        MvcResult result = mockMvc
                .perform(get("/deleteOrder")
                        .param("orderid", "29")
                        .session((MockHttpSession) getLoginSession()))
                .andDo(MockMvcResultHandlers.print())
                .andReturn();
    }

    @Test
    public void testI() throws Exception {
        //据用户id和bookid增加订单测试 （添加到购物车）
        MvcResult result = mockMvc
                .perform(get("/addToCart")
                        .param("userid", "1")
                        .param("bookid", "1")
                        .param("quantity", "2")
                        .session((MockHttpSession) getLoginSession()))
                .andDo(MockMvcResultHandlers.print())
                .andReturn();
    }

    public void testJ() throws Exception {
        //申请退款测试
        MvcResult result = mockMvc
                .perform(get("/refund")
                        .param("orderid", "21")
                        .session((MockHttpSession) getLoginSession()))
                .andDo(MockMvcResultHandlers.print())
                .andReturn();
    }

    //获得登录身份
    private HttpSession getLoginSession() throws Exception{
        MvcResult result = this.mockMvc
                .perform((post("/getUserinfoById?userId=1&pwd=1")))
                .andExpect(status().isOk())
                .andReturn();
        return result.getRequest().getSession();
    }

    //使服务端设置pay
    private MockHttpSession getPay() throws Exception{
        MockHttpSession session = (MockHttpSession) getLoginSession();
        MvcResult result = mockMvc
                .perform(get("/settlement_cart")
                        .param("selection", "1")
                        .session(session))
                .andExpect(status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();
        return session;
    }
}
