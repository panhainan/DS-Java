<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title><s:property value="user.nickname" />的资料</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="./JS/jquery-1.11.0.js"></script>
<style type="text/css">
.background {
	width: 1004px;
	overflow: auto;
	background-color: #F5F5F5;
	margin: 0 auto;
	min-height: 700px;
}

.tBody {
	margin-left: 22px;
	margin-right: 22px;
	font-family: 微软雅黑;
}

.smallNav {
	width: 982px;
	height: 24px;
	margin-top: 10px;
	float: left;
	font-size: 14px;
}
</style>
</head>

<body>
	<div class="background">
		<div class="topNav">
			<jsp:include page="./top.jsp"></jsp:include>
		</div>
		<div class="tBody">
			<div class="smallNav" align="left">
				<div style="float: left;">
					<a href="index.jsp" title="论坛首页"><img
						src="image/homepage_24.png"></img> </a>
				</div>
				<div style="float: left;line-height:24px;">
					&nbsp;&gt;&nbsp;<a href="index.jsp">论坛</a>&nbsp;&gt;&nbsp;论坛帮助
				</div>
			</div>
			<div class="userStyle" style="float: left;margin-top: 50px;min-height: 380px;">
				<div align="right" style="width:300px;float: left;margin-right: 30px;">
					<img alt="我的头像" style="width: 140px;height: 200px;"  onerror="this.src='./image/ds-java.png'" 
						src="<s:property value="user.picture" />">
				</div>
				<div  align="left" style="width:400px;float: left;margin-left: 30px;">
					<table>
						<tr>
							<td>昵称：</td>
							<td><s:property value="user.nickname" />
							</td>
						</tr>
						<tr>
							<td>性别：</td>
							<td><s:property value="user.sex" />
							</td>
						</tr>
						<tr>
							<td>职业：</td>
							<td><s:property value="user.profession" /></td>
						</tr>
						<tr>
							<td>现居地：</td>
							<td><s:property value="user.comefrom" /></td>
						</tr>
						<tr>
							<td>论坛等级：</td>
							<td><s:property value="user.usersGrade.id" />
							</td>
						</tr>
						<tr>
							<td>论坛头衔：</td>
							<td><s:property value="user.usersGrade.honor" /></td>
						</tr>
						<tr>
							<td>可用积分：</td>
							<td><s:property value="user.integral" />
							</td>
						</tr>
						<tr>
							<td>他的帖子数：</td>
							<td><s:property value="user.topCount" />&nbsp;&nbsp;<a href="user_GoUserAllTopics.action?user.id=<s:property value="user.id" />" style="color: blue">前往查看&gt;&gt;</a>
							</td>
						<tr>
							<td>他的评论数：</td>
							<td><s:property value="user.comCount" />
							</td>
						</tr>
					</table>
				</div>

			</div>
		</div>
		<div class="copyRight">
			<jsp:include page="./copyRight.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
