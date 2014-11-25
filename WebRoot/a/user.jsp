<%@ page language="java"
	import="java.util.*,com.phn.bean.Users,java.io.*" pageEncoding="UTF-8"%>
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

<title>个人中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="./CSS/manage.css" />
<style type="text/css">
body,html {
	width: 1004px;
	padding: 0px;
	margin: 0px auto; /*设置居中  */
	text-align: center; /*兼容性更好  */
	font-family: "微软雅黑";
}

table tr td {
	padding-left: 10px;
	border: 1px solid silver;
}

table tr th {
	border: 1px solid silver;
	text-align: center;
	color: #254472;
}

.butt {
	background-color: #6699CC;
	width: 120px;
	height: 30px;
	margin-top: 10px;
	margin-bottom: 10px;
	border: 0;
	color: white;
	font-size: 18px;
	border: 0;
}

.butt:hover {
	background-color: #71AAE3;
	border: 0;
}
</style>
<script type="text/javascript" src="./JS/jquery-1.11.0.js"></script>
<script type="text/javascript">
	function warnUpdate(userId){
		 if (confirm("确认将此管理员降级为普通用户？")){
		 	window.location.href="user_ManageRole.action?user.id="+userId;
		 }else{
		 }
	}
	function warnAUpdate(userId){
		 if (confirm("确认将此用户升级为普通管理员？")){
		 	window.location.href="user_ManageARole.action?user.id="+userId;
		 }
		else{
		}
	}
	function warnSUpdate(userId){
		if (confirm("确认将此用户升级为高级管理员？请注意此操作不可逆！")){
		 	window.location.href="user_ManageSRole.action?user.id="+userId;
		 }else{
		}
	}
</script>
</head>
<%
	Users user = (Users) session.getAttribute("tu");
	if (user == null) {
		PrintWriter pw = response.getWriter();
		pw.println("<script type='text/javascript'>alert('未登录或登录已失效！请登录！');window.location.href = '"
				+ basePath + "login.jsp';</script>");

	} else if (user.getRoleId() == 0) {
		PrintWriter pw = response.getWriter();
		pw.println("<script type='text/javascript'>alert('权限不够！切换账号登录');window.location.href = '"
				+ basePath + "login.jsp';</script>");
	} else {
%>

<body>
	<div class="body">
		<div class="top">
			<img alt="" src="image/manager_top.jpg" />
		</div>
		<div class="left">
			<jsp:include page="./left.jsp"></jsp:include>
		</div>
		<div class="right">
			<div align="center" style="font-size: 28px;margin-top: 20px;">用
				户 信 息</div>
			<div style="float: left;width: 300px;height: 400px;margin-top: 40px;"
				align="center">
				<img alt="我的头像" style="width: 140px;height: 200px;"  onerror="this.src='./image/ds-java.png'" 
					src="<s:property value="user.picture" />">
			</div>
			<div style="float: left;width: 400px;height: 400px;margin-top: 30px;">
				<table align="left" style="width: 400px;text-align: left;"
					cellspacing="0">
					<tr>
						<th width="100px;">用&nbsp;户&nbsp;名</th>
						<td width="300px;"><s:property value="user.username" />
						</td>
					</tr>
					<tr>
						<th>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</th>
						<td><s:property value="user.nickname" />&nbsp;</td>
					</tr>
					<tr>
						<th>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</th>
						<td><s:property value="user.sex" />&nbsp;</td>
					</tr>
					<tr>
						<th>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</th>
						<td><s:property value="user.email" />&nbsp;</td>
					</tr>
					<tr>
						<th>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业</th>
						<td><s:property value="user.profession" />&nbsp;</td>
					</tr>
					<tr>
						<th>现&nbsp;居&nbsp;地</th>
						<td><s:property value="user.comefrom" />&nbsp;</td>
					</tr>
					<tr>
						<th>用户权限</th>
						<td><s:if test="user.roleId==0">普通用户</s:if> <s:elseif
								test="user.roleId==6">普通管理员</s:elseif> <s:else>高级管理员</s:else></td>
					</tr>
					<tr>
						<th>论坛等级</th>
						<td><s:property value="user.usersGrade.id" /></td>
					</tr>
					<tr>
						<th>论坛头衔</th>
						<td><s:property value="user.usersGrade.honor" /></td>
					</tr>
					<tr>
						<th>可用积分</th>
						<td><s:property value="user.integral" />&nbsp;</td>
					</tr>
					<tr>
						<th>帖&nbsp;子&nbsp;数</th>
						<td><s:property value="user.topCount" />&nbsp;&nbsp;<a
							href="user_ManageUserAllTopics.action?user.id=<s:property value="user.id" />"
							style="color: blue">前往查看&gt;&gt;</a></td>
					</tr>
					<tr>
						<th>评&nbsp;论&nbsp;数</th>
						<td><s:property value="user.comCount" />&nbsp;</td>
					</tr>
					<tr>
						<th>注册时间</th>
						<td><s:date name="user.registerTime"
								format="yyyy-MM-dd hh:mm:ss" />&nbsp;</td>
					</tr>
					<tr height="80px;">
						<th>个人简介</th>
						<td>&nbsp;<s:property value="user.introduction" />
						</td>
					</tr>
					<s:if test="#session.tu.roleId==16&&user.roleId!=16">
						<tr height="40px;">
							<th>赋予权限</th>
							<td><s:if test="user.roleId==6">
									<input type="button" value="普通用户" class="butt"
										onclick="warnUpdate(<s:property value="user.id" />)" />
								</s:if> <s:else>
									<input type="button" value="普通管理员" class="butt"
										onclick="warnAUpdate(<s:property value="user.id" />)" />
								</s:else> <input type="submit" value="高级管理员" class="butt"
								onclick="warnSUpdate(<s:property value="user.id" />)" />
							</td>
						</tr>
					</s:if>
					<s:else></s:else>
				</table>
			</div>
		</div>
	</div>
</body>
<%
	}
%>
</html>
