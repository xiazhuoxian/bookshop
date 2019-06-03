package com.bookshop.controller;

import com.bookshop.beans.Book;
import com.bookshop.beans.Business;
import com.bookshop.beans.BusinessGoods;
import com.bookshop.service.BusinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class BusinessController {
    @Autowired
    BusinessService businessService;

    @RequestMapping("/addGoods")
    public String addGoods(MultipartFile file, Book book, ModelMap map,HttpServletRequest request) throws IOException{
        /*String filePath="D:\\upload";*/
        String filePath="/usr/local/java/upload";
        String originalFilename =file.getOriginalFilename();
        String newFileName=UUID.randomUUID()+originalFilename;
        File targetFile=new File(filePath,newFileName);
        file.transferTo(targetFile);
        book.setPicture(newFileName);
        businessService.addGoos(book);
        HttpSession session=request.getSession();
        Business business=(Business)session.getAttribute("business");
        BusinessGoods businessGoods=new BusinessGoods(business.getId(),book.getId());
        businessService.addBusinessGoods(businessGoods);
        return "redirect:toPersonalCenterBusiness";
    }

    @RequestMapping("/deleteGoods")
    public String deleteGoods(int businessgoodsid,int bookid){
        businessService.deleteBusinessGoodsById(businessgoodsid);
        /*businessService.deleteBookById(bookid);*/
        return "redirect:toPersonalCenterBusiness";
    }

    @RequestMapping("/addBusiness")
    public String addBusiness(Business business, HttpServletRequest request){
        businessService.addBusiness(business);
        Business b=businessService.checkBusinessByUsername(business.getUsername());
        HttpSession session=request.getSession(true);
        session.setAttribute("business",b);
        return "redirect:toPersonalCenterBusiness";
    }

    @RequestMapping("/loginBusiness")
    @ResponseBody
    public Business loginBusiness(@RequestParam("username")String username,
                                  @RequestParam("pwd")String pwd,
                                  HttpServletRequest request){
        Business business=businessService.checkBusinessByUsername(username);
        if(business.getUsername().equals(username)&&business.getPassword().equals(pwd)){
            HttpSession session=request.getSession(true);
            session.setAttribute("business",business);
        }
        return business;
    }

    @RequestMapping("/toPersonalCenterBusiness")
    public String toPersonalCenterBusiness(HttpServletRequest request){
        HttpSession session=request.getSession();
        Business business=(Business) session.getAttribute("business");
        List<BusinessGoods> businessGoods=businessService.queryBusinessGoodsByBusinessId(business);
        request.setAttribute("businessGoods",businessGoods);
        return "personalCenterBusiness";
    }

    @RequestMapping("/checkBusinessIfExit")
    @ResponseBody
    public String checkBusinessIfExit(String username){
        String sign="noExit";
        Business business=businessService.checkBusinessByUsername(username);
        if(business!=null)
            sign="exit";
        return sign;
    }

    @RequestMapping("/logoutBusiness")
    private String logout(HttpServletRequest request){
        HttpSession session=request.getSession();
        session.removeAttribute("business");
        return "redirect:/toHomePage";
    }

    @RequestMapping("/toLoginBusiness")
    public String toLoginBusiness(){
        return "loginBusiness";
    }

    @RequestMapping("/toRegisterBusiness")
    public String toRegisterBusiness(){
        return "registerBusiness";
    }

    @RequestMapping("/toAddGoods")
    public String toAddGoods(){
        return "addGoods";
    }

}
