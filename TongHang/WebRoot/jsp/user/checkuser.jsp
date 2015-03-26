<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"/>
<link href="<%=basePath%>css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
<link href="<%=basePath%>css/bootstrap-responsive.min.css" rel="stylesheet"/>
<style type="text/css">
  	li{ width:150px; text-align:center }
	.leftboard,.rightborad,.infolabel,.line,.picture,.status{ margin-left:0px; margin-right:0px}
	.lab{margin-left:10px; margin-right:10px; height:20px; font-size:16px;text-align:center;}
	.modal_lab{ width: 5px;margin-right: 30px;}
	.modal_lab1{ width: 15px;margin-left: 30px;}
	.append{ visibility: hidden;}
</style>
<script src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath%>js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<title>无标题文档</title>
</head>

<body>
	<div class="container">
	    <div class="row span12">
            <div class="span12">
                <div class="span10 row well pricehover">
                    <ul class=" nav nav-tabs">
                        <li class="active"><a href="<%=basePath %>user/index">用户管理</a></li>
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
                            <span class="span4">用户详细信息如下：</span>
                        </div>
                        <hr class="span8 line"/>
                        <div class="span12 row-fluid infolabel">
                            <div class="span6">
                               <form class="form-horizontal">
                                    <fieldset>
                                        <div class="span12 control-group">
                                            <label class="control-label offset1">是否在线：</label>
                                            <div class="span3 controls">
                                                <input class="input-mini" readonly value="${user.isonline }" type="text"/>
                                            </div>
                                        </div>
                                        <div class="12 control-group">
                                            <label class="control-label offset1">最近登录时间：</label>
                                            <div class="span3 controls">
                                                <input class="input-medium" readonly value="${user.last_login_at.toString()}" type="text"/>
                                            </div>
                                        </div>
                                        <div class="span12 control-group">
                                            <label class="control-label offset1">昵称：</label>
                                            <div class="span3 controls">
                                                <input class="input-medium" readonly value="${user.username }" type="text"/>
                                            </div>
                                        </div>
                                        <div class="span12 control-group">
                                            <label class="control-label offset1">邮箱：</label>
                                            <div class="span3 controls">
                                                <input class="input-medium" readonly value="${user.email }" type="text"/>
                                            </div>
                                        </div>
                                        <div class="span12 control-group">
                                            <label class="control-label offset1">性别：</label>
                                            <div class="span3 controls">
                                                <input class="input-mini" readonly value="${user.sex }" type="text"/>
                                            </div>
                                        </div>
                                        <div class="span12 control-group">
                                            <label class="control-label offset1">生日：</label>
                                            <div class="span3 controls">
                                                <input class="input-medium" readonly value="${user.birth.toString() }" type="text"/>
                                            </div>
                                        </div>
                                        <div class="span12 control-group">
                                            <label class="control-label offset1">居住地：</label>
                                            <div class="span3 controls">
                                                <input class="input-mini" readonly value="${user.provence }" type="text"/>
                                            </div>
                                        </div>
                                        <div class="span12 control-group">
                                            <label class="control-label offset1">注册时间：</label>
                                            <div class="span3 controls">
                                                <input class="input-medium" readonly value="${user.created_at.toString() }" type="text"/>
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                            <div class="span4 offset2 picture">
                                <img src="<%=basePath%>img/my.jpg" class="img-thumbnail img-responsive">
                            </div>
                        </div>
                        <div class="row span12">
                        	<span class="span1">标签名：</span>
                        	<c:forEach items="${labels}" var="item">
                            	<span class="label label-info lab">${item.label_name }</span>
                            </c:forEach>
                        </div>
                        <hr class="span8 line"/>
                        <div class="row span12 ">
                        	<span class="span1 status">账号状态：</span>
                            <span class="span2 status">${user.status }</span>
                        </div>
                        <div class="row span8">
                        	<table class="table table-striped">
                              <thead>
                                <tr>
                                  <th>操作时间</th>
                                  <th>违纪项目</th>
                                  <th>被封时段</th>
                                </tr>
                              </thead>
                              <tbody>
                              	<tr>
                                	<td>2014-9-20</td>
                                    <td>封账号</td>
                                    <td>2014-9-20到2014-9-30</td>
                                </tr>
                              </tbody>
                            </table>
                        </div>
                        <form id="delete" method="post" action="<%=basePath%>user/${user.id}/delete"></form>
                        <form id="deisolate" method="post" action="<%=basePath%>user/${user.id}/isolate">
                        	<input type="hidden" name="isolate" value="false"/>
                        	<input type="hidden" name="userid" value="${user.id }"/> 
                        	<input type="hidden" name="beginisolatetime" value="0000"/>
                        	<input type="hidden" name="endisolatetime" value=""/>
                        </form>
                        
                        <div class="row span12">
                        	<div class="btn-group-horizontal">
                            	<c:if test="${user.status eq '封号'}">
                            		<button class="btn btn-primary" onclick="submit('deisolate')">解封</button>
                            	</c:if>
                            	<c:if test="${user.status eq '正常'}">
                            		<button class="btn btn-primary" data-toggle="modal" href="#isolateModal">封号</button>
                            	</c:if>
                                <button class="btn btn-primary" onclick="submit('delete')">删除用户</button>
                            </div>
                            <!-- 以下是modal 弹出div -->
                            <div id="isolateModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
					            <div class="modal-header">  
					                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>  
					                <h3 id="myModalLabel">封号设置</h3>  
					            </div>  
					            <div class="modal-body">  
					       			<div class="control-group ">
					       				<div>
					       					<span >是否设置封号时间：</span>
					       					<span class="modal_lab"></span>
					       					<input type="radio" name="settime"  onclick="show()"/>
					       					<span class="modal_lab">是</span>
					       					<span class="modal_lab"></span>
					       					<input type="radio" name="settime" onclick="hide()"/>
					       					<span class="modal_lab">否</span>
					       				</div>	
					       				<hr/>	    
							            <div class="append">
							            	<form id="isolate" method="post" action="<%=basePath%>user/${user.id}/isolate">
	                        					<input type="hidden" name="isolate" value="true"/>
	                        					<input type="hidden" name="userid" value="${user.id }"/>
								            	<label>选择封号时间段：</label>
								            	<div class="control-group input-append date form_datetime">
								            		<span class="modal_lab1">开始：</span>
									            	<input size="16" type="text" value="" id="begin" name="beginisolatetime" readonly>
				                                  	<span class="add-on"><i class="icon-th"></i></span>
								            	</div>
			                                  	<div class="control-group input-append date form_datetime">
			                                  		<span class="modal_lab1">结束：</span>
									            	<input size="16" type="text" value="" id="end" name="endisolatetime" readonly>
				                                  	<span class="add-on"><i class="icon-th"></i></span>
			                                  	</div>
			                                </form>
							            </div>     
							        </div>  		
					            </div>  
					            <div class="modal-footer">  
					                <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>  
					                <button class="btn btn-primary" onclick="submit('isolate')">确认</button>  
					            </div>  
					        </div>
					        <!-- 弹出div到此 -->  
                        </div>
                    </div>               
                </div>
            </div>
   		</div>     
    </div>       
</body>
<script type="text/javascript">
	$(".form_datetime").datetimepicker({
		    autoclose: true,
		    todayBtn: true,
		    startDate:new Date(),
		    format: 'yyyy-mm-dd hh:ii:00',
		    todayHighlight:true,	
		    language: 'zh-CN'
	});
	function submit(whitch){
		if(whitch=="delete")
			$("#delete").submit();
		else if(whitch=='deisolate')
			$("#deisolate").submit();
		else{
			var begin = $("#begin").val();
			var end = $("#end").val();
			alert("sa:"+$("#hide"))
			if(validateDate(begin,end))
				$("#isolate").submit()
		}
	}
	function show(){
		$(".append").css("visibility","visible");
	}
	function hide(){
		$(".append").css("visibility","hidden");
		$("#begin").val("");
		$("#end").val("");
	}
	function validateDate(begin,end){
		var bstr1 = begin.split(" ");
		var estr1 = end.split(" ");
		var bstr2 = bstr1[0].split("-");  
		var estr2 = estr1[0].split("-");
		var bstr3 = bstr1[1].split(":");
		var estr3 = estr1[1].split(":");
		begin_date = new Date(bstr2[0],bstr2[1],bstr2[2],bstr3[0],bstr3[1]);
		end_date = new Date(estr2[0],estr2[1],estr2[2],estr3[0],estr3[1]);
		if(begin_date>end_date){
			return false;
		}else return true;
 	}

</script>
</html>
