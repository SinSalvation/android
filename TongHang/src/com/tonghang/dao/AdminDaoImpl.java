package com.tonghang.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tonghang.pojo.Administrator;
import com.tonghang.pojo.User;
import com.tonghang.util.DBUtil;

@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {
	
	@Override
	public User findUserByName(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String,Object> getObjectUser(Map<String,Object> condition) {
		// TODO Auto-generated method stub
		 SqlSession session = DBUtil.createSession();
		 Map<String,Object>map = new HashMap<String,Object>();
		 List<User> users = null;
		 List<Integer> numbers = new ArrayList<Integer>();
		 int datas = session.selectOne(Administrator.class.getName()+".count_users",condition);
		 int pages = (datas-1)/5+1;
		 for(int i=1;i<=pages;i++){
			 numbers.add(i);
		 }
		 users = session.selectList(Administrator.class.getName()+".search_userby_condition",condition);
	     map.put("users", users);
	     map.put("pages", numbers);
		 return map;
	}
}
