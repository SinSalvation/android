package com.tonghang.controller;/**
 * Description : UserController
 * Created by YangZH on 2015/3/17
 *  15:18
 */

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tonghang.pojo.IsolateLog;
import com.tonghang.pojo.Label;
import com.tonghang.pojo.User;
import com.tonghang.service.AdminService;
import com.tonghang.util.CharsetUtil;
import com.tonghang.util.TimeUtil;

/**
 * Description : AdminController
 * Created by YangZH on 2015/3/17
 * 15:18
 * 集中处理 用户操作 模块的controller
 */

@Controller("adminController")
@RequestMapping("user")
@Scope("prototype") 
public class AdminController {
    private AdminService adminService;

    public AdminService getAdminService() {
        return adminService;
    }
    @Resource(name="adminService")
    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    /**
     * 
     * @param request
     * @param username
     * @param sex
     * @param birth
     * @param provence
     * @param nowpage
     * @param isall
     * @return
     * @throws Exception
     * 处理管理员按条件搜索的类
     */
    @RequestMapping(value="/search",method=RequestMethod.GET)
    public String search(HttpServletRequest request,@RequestParam String username,@RequestParam String sex,
                                     @RequestParam String birth,@RequestParam String provence,@RequestParam Integer nowpage,@RequestParam boolean isall) throws Exception{
        Map<String,Object> condition = new HashMap<String,Object>();
        condition.put("username",CharsetUtil.changeCharset(username, "utf-8"));
        condition.put("sex",CharsetUtil.changeCharset(sex, "utf-8"));
        condition.put("birth",birth);
        condition.put("provence",CharsetUtil.changeCharset(provence, "utf-8"));
        System.out.println("nowpage"+nowpage+"..");
		condition.put("nowpage",(nowpage-1)*5);
		condition.put("isall",isall);
		Map<String,Object> result = adminService.getObjectUser(condition);
        request.setAttribute("pages", (List<Integer>) result.get("pages"));
        request.setAttribute("users",(List<User>) result.get("users"));
        request.setAttribute("count",(Integer) result.get("allcount"));
        return "user/index";
    }
    
    /**
     * 
     * @param response
     * @param email
     * @throws Exception
     * 处理管理员点击邮箱号查看用户详情的类，查找完后重定向到url转换的方法 changeUrlServlet。
     * 重定向的URL带有参数ID
     */
    @RequestMapping(value="/{email}")
    public void checkupUser(HttpServletRequest request,HttpServletResponse response,@PathVariable String email) throws Exception{
    	User u = new User();
    	u.setEmail(email);
    	User user = adminService.getUserByAttribute(u);
    	response.sendRedirect(user.getId()+"/check");
    }
    
    /**
     * 
     * @param request
     * 管理员登陆后进入主页 url为 localhost:8080/TongHang/user/index 表示是用户操作的首页。
     * 该方法显示左右的用户信息，设置默认的当前页码为1（从数据表索引为0开始查找）
     */
    @RequestMapping(value="index",method=RequestMethod.GET)
    public void index(HttpServletRequest request){ 
    	Map<String,Object> condition = new HashMap<String,Object>();
    	condition.put("isall", true);
    	condition.put("nowpage", 0);
    	Map<String,Object> result = adminService.getObjectUser(condition);
        request.setAttribute("pages", (List<Integer>) result.get("pages"));
        request.setAttribute("users",(List<User>) result.get("users"));
        request.setAttribute("count",((List<User>) result.get("users")).size());
    }
    
    /**
     * @param request
     * @param id
     * @return
     * 接收checkupUser发来的请求，从请求中获取ID号，查找对应的User信息和Label信息。放入requet中转发到指定页面显示。
     */
    @RequestMapping(value="{id}/check",method=RequestMethod.GET)
    public String changeUrlServlet(HttpServletRequest request,@PathVariable Integer id){
    	User u = new User();
    	u.setId(id);
    	User user = adminService.getUserByAttribute(u);
    	List<Label> labels = adminService.getLabelsByUser(user);
    	request.setAttribute("user", user);
    	request.setAttribute("labels", labels);
    	return "user/checkuser";
    }
    
    /**
     * 
     * @param id
     * @return
     * 处理管理员删除用户的方法
     * @throws Exception 
     */
    @RequestMapping(value="{id}/delete",method=RequestMethod.POST)
    public void deleteUser(HttpServletResponse response,@PathVariable int id) throws Exception{
    	adminService.deleteUser(id);
    	response.sendRedirect("/TongHang/user/index") ;
    }
    /**
     * 
     * @param response
     * @param id
     * @throws Exception
     * 处理管理员封号用户的方法
     */
    @RequestMapping(value="{id}/isolate",method=RequestMethod.POST)
    public void isolateUser(HttpServletResponse response,@PathVariable int id,@RequestParam int userid,@RequestParam String beginisolatetime,@RequestParam String endisolatetime,@RequestParam boolean isolate) throws Exception{
    	IsolateLog isolatelog = new IsolateLog();
    	if(isolate){   		
        	isolatelog.setBegin_time(TimeUtil.timeChange(beginisolatetime));
        	isolatelog.setEnd_time(TimeUtil.timeChange(endisolatetime));
        	isolatelog.setUser_id(userid);
        	isolatelog.setAdmin_id(1);
        	isolatelog.setOperated_time(new java.util.Date());
    	}
    	adminService.isolateUser(id,isolatelog,isolate);
    	response.sendRedirect("/TongHang/user/index") ;
    }
    

}
