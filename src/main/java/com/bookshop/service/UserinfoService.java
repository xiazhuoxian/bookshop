package com.bookshop.service;

import com.bookshop.beans.Userinfo;
import com.bookshop.dao.UserinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2019/5/3.
 */
@Service
public class UserinfoService {
    @Autowired
    UserinfoMapper userinfoMapper;

    public void addUser(Userinfo userinfo) {
        userinfoMapper.insertSelective(userinfo);
    }

    public Userinfo selectUser(Integer userid) {
        Userinfo userinfo=userinfoMapper.selectByPrimaryKeyWithAccount(userid);
        return userinfo;
    }

    public void update(Userinfo userinfo) {
        userinfoMapper.updateByPrimaryKeySelective(userinfo);
    }

    public Userinfo searchUserByUsername(String username){
        return userinfoMapper.searchUserByUsername(username);
    };
}
