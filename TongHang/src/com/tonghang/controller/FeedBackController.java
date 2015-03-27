package com.tonghang.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tonghang.pojo.FeedBack;
import com.tonghang.pojo.FeedBackMessage;
import com.tonghang.pojo.User;
import com.tonghang.service.FeedBackService;
import com.tonghang.util.CharsetUtil;

@Controller("feedBackController")
@RequestMapping("feedback")
@Scope("prototype") 
public class FeedBackController {
	private FeedBackService reedBackService;

	public FeedBackService getReedBackService() {
		return reedBackService;
	}
	@Resource(name="feedBackService")
	public void setReedBackService(FeedBackService reedBackService) {
		this.reedBackService = reedBackService;
	}
	
	@RequestMapping(value="check",method=RequestMethod.GET)
	public String search(HttpServletRequest request,@RequestParam String email,@RequestParam String begintime,
							@RequestParam String endtime,@RequestParam String sex,@RequestParam String provence,@RequestParam int nowpage,@RequestParam boolean isall){
		
		Map<String,Object> condition = new HashMap<String,Object>();
        condition.put("email",email);
        condition.put("sex",CharsetUtil.changeCharset(sex, "utf-8"));
        condition.put("begin_time",begintime);
        condition.put("end_time",endtime);
        condition.put("provence",CharsetUtil.changeCharset(provence, "utf-8"));
        System.out.println("nowpage"+nowpage+"..");
		condition.put("nowpage",(nowpage-1)*5);
		condition.put("isall",isall);
		List<Object> msg = new ArrayList<Object>();
		Map<String,Object> result = reedBackService.getFeedBackListByCondition(condition);
		request.setAttribute("fpages", (List<Integer>) result.get("pages"));
        request.setAttribute("feedbackmsg",(List<FeedBackMessage>) result.get("feedbackmessage"));
        request.setAttribute("fcount",(Integer) result.get("allcount"));
		return "feedback/feedback";
	}
	
	@RequestMapping(value="feedbackindex",method=RequestMethod.GET)
	public String feedbackindex(HttpServletRequest request){ 
    	Map<String,Object> condition = new HashMap<String,Object>();
    	condition.put("isall", true);
    	condition.put("nowpage", 0);
    	Map<String,Object> result = reedBackService.getFeedBackListByCondition(condition);
    	request.setAttribute("fpages", (List<Integer>) result.get("pages"));
        request.setAttribute("feedbackmsg",(List<FeedBackMessage>) result.get("feedbackmessage"));
        request.setAttribute("fcount",(Integer) result.get("allcount"));
        return "feedback/feedback";
	}
	
}
