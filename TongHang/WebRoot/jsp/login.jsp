<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta charset="utf-8" />
<title>管理员登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/bootstrap.min.css" />
<style>
body {
	font-family: 'microsoft yahei', Arial, sans-serif;
	background-color: #222;
}

.redborder {
	border: 2px solid #f96145;
	border-radius: 2px;
}

.row {
	padding: 20px 0px;
}

.bigicon {
	font-size: 97px;
	color: #f08000;
}

.loginpanel {
	text-align: center;
	width: 300px;
	border-radius: 0.5rem;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: 10px auto;
	background-color: #555;
	padding: 20px;
}

input {
	width: 100%;
	margin-bottom: 17px;
	padding: 15px;
	background-color: #ECF4F4;
	border-radius: 2px;
	border: none;
}

h2 {
	margin-bottom: 20px;
	font-weight: normal;
	color: #EFEFEF;
}

.btn {
	border-radius: 2px;
	padding: 10px;
}

.btn span {
	font-size: 27px;
	color: white;
}

.buttonwrapper {
	position: relative;
	overflow: hidden;
	height: 50px;
}

.lockbutton {
	font-size: 27px;
	color: #f96145;
	padding: 10px;
	width: 100%;
	position: absolute;
	top: 0;
	left: 0;
}

.loginbutton {
	background-color: #f08000;
	width: 100%;
	-webkit-border-top-right-radius: 0;
	-webkit-border-bottom-right-radius: 0;
	-moz-border-radius-topright: 0;
	-moz-border-radius-bottomright: 0;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
	left: -260px;
	position: absolute;
	top: 0;
}
</style>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="loginpanel">
				<h2>管理员登录</h2>
				<div>
					<form role="form" action="<%=basePath%>login" method="post">
						<input style="width:300px;height:40px;" name="username" id="username" type="text"
							placeholder="登录账号"> <input style="width:300px;height:40px;" name="password" id="password"
							type="password" placeholder="输入密码">
						<div class="buttonwrapper">
							<input type="submit" value="登录" class="btn btn-info">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>