package com.tonghang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tonghang.pojo.Administrator;
import com.tonghang.service.AdminService;
import com.tonghang.util.CharsetUtil;
import com.tonghang.util.DBUtil;

@Controller("sessionController")
public class SessionController {
	private AdminService adminService;

	public AdminService getAdminService() {
		return adminService;
	}

	@Resource(name = "adminService")
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(){
		return "login";
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(HttpServletRequest request,HttpServletResponse response,
			@RequestParam String username, @RequestParam String password)
			throws Exception {
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("username", CharsetUtil.changeCharset(username, "utf-8"));
		condition.put("password", CharsetUtil.changeCharset(password, "utf-8"));
		SqlSession sqlsession = DBUtil.createSession();
		if(sqlsession.selectOne(Administrator.class.getName()+".login",condition)!=null){
			int login = sqlsession.selectOne(Administrator.class.getName()+".login",condition);
			System.out.println(login);
			if(login==1){
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				System.out.println(username);
				request.getRequestDispatcher("user/index").forward(request,response);
			}
			else request.getRequestDispatcher("login");
		}
		else request.getRequestDispatcher("login");
	}
}
