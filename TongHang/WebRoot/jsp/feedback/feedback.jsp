<%@ page language="java" import="java.util.*,com.tonghang.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String email = (request.getParameter("email")!=null)?request.getParameter("email"):"";
	String sex =CharsetUtil.changeCharset(request.getParameter("sex"), "utf-8") ;
	String begintime = request.getParameter("begintime")==null?"":request.getParameter("begintime");
	String endtime = request.getParameter("endtime")==null?"": request.getParameter("endtime");
	String provence =CharsetUtil.changeCharset(request.getParameter("provence"), "utf-8");
	if(request.getAttribute("fcount")==null){
		request.setAttribute("fcount",0);
	}
%>
<!DOCTYPE html>
<html lang="zh-CH">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link href="<%=basePath %>css/bootstrap.min.css" rel="stylesheet"/>
  <link href="<%=basePath %>css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
  <link href="<%=basePath %>css/bootstrap-responsive.min.css" rel="stylesheet"/>
  <style type="text/css">
  	li{ width:150px; text-align:center }
	.leftboard,.rightborad,.infolabel,.line,.downlist{ margin-left:0px; margin-right:0px}
	.to{text-align:center;margin-left:0px; margin-right:0px}
	.content{resize: none;}
	*{margin:0px}
</style>
  <script src="<%=basePath %>js/jquery-1.8.3.min.js"></script>
  <script src="<%=basePath %>js/bootstrap.min.js"></script>
  <script src="<%=basePath %>js/bootstrap-datetimepicker.min.js"></script>
  <script src="<%=basePath %>js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

  <title>无标题文档</title>
</head>
<body>
	<div class="container">
	    <div class="row span12">
            <div class="span12">
                <div class="span10 row well pricehover">
                    <ul class=" nav nav-tabs">
                        <li><a href="<%=basePath %>user/index">用户管理</a></li>
                        <li><a href="#">管理员设置</a></li>
                        <li><a href="#">数据管理</a></li>
                        <li><a href="#">全局设置</a></li>
                        <li  class="active"><a href="#">问题反馈</a></li>
                    </ul>
                    <div class="span2 leftboard">
                    	<ul class="nav nav-tabs nav-stacked">
                            <li><a href="#">用户管理</a></li>
                            <li><a href="#">管理员设置</a></li>
                            <li><a href="#">数据管理</a></li>
                            <li><a href="#">全局设置</a></li>
                            <li><a href="#">问题反馈</a></li>
                    	</ul>
                    </div>
                    <div class="span7 rightborad">
                        <div class="span4 infolabel">
                            <span class="span4 "><strong>用户详细信息如下：</strong></span>
                        </div>
                        <hr class="span8 line"/>
                        <div class="span12 row-fluid">
                            <div class="span12">
		                      	<form class="form-horizontal" id="search" method="get" action="<%=basePath %>feedback/check">
		                          <fieldset>
		                          	  <div class="control-group">
		                                <label class="control-label">邮箱：</label>
		                                <div class="controls">
		                                	<input class="input-xlarge focused" type="text" name="email" id="email" value="<%=email%>"/>
		
		                                </div>
		                              </div>
                                      <div class="control-group input-append date form_datetime">
                                         <label class="control-label">提交时间：从</label>
                                         <div class="controls">
		                                  <input size="16" type="text" value="<%=begintime %>" name="begintime" id="begintime" readonly>
		                                  <span class="add-on"><i class="icon-th"></i></span>
		                                 </div>
		                              </div> 
		                              <div class="control-group input-append date form_datetime">
                                         <label class="control-label span4 to">到</label>
                                         <div class="controls">
		                                  <input size="16" type="text" value="<%=endtime %>" name="endtime" id="endtime" readonly>
		                                  <span class="add-on"><i class="icon-th"></i></span>
		                                </div>
                                      </div>                           
		                              <div class="control-group">
		                                <label class="control-label">性别：</label>
		                                <div class="controls">
		                                  <select id="sex" name="sex" class="input-mini">
		                                    <option></option>
		                                    <option value="男" <%if("男".equals(sex)){ %>selected<%} %>>男</option>
		                                    <option value="女" <%if("女".equals(sex)){ %>selected<%} %>>女</option>
		                                  </select>
		                                </div>
		                              </div>
		                              <div class="control-group">
		                                <label class="control-label">居住地：</label>
		                                <div class="controls">
		                                  <select id="provence" name="provence" class="input-medium">
		                                    <option value="">不限</option>
		                                    <option value="北京" <%if("北京".equals(provence)){ %>selected<%} %>>北京</option>
		                                    <option value="天津" <%if("天津".equals(provence)){ %>selected<%} %>>天津</option>
		                                    <option value="上海" <%if("上海".equals(provence)){ %>selected<%} %>>上海</option>
		                                    <option value="重庆" <%if("重庆".equals(provence)){ %>selected<%} %>>重庆</option>
		                                  </select>
		                                </div>
		                              </div>
		                              <div class="control-group">
		                                <div class="controls">
		                                  <button class="btn btn-primary">查询</button>
		                                  <button class="btn " id="reset" >重置</button>
		                                </div>
		                              </div>
		                              <input type="hidden" name="nowpage" id="nowpage"  value="1" />
		                              <input type="hidden" name="isall"  value="false" />
		                      	  </fieldset>
		                      	</form>
		                     </div>
		                </div>
                      </div>
                    <div class="span12 row-fluid">
                      <div class="span4">
                        <label class="span4 "><strong>搜索结果共：</strong></label><label class="control-label" id="count"><strong>${fcount }条</strong></label>
                      </div>
                      <div class="span8">
                        <form class="form-search">
                          <fieldset>
                            <c:if test="${fpages==null}">
                                <label class="control-label offset4"><a href="javascript: void(0)" >上一页</a></label>
                            </c:if>
                            <c:forEach items="${fpages}"  var="item">
                                <c:if test="${item==1}">
                                    <label class="control-label offset4"><a href="javascript: void(0)" onclick="prepage(${param.nowpage})">上一页</a></label>
                                </c:if>
                                    <label class="control-label  " ><a href="javascript: void(0)" onclick="submit(${item});">${item}</a></label>
                                <c:if test="${item==fpages.size() }">
                                    <label class="control-label "><a href="javascript: void(0)" onclick="nextpage(${param.nowpage},${fpages.size()})">下一页</a></label>
                                </c:if>
                            </c:forEach>  
                            <c:if test="${fpages==null }">
                                <label class="control-label "><a href="javascript: void(0)">下一页</a></label>
                            </c:if>
                            <label class="control-label offset2"><a href="javascript: void(0)" onclick="turnto(${fpages.size()})">跳到：</a></label>
                            <input class="input-mini" onkeyup="this.value=this.value.replace(/\D/g,'')" id="pageindex" onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" />
                            <label class="control-label">页</label>
                          </fieldset>
                        </form>
                      </div>
                    </div>
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>昵称</th>
                          <th>性别</th>
                          <th>地区</th>
                          <th>年龄</th>
                          <th>提交时间</th>
                          <th>反馈内容</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${feedbackmsg}"  var="item">
                          <tr>
                            <td width="10%">${item.username }</td>
                            <td width="5%">${item.sex}</td>
                            <td width="5%">${item.provence}</td>
                            <td width="5%">${item.age}</td>
                            <td width="15%">${item.created_at.toString()}</td>
                            <td width="50%"><textarea readonly class="content">${item.content}</textarea></td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                    <div class="span12 offset3">
                      <form class="form-search downlist">
                        <fieldset>
                            <c:if test="${fpages==null}">
                                <label class="control-label offset2"><a href="javascript: void(0)">上一页</a></label>
                            </c:if>
                            <c:forEach items="${fpages}"  var="item">
                                <c:if test="${item==1}">
                                <label class="control-label  offset2"><a href="javascript:void(0)"  onclick="prepage(${param.nowpage})">上一页</a></label>
                                </c:if>
                                <label class="control-label  " ><a href="javascript:void(0)" onclick="submit(${item})">${item}</a></label>
                                <c:if test="${item==fpages.size() }">
                                <label class="control-label "><a href="javascript:void(0)" onclick="nextpage(${param.nowpage},${fpages.size()})">下一页</a></label>
                                </c:if>
                            </c:forEach>  
                            <c:if test="${fpages==null }">
                                <label class="control-label "><a href="javascript: void(0)" >下一页</a></label>
                            </c:if>
                            <label class="control-label offset1"><a href="javascript: void(0)" onclick="turnto(${fpages.size()})">跳到：</a></label>
                          <input class="input-mini" onkeyup="this.value=this.value.replace(/\D/g,'')" id="pageindex" onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" />
                          <label class="control-label">页</label>
                        </fieldset>
                      </form>
                    </div>
            	</div>
    </div> 
</body>
<script type="text/javascript">
  $(".form_datetime").datetimepicker({
    autoclose: true,
    todayBtn: true,
    format: 'yyyy-mm-dd hh:ii:00',
    todayHighlight:true,	
    language: 'zh-CN'
  });

  function submit(pageindex){
  	$('#nowpage').val(pageindex) 
  	$("#search").submit();
  	return false;
  }
  function turnto(pagesize){
  	
  	var pageindex = $("#pageindex").val()
  	if(pageindex>pagesize){
  		alert("页码超出范围！");
  		$("#pageindex").val("")
  	}	
  	else if(pageindex<=0){
  		alert("页码要大于0！")
  		$("#pageindex").val("")
  	}	
  	else
  		submit(pageindex);
  	return false
  }
  function nextpage(nowpageindex,size){
  	if(nowpageindex>=size){
  		alert("已经是最后一页了");
  	}else
  		submit(nowpageindex+1);
  	return false
  }
  function prepage(nowpageindex){
  	if(nowpageindex==1)
  		alert("已经是第一页了")
  	else
  		submit(nowpageindex-1)
  	return false
  }
  //重置按钮
  $("#reset").click(function(){
  	$("#email").val("")
  	$("#sex").val("")
  	$("#endtime").val("")
  	$("#provence").val("")
  	$("#begintime").val("")
  })
  $(".content").css("height","100px").css("width","500px")
</script>
</html>
