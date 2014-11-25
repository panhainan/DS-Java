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

<title>关于论坛</title>
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
					&nbsp;&gt;&nbsp;<a href="./index.jsp">论坛</a>&nbsp;&gt;&nbsp;关于论坛
				</div>
			</div>
			<div
				style="float: left;margin-top: 5px;width: 880px;margin-left:60px;word-wrap: break-word; word-break: normal;escape:false;text-align: left;">

				<p style="text-align: center;font-size: 24px;">
					<span style=";font-size:24px;font-family:'宋体'">关于论坛</span>
				</p>
				<p style="line-height: 2em;">
					<span style=";font-size:14px;font-family:'宋体'">&nbsp;&nbsp;&nbsp;
							 DS-JAVA论坛由<a href="http://www.dreamstation.cn" style="color: red" target="_blank">梦之站</a>团队（英文名<a href="http://www.dreamstation.cn" style="color: red" target="_blank">DreamStation</a>，缩写DS）创立于2014年8月，旨在为广大IT和软件编程从业者及爱好者提供知识传播、经验交流和发展兴趣社交的服务平台。在开放、包容和高互动性的氛围带动下，结合严谨的隐私和版权管理体制，本论坛吸引了大量具有专业知识或相关兴趣的用户群，并拥有高质量的精品原创内容，形成了独具特色的论坛文化，拥有一定的舆论影响力。</span>
				</p>
				<p style="line-height: 2em;">
					<span style=";font-size:14px;font-family:'宋体'">&nbsp;&nbsp;&nbsp;
						目前本论坛还在初步建设中，还有很多功能会陆续推出，敬请期待，谢谢大家的支持！</span>
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
