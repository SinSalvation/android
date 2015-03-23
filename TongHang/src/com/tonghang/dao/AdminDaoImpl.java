package com.tonghang.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transaction;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tonghang.pojo.Administrator;
import com.tonghang.pojo.Label;
import com.tonghang.pojo.User;
import com.tonghang.util.DBUtil;

@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {
	
	/**
	 * 通过条件查询用户信息，
	 * 条件选取的逻辑处理放在配置文件admin-mapping.xml中。
	 * 该方法还处理了分页逻辑。并将放回的user对象和分页结果分别放在了map中返回前台。
	 */
	@Override
	public Map<String,Object> getObjectUser(Map<String,Object> condition) {
		// TODO Auto-generated method stub
		 SqlSession session = DBUtil.createSession();
		 Map<String, Object> map = null;
		try {
			map = new HashMap<String,Object>();
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
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			session.rollback();
		}finally{
			DBUtil.closeSession(session);
		}	     
		 return map;
	}
	
	/**
	 * 通过传入的User对象的信息获取数据库中的User信息。
	 * 最初本来想的是传入一个String就完了不过发现做成User的话能支持很多查询情况
	 * 能够支持程序扩展，同样逻辑放在配置文件中
	 */
	@Override
	public User findUserByAttribute(User u) {
		// TODO Auto-generated method stub
		SqlSession session = DBUtil.createSession();
		User user = null;
		try {
			user = session.selectOne(Administrator.class.getName()+".find_userby_attribute", u);
			System.out.println("useruser="+user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			session.rollback();
		}finally{
			DBUtil.closeSession(session);
		}
		
		return user;
	}
	
	/**
	 * 通过传入的User获取其id来查询该User对应的标签
	 */
	@Override
	public List<Label> findLabelByUserId(User user) {
		// TODO Auto-generated method stub
		SqlSession session = DBUtil.createSession();
		List<Label> labels = null;
		try {
			labels = session.selectList(Administrator.class.getName()+".find_labelsby_userid", user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			session.rollback();
		}finally{
			DBUtil.closeSession(session);	
		}
		return labels;
	}
	
	/**
	 * 管理员删除指定用户的方法
	 */
	@Override
	public void deleteUser(int id) {
		// TODO Auto-generated method stub
		SqlSession session = DBUtil.createSession();
		try {
			session.update(Administrator.class.getName()+".delete_user", id);
			session.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			session.rollback();
		}finally{
			DBUtil.closeSession(session);
		}
	}
	
	/**
	 * 管理员封号指定用户的方法
	 */
	@Override
	public void isolateUser(int id,boolean isolate){
		SqlSession session = DBUtil.createSession();
		try {
			User user = new User();
			user.setId(id);
			if(isolate)
				user.setStatus("封号");
			else user.setStatus("正常");	
			session.update(Administrator.class.getName()+".change_status", user);
			session.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			session.rollback();
		}finally{
			DBUtil.closeSession(session);
		}	
	}

}
