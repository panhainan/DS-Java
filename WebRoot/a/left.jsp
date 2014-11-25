<%@ page language="java"
	import="java.util.*,com.phn.bean.Users,java.io.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<head><link rel="SHORTCUT ICON" href="./image/logo.jpg"></head>
<link rel="stylesheet" type="text/css" href="./CSS/manager_left.css">
<%
	Users user = (Users) session.getAttribute("tu");
	if (user.getRoleId() == 16) {
%>
<div class="links">
	<a href="user_ManageAll.action"><span
		style=" line-height:50px;"><font color="white">用 户 管 理</font> </span>
	</a>
</div>
<%
	}
%>
<div class="links">
	<a href="topic_ManageAll.action"><span
		style=" line-height:50px;"><font color="white">帖 子 管 理</font> </span>
	</a>
</div>
<div class="links">
	<a href="cate_ManageAll.action"><span style=" line-height:50px;"><font
			color="white">版 块 管 理</font> </span> </a>
</div>
<div class="links">
	<a href="anno_ManageAll.action"><span
		style=" line-height:50px;"><font color="white">公 告 管 理</font> </span>
	</a>
</div>
<div class="links">
	<a href="help_ManageAll.action"><span style="line-height:50px;"><font
			color="white">帮 助 管 理</font> </span> </a>
</div>
<div class="links">
	<a href="./index.jsp"><span style=" line-height:50px;"><font
			color="white">返 回 首 页</font> </span> </a>
</div>
<div style="padding: 6px;margin-left: 5px;margin-right: 5px;margin-top:40px;font-size: 14px;line-height: 20px;color: white;float: left;font-family: 微软雅黑;	border: 1px solid #C2D5E3;">
	<font color="red">注意：</font>由于评论数量众多，评论管理设置在相应的帖子页面，主要就是删除评论功能（即将评论设为被删除状态，并未正删除）。
</div>