<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>技术支持</title>
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
}

.leftBodyBlank {
	width: 22px;
	min-height: 300px;
	float: left;
}

.tBody {
	width: 960px;
	margin-top: 10px;
	min-height: 400px;
	float: left;
	font-size: 14px;
	font-family: 微软雅黑;
}
</style>
</head>

<body>
	<div class="background">
		<div class="topNav">
			<jsp:include page="/top.jsp"></jsp:include>
		</div>
		<div class="leftBodyBlank"></div>
		<div class="tBody" style="float: left;">
			<div class="topBody" align="left">
				<div style="float: left;">
					<a href="index.jsp" title="论坛首页"><img
						src="image/homepage_24.png" /> </a>
				</div>
				<div style="float: left;line-height:24px;">
					&nbsp;&gt;&nbsp;<a href="./index.jsp">论坛</a>&nbsp;&gt;&nbsp;技术支持
				</div>
			</div>
			<div
				style="float: left;margin-top: 5px;width: 880px;margin-left:60px;word-wrap: break-word; word-break: normal;escape:false;text-align: left;">

				<p style="text-align: center;font-size: 24px;">
					<span style=";font-size:24px;font-family:'宋体'">技术支持</span>
				</p>
				<p style="line-height: 2em;">
					<span style=";font-size:14px;font-family:'宋体'">&nbsp;&nbsp;&nbsp;
						DS-JAVA论坛由<a href="http://www.dreamstation.cn" style="color: red"
						target="_blank">梦之站</a>团队（英文名<a href="http://www.dreamstation.cn"
						style="color: red" target="_blank">DreamStation</a>，缩写DS）提供技术支持。</span>
				</p>
				<p style="line-height: 2em;">
					<span style=";font-size:14px;font-family:'宋体'">&nbsp;&nbsp;&nbsp;
						梦之站成立于2011年，原名企业信息系统快速开发团队。梦之站专注于Java
						Web和Android开发。现在梦之站中包含三名指导老师，36名正式成员。梦之站成立了管理委员会，建立了全面的奖惩制度和准确的学习方法、路线。基本形成了以学生自主学习为主，高年级学生指导为辅，老师统筹管理的团队学习生活氛围。梦之站每年都会参加挑战杯，科技立项，ACM等比赛大赛，并且都会取得比较好的成绩。
					</span>
				</p>
				<p style="line-height: 2em;">
					<span style=";font-size:14px;font-family:'宋体'">&nbsp;&nbsp;&nbsp;
						详细情况请参见梦之站官网：<a href="www.dreamstation.cn" target="_blank">www.dreamstation.cn</a>
					</span>
				</p>
				<p>
					<br>
				</p>

			</div>
		</div>
		<div class="copyRight">
			<jsp:include page="/copyRight.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
