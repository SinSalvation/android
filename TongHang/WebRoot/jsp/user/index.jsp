<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% if(request.getAttribute("count")==null) request.setAttribute("count",0); %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String username = request.getParameter("username");
	String sex = request.getParameter("sex");
	String birth = request.getParameter("birth");
	String provence = request.getParameter("provence");
	String isOnLine = request.getParameter("isOnLine");
%>
<!DOCTYPE html>
<html lang="zh-CH">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"/>
  <link href="<%=basePath%>css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
  <link href="<%=basePath%>css/bootstrap-responsive.min.css" rel="stylesheet"/>
  <script src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
  <script src="<%=basePath%>js/bootstrap.min.js"></script>
  <script src="<%=basePath%>js/bootstrap-datetimepicker.min.js"></script>
  <script src="<%=basePath%>js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

  <title>无标题文档</title>
</head>

<body>
  <div class="row-fluid span12">
    <div class="span2">
      <div class="span12 well">
        <ul class="nav nav-stacked">
          <li class="active"><a href="#">用户管理</a></li>
          <li><a href="#">管理员设置</a></li>
          <li><a href="#">数据管理</a></li>
          <li><a href="#">问题反馈</a></li>
        </ul>
      </div>
    </div>

    <div class="span10">
      <div class="span10 well">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#">用户管理</a></li>
        </ul>
        <div class="span12">
          <div class="span6">
            <span class="help-inline"><strong>搜索条件：</strong></span>
          </div>
          <form class="form-horizontal" id="search" method="get" action="<%=basePath%>user/search">
            <fieldset>
              <div class="control-group">
                <label class="control-label">昵称：</label>
                <div class="controls">
                  <input class="input-xlarge focused" type="text" name="username" id="username" value=""/>
                  <span class="help-inline">请务必填写完整</span>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">性别：</label>
                <div class="controls">
                  <select id="sex" name="sex" class="input-mini">
                  	<option></option>
                    <option value="男" >男</option>
                    <option value="女">女</option>
                  </select>
                  <span class="help-inline">请务必选择</span>
                </div>
              </div>
              <div class="control-group input-append date form_datetime">
                <label class="control-label">生日：</label>
                <div class="controls">
                  <input size="16" type="text" value="<c:if test="${birth}!=null">${birth}</c:if>" name="birth" id="birth" readonly>
                  <span class="add-on"><i class="icon-th"></i></span>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">地区${ param.provence}：</label>
                <div class="controls">
                  <select id="provence" name="provence" class="input-medium">
                 	<option value="">不限</option>
                    <option value="北京" <c:if test="${param.provence eq '北京'}">selected</c:if>>北京</option>
                    <option value="天津" <c:if test="${param.provence eq '天津'}">selected</c:if> >天津</option>
                    <option value="上海" <c:if test="${param.provence eq '上海'}">selected</c:if>>上海</option>
                    <option value="重庆" <c:if test="${param.provence eq '重庆'}">selected</c:if>>重庆</option>
                  </select>
                  <span class="help-inline">请务必选择</span>
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
                  <span class="help-inline">请务必选择</span>
                </div>
              </div>
              <div class="control-group">
                <div class="controls">
                  <button class="btn btn-primary">查询</button>
                </div>
              </div>
              <input type="hidden" name="nowpage" id="nowpage"  value="1" />
              <input type="hidden" name="isall"  value="true" />
            </fieldset>
          </form>
        </div>
        <div class="span12">
          <div class="span6">
            <label class="span3">搜索结果共：</label><label class="control-label" id="count"><%= request.getAttribute("count") %>条</label>
          </div>
          <div class="span6">
            <form class="form-search">
              <fieldset>
                <label class="control-label offset1"><a href="user">上一页</a></label>
                <c:forEach items="${pages}"  var="item">
                	<label class="control-label  " ><a href="javascript:submit(${item})">${item}</a></label>
                </c:forEach>  
				<label class="control-label "><a href="#">下一页</a></label>
                <label class="control-label offset1"><a href="#">跳到：</a></label>
                <input class="input-mini" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" />
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
            <c:forEach items="${user}"  var="item">
              <tr>
                <td><a href="#">${item.number}</a></td>
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
        <div class="span6 offset6">
          <form class="form-search">
            <fieldset>
               <label class="control-label offset1"><a href="#">上一页</a></label>
                <c:forEach items="${pages}"  var="item">
                	<label class="control-label  " ><a href="javascript: void(0)" onclick="submit(${item})">${item}</a></label>
                </c:forEach>  
				<label class="control-label "><a href="#">下一页</a></label>
                <label class="control-label offset1"><a href="#">跳到：</a></label>
              <input class="input-mini" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" />
              <label class="control-label">页</label>
            </fieldset>
          </form>
        </div>
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
  function submit(page){
  	alert(page)
  	$('#nowpage').val(page) 
  	$("#search").submit()
  }
 }
</script>
</html>

