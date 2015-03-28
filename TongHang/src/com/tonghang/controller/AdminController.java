package com.tonghang.controller;/**
 * Description : UserController
 * Created by YangZH on 2015/3/17
 *  15:18
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tonghang.pojo.User;
import com.tonghang.service.AdminService;
import com.tonghang.util.CharsetUtil;

/**
 * Description : AdminController
 * Created by YangZH on 2015/3/17
 * 15:18
 */

@Controller("adminController")
@RequestMapping("/user")
public class AdminController {
    private AdminService adminService;
    public AdminService getAdminService() {
        return adminService;
    }
    @Resource(name="adminService")
    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    @RequestMapping(value="/search",method=RequestMethod.GET)
    public String search(HttpServletRequest request,@RequestParam String username,@RequestParam String sex,
                                     @RequestParam String birth,@RequestParam String provence,@RequestParam Integer nowpage,@RequestParam boolean isall) throws Exception{
        Map<String,Object> condition = new HashMap<String,Object>();
        System.out.println(birth);
        condition.put("username",CharsetUtil.changeCharset(username, "utf-8"));
        condition.put("sex",CharsetUtil.changeCharset(sex, "utf-8"));
        condition.put("birth",birth);
        condition.put("provence",CharsetUtil.changeCharset(provence, "utf-8"));
        System.out.println("nowpage"+nowpage+"..");
		condition.put("nowpage",(nowpage-1)*5);
		condition.put("isall",isall);
		Map<String,Object> result = adminService.getObjectUser(condition);
        request.setAttribute("pages", (List<Integer>) result.get("pages"));
        request.setAttribute("user",(List<User>) result.get("users"));
        System.out.println(result.values());
        request.setAttribute("count",((List<User>) result.get("users")).size());
        return "user/index";
    }
}
