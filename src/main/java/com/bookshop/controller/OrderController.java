package com.bookshop.controller;

import com.bookshop.beans.Book;
import com.bookshop.beans.OrderInfo;
import com.bookshop.beans.Userinfo;
import com.bookshop.service.BookService;
import com.bookshop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    OrderService orderService;
    @Autowired
    BookService bookService;

    //根据用户的id查询所有订单，用于购物车
    @RequestMapping("/queryOrderByUserId")
    private String queryOrderByUserId(HttpServletRequest request){
        HttpSession session=request.getSession();
        Userinfo userinfo=(Userinfo)session.getAttribute("user");
        List<OrderInfo> orderInfo=orderService.queryOrderByUserId(userinfo);
        request.setAttribute("orders",orderInfo);
        return "shoppingCart";

    }

    //根据用户的id查询所有订单，用户 我的订单
    @RequestMapping("/toAllOrderPage")
    private String toAllOrderPage(HttpServletRequest request){
        HttpSession session=request.getSession();
        Userinfo userinfo=(Userinfo)session.getAttribute("user");
        List<OrderInfo> orderInfo=orderService.queryOrderByUserId(userinfo);
        request.setAttribute("orders",orderInfo);
        return "allOrderPage";

    }

    //购物车->结算
    @RequestMapping("/settlement_cart")
    private String settlement(HttpServletRequest request){
            String[] s=request.getParameterValues("selection");
            List<OrderInfo> orders=new ArrayList();
            int totalPrice=0;
            for (int i=0;i<s.length;i++){
                OrderInfo orderInfo=orderService.queryOrderByOrderid(Integer.parseInt(s[i]));
                orders.add(orderInfo);
                totalPrice=totalPrice+orderInfo.getBook().getPrice()*orderInfo.getQuantity();
            }
            request.setAttribute("orders",orders);
            request.setAttribute("totalPrice",totalPrice);
            HttpSession session=request.getSession();
            session.setAttribute("pay",orders);
        return "stellmentPage_cart";
    }

    //马上购买->结算
    @RequestMapping("/settlement_now")
    private String settlement(@RequestParam(value = "bookid",required = false) Integer bookid,
                              @RequestParam(value = "quantity",required = false) Integer quantity,
                              HttpServletRequest request){
        Book book=bookService.selectBook(bookid);
        request.setAttribute("b",book);
        request.setAttribute("totalPrice",book.getPrice()*quantity);
        request.setAttribute("quantity",quantity);
        return "stellmentPage_now";
    }

    //付钱-购物车
    @RequestMapping("/payCart")
    @ResponseBody
    private String pay(HttpServletRequest request){
        System.out.println("购物车支付");
        HttpSession session=request.getSession();
        List<OrderInfo> orders=(List<OrderInfo>)session.getAttribute("pay");
        for(OrderInfo o:orders){
            o.setState(4);
            orderService.updateOrderState(o);
        }
        return "success";
    }

    //付钱-立刻购买
    @RequestMapping("/payNow")
    @ResponseBody
    private String payNow(@RequestParam(value = "bookid") int bookid,
                          @RequestParam(value = "quantity") int quantity,
                          HttpServletRequest request){
        HttpSession session=request.getSession();
        Userinfo user=(Userinfo) session.getAttribute("user");
        OrderInfo orderInfo=new OrderInfo();
        Userinfo userinfo=new Userinfo();
        userinfo.setUserid(user.getUserid());
        Book book=new Book();
        book.setId(bookid);

        orderInfo.setUserinfo(userinfo);
        orderInfo.setBook(book);
        orderInfo.setQuantity(quantity);
        orderInfo.setState(4);

        orderService.buyNow(orderInfo);
        return "success";
    }

    //根据用户id增加订单数量
    @RequestMapping("/addOrderQuantity")
    @ResponseBody
    private String addOrderQuantity(OrderInfo orderInfo){
        orderService.addOrderQuantity(orderInfo);
        return "success";
    }
    //根据用户id减少订单数量
    @RequestMapping("/reduceOrderQuantity")
    @ResponseBody
    private String reduceOrderQuantity(OrderInfo orderInfo){
        orderService.reduceOrderQuantity(orderInfo);
        return "success";
    }

    //根据用户id删除订单
    @RequestMapping("/deleteOrder")
    private String deleteOrder(OrderInfo orderInfo){
        orderService.deleteOrder(orderInfo);
        return "redirect:queryOrderByUserId";
    }

    //添加到购物车
    @RequestMapping("/addToCart")
    @ResponseBody
    private String addToCart(int userid,int bookid,int quantity){
        Date time=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        OrderInfo orderInfo=new OrderInfo();
        Userinfo userinfo=new Userinfo();
        userinfo.setUserid(userid);
        orderInfo.setUserinfo(userinfo);
        Book book=new Book();
        book.setId(bookid);
        orderInfo.setBook(book);
        orderInfo.setQuantity(quantity);
        orderInfo.setTime(time);
        orderService.addToCart(orderInfo);
        return "success";
    }

    //申请退款
    @RequestMapping("/refund")
    private String refund(OrderInfo orderInfo){
        orderInfo.setState(5);
        orderService.updateOrderState(orderInfo);
        return "redirect:/toAllOrderPage";
    }
}
