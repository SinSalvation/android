package com.tonghang.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tonghang.dao.FeedBackDao;

@Service("feedBackService")
public class FeedBackService {
	private FeedBackDao feedBackDao;

	public FeedBackDao getFeedBackDao() {
		return feedBackDao;
	}
	@Resource(name="feedBackDao")
	public void setFeedBackDao(FeedBackDao feedBackDao) {
		this.feedBackDao = feedBackDao;
	}
	
	public Map<String, Object> getFeedBackListByCondition(
			Map<String, Object> condition){
		return feedBackDao.getFeedBackListByCondition(condition);
	}
	
}
