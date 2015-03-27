<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" import="com.tonghang.util.CharsetUtil" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% if(request.getAttribute("count")==null) request.setAttribute("count",0); %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String username = (request.getParameter("username")!=null)?request.getParameter("username"):"";
	String sex =CharsetUtil.changeCharset(request.getParameter("sex"), "utf-8") ;
	String birth = request.getParameter("birth");
	String provence =CharsetUtil.changeCharset(request.getParameter("provence"), "utf-8");
	String isOnLine = request.getParameter("isOnLine");
%>
<!DOCTYPE html>
<html lang="zh-CH">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"/>
  <link href="<%=basePath%>css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
  <link href="<%=basePath%>css/bootstrap-responsive.min.css" rel="stylesheet"/>
  <style type="text/css">
  	li{ width:150px; text-align:center }
	.leftboard,.rightborad,.infolabel,.line,.downlist{ margin-left:0px; margin-right:0px}
	*{margin:0px}
</style>
  <script src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
  <script src="<%=basePath%>js/bootstrap.min.js"></script>
  <script src="<%=basePath%>js/bootstrap-datetimepicker.min.js"></script>
  <script src="<%=basePath%>js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

  <title>无标题文档</title>
</head>
<body>
	<div class="container">
	    <div class="row span12">
            <div class="span12">
                <div class="span10 row well pricehover">
                    <ul class=" nav nav-tabs">
                        <li class="active"><a href="#">用户管理</a></li>
                        <li><a href="#">管理员设置</a></li>
                        <li><a href="#">数据管理</a></li>
                        <li><a href="#">全局设置</a></li>
                        <li><a href="<%=basePath %>feedback/feedbackindex">问题反馈</a></li>
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
                            <div class="span6">
		                      	<form class="form-horizontal" id="search" method="get" action="<%=basePath%>user/search">
		                          <fieldset>
		                          	<div class="control-group">
		                                <label class="control-label">昵称：</label>
		                                <div class="controls">
		                                  <input class="input-xlarge focused" type="text" name="username" id="username" value="<%=username%>"/>
		
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
		                              <div class="control-group input-append date form_datetime">
		                                <label class="control-label">生日：</label>
		                                <div class="controls">
		                                  <input size="16" type="text" value="<c:if test="${not empty param.birth}">${param.birth}</c:if>" name="birth" id="birth" readonly>
		                                  <span class="add-on"><i class="icon-th"></i></span>
		                                </div>
		                              </div>
		                              <div class="control-group">
		                                <label class="control-label">地区：</label>
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
		                                <label class="control-label">是否在线：</label>
		                                <div class="controls">
		                                  <select id="isOnLine" class="input-mini">
		                                    <option></option>
		                                    <option value="yes">是</option>
		                                    <option value="no">否</option>
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
                        <label class="span4 "><strong>搜索结果共：</strong></label><label class="control-label" id="count"><strong>${count}条</strong></label>
                      </div>
                      <div class="span8">
                        <form class="form-search">
                          <fieldset>
                            <c:if test="${pages==null}">
                                <label class="control-label offset4"><a href="javascript: void(0)" >上一页</a></label>
                            </c:if>
                            <c:forEach items="${pages}"  var="item">
                                <c:if test="${item==1}">
                                    <label class="control-label offset4"><a href="javascript: void(0)" onclick="prepage(${param.nowpage})">上一页</a></label>
                                </c:if>
                                    <label class="control-label  " ><a href="javascript: void(0)" onclick="submit(${item});">${item}</a></label>
                                <c:if test="${item==pages.size() }">
                                    <label class="control-label "><a href="javascript: void(0)" onclick="nextpage(${param.nowpage},${pages.size()})">下一页</a></label>
                                </c:if>
                            </c:forEach>  
                            <c:if test="${pages==null }">
                                <label class="control-label "><a href="javascript: void(0)">下一页</a></label>
                            </c:if>
                            <label class="control-label offset2"><a href="javascript: void(0)" onclick="turnto(${pages.size()})">跳到：</a></label>
                            <input class="input-mini" onkeyup="this.value=this.value.replace(/\D/g,'')" id="pageindex" onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" />
                            <label class="control-label">页</label>
                          </fieldset>
                        </form>
                      </div>
                    </div>
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>账号</th>
                          <th>昵称</th>
                          <th>性别</th>
                          <th>地区</th>
                          <th>生日</th>
                          <th>最近登录时间</th>
                          <th>状态</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${users}"  var="item">
                          <tr>
                            <td><a href="<%=basePath%>user/${item.email}.ignore" >${item.email}</a></td>
                            <td>${item.username}</td>
                            <td>${item.sex}</td>
                            <td>${item.provence}</td>
                            <td>${item.birth.toString()}</td>
                            <td>${item.last_login_at.toString()}</td>
                            <td>${item.status}</td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                    <div class="span12 offset3">
                      <form class="form-search downlist">
                        <fieldset>
                            <c:if test="${pages==null}">
                                <label class="control-label offset2"><a href="javascript: void(0)">上一页</a></label>
                            </c:if>
                            <c:forEach items="${pages}"  var="item">
                                <c:if test="${item==1}">
                                <label class="control-label  offset2"><a href="javascript:void(0)"  onclick="prepage(${param.nowpage})">上一页</a></label>
                                </c:if>
                                <label class="control-label  " ><a href="javascript:void(0)" onclick="submit(${item})">${item}</a></label>
                                <c:if test="${item==pages.size() }">
                                <label class="control-label "><a href="javascript:void(0)" onclick="nextpage(${param.nowpage},${pages.size()})">下一页</a></label>
                                </c:if>
                            </c:forEach>  
                            <c:if test="${pages==null }">
                                <label class="control-label "><a href="javascript: void(0)">下一页</a></label>
                            </c:if>
                            <label class="control-label offset1"><a href="javascript: void(0)" onclick="turnto(${pages.size()})">跳到：</a></label>
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
/*  $('.page').click(function(event) {
  	$('#nowpage').val($(this).data("page"))
 	event.preventDefault();
  	$("#search").submit()
  });*/
  function submit(pageindex){
  	$('#nowpage').val(pageindex) 
  	$("#search").submit();
  	return false;
  }
  function turnto(pagesize){
  	
  	var pageindex = $("#pageindex").val()
  	if(pageindex>pagesize)
  		alert("页码超出范围！");
  	else if(pageindex<=0)
  		alert("页码要大于0！")
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
  	$("#username").val("")
  	$("#sex").val("")
  	$("#birth").val("")
  	$("#provence").val("")
  	$("#username").val("")
  })
  
</script>
</html>

