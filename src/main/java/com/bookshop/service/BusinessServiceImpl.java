package com.bookshop.service;

import com.bookshop.beans.Book;
import com.bookshop.beans.Business;
import com.bookshop.beans.BusinessGoods;
import com.bookshop.dao.BusinessMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BusinessServiceImpl implements BusinessService{

    @Autowired
    BusinessMapper businessMapper;

    @Override
    public int addGoos(Book book) {
        return businessMapper.addGoos(book);
    }

    @Override
    public int addBusinessGoods(BusinessGoods businessGoods) {
        return businessMapper.addBusinessGoods(businessGoods);
    }

    @Override
    public List<BusinessGoods> queryBusinessGoodsByBusinessId(Business business) {
        return businessMapper.queryBusinessGoodsByBusinessId(business);
    }

    @Override
    public Business checkBusinessByUsername(String username) {
        return businessMapper.checkBusinessByUsername(username);
    }

    @Override
    public int addBusiness(Business business) {
        return businessMapper.addBusiness(business);
    }

    @Override
    public int deleteBusinessGoodsById(int id) {
        return businessMapper.deleteBusinessGoodsById(id);
    }

    @Override
    public int deleteBookById(int id) {
        return businessMapper.deleteBookById(id);
    }
}
