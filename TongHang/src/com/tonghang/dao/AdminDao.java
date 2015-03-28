package com.tonghang.dao;


import com.tonghang.pojo.Administrator;
import com.tonghang.pojo.User;

import java.util.List;
import java.util.Map;

public interface AdminDao{
    public User findUserByName(String username);
    public Map<String,Object> getObjectUser(Map<String,Object> condition);
}