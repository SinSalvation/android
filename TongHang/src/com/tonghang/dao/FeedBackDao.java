package com.tonghang.dao;

import java.util.List;
import java.util.Map;

import com.tonghang.pojo.FeedBack;

public interface FeedBackDao {

	public Map<String,Object> getFeedBackListByCondition(Map<String,Object>condition);
}
