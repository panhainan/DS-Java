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

<title>联系我们</title>
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
					&nbsp;&gt;&nbsp;<a href="./index.jsp">论坛</a>&nbsp;&gt;&nbsp;联系我们
				</div>
			</div>
			<div
				style="float: left;margin-top: 5px;width: 820px;margin-left:100px;word-wrap: break-word; word-break: normal;escape:false;text-align: left;">

				<p style="text-align: center;font-size: 24px;">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:24px;font-family:'宋体'">联系我们</span>
				</p>

				<p
					style=";text-autospace:ideograph-other;text-align:left;line-height:22px">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:'宋体'">电话：</span><span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:'宋体'">0731-2309047&nbsp;&nbsp;</span><span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:'宋体'">&nbsp;</span>
				</p>
				<p
					style=";text-autospace:ideograph-other;text-align:left;line-height:22px">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:'宋体'">Email:</span><span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:'宋体'">dreamstationx.@sina.com</span>
				</p>
				<p
					style=";text-autospace:ideograph-other;text-align:left;line-height:22px">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:'宋体'">地址：湖南省长沙市（雨花区）万家丽南路2段960号</span>
				</p>
				<p
					style=";text-autospace:ideograph-other;text-align:left;line-height:22px">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:'宋体'">邮编：410000</span>
				</p>
				<p>
					<iframe class="ueditor_baidumap"
						src="http://localhost:8080/DS-Java/ueditor/dialogs/map/show.html#center=113.015465,28.073444&amp;zoom=14&amp;width=530&amp;height=340&amp;markers=113.017046,28.071946&amp;markerStyles=l,A"
						frameborder="0" height="344" width="534"></iframe>
				</p>

			</div>
		</div>
		<div class="copyRight">
			<jsp:include page="/copyRight.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
