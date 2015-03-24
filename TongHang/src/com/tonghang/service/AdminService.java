package com.tonghang.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tonghang.dao.AdminDao;
import com.tonghang.pojo.IsolateLog;
import com.tonghang.pojo.Label;
import com.tonghang.pojo.User;

/**
 * Description : AdminService
 * Created by YangZH on 2015/3/17
 * 15:22
 */

@Service("adminService")
public class AdminService {
    private AdminDao adminDao;

    public AdminDao getAdminDao() {
        return adminDao;
    }
    @Resource(name="adminDao")
    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

    public Map<String,String> validateUser(User user){
        return null;
    }

    public Map<String,Object> getObjectUser(Map<String,Object> condition){
        return adminDao.getObjectUser(condition);
    }
    
    public String getUserByEmail(String email){
    	return null;
    }
    public User getUserByAttribute(User user){
    	return adminDao.findUserByAttribute(user);
    }
    public List<Label> getLabelsByUser(User user){
    	return adminDao.findLabelByUserId(user);
    }
    public void deleteUser(int id){
    	adminDao.deleteUser(id);
    }
    public void isolateUser(int id,IsolateLog isolatelog,boolean isolate){
    	adminDao.isolateUser(id,isolatelog,isolate);
    }
}
