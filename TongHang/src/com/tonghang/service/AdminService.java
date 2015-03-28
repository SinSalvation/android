package com.tonghang.service;

import com.tonghang.dao.AdminDao;
import com.tonghang.pojo.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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
}
