package com.bookshop.service;

import com.bookshop.beans.Book;
import com.bookshop.beans.Business;
import com.bookshop.beans.BusinessGoods;

import java.util.List;

public interface BusinessService {
    public int addGoos(Book book);
    public int addBusiness(Business business);
    public Business checkBusinessByUsername(String username);
    public List<BusinessGoods> queryBusinessGoodsByBusinessId(Business business);
    public int addBusinessGoods(BusinessGoods businessGoods);
    public int deleteBusinessGoodsById(int id);
    public int deleteBookById(int id);
}
