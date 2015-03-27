package com.tonghang.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tonghang.pojo.Administrator;
import com.tonghang.pojo.FeedBack;
import com.tonghang.pojo.FeedBackMessage;
import com.tonghang.pojo.User;
import com.tonghang.util.DBUtil;

@Repository("feedBackDao")
public class FeedBackDaoImpl implements FeedBackDao{

	@Override
	public Map<String, Object> getFeedBackListByCondition(
			Map<String, Object> condition) {
		// TODO Auto-generated method stub
		SqlSession session = DBUtil.createSession();
		Map<String, Object> map = null;
		List<FeedBackMessage> fbms = null;
		 try {
			 map = new HashMap<String,Object>();
			 List<Integer> numbers = new ArrayList<Integer>();
			 int datas = session.selectOne(FeedBack.class.getName()+".count_feedbacks",condition);
			 int pages = (datas-1)/5+1;
			 for(int i=1;i<=pages;i++){
				 numbers.add(i);
			 }
			 fbms = session.selectList(FeedBack.class.getName()+".search_feedbackby_condition",condition);
			 map.put("pages", numbers);
			 map.put("feedbackmessage", fbms);
			 map.put("allcount", datas);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			session.rollback();
		}finally{
			DBUtil.closeSession(session);
		}	     
		 return map;
	}

}
