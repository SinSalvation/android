package com.tonghang.dao;


import java.util.List;
import java.util.Map;

import com.tonghang.pojo.Label;
import com.tonghang.pojo.User;

public interface AdminDao{
    public Map<String,Object> getObjectUser(Map<String,Object> condition);
    public User findUserByAttribute(User u);
    public List<Label> findLabelByUserId(User user);
    public void deleteUser(int id);
    public void isolateUser(int id,boolean isolate);
}