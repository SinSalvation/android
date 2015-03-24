package com.tonghang.pojo;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * 
 * @author Administrator
 *封号日志信息包括： id 管理员id(admin_id) 被封用户id(user_id) 
 *封号操作时间(operated_time) 启封时间(begin_time) 结束时间(end_time)
 */
@Component("isolateLog")
public class IsolateLog {
	
	private int id;
	private int admin_id;
	private int user_id;
	private Date operated_time;
	private Date begin_time;
	private Date end_time;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Date getOperated_time() {
		return operated_time;
	}
	public void setOperated_time(Date operated_time) {
		this.operated_time = operated_time;
	}
	public Date getBegin_time() {
		return begin_time;
	}
	public void setBegin_time(Date begin_time) {
		this.begin_time = begin_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	
}
