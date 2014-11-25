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

<title>DS-Java论坛</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="DS-Java,DS-Java论坛,Java论坛,论坛">
<meta http-equiv="description"
	content="DS-Java论坛为软件开发者（特别是Java软件开发者）提供了互相交流互相学习的网络平台。">
<link rel="stylesheet" type="text/css" href="./CSS/index.css">
<script type="text/javascript" src="./JS/jquery-1.11.0.js"></script>
<script type="text/javascript">
	function checkLogin() {
		var msg = '<s:property value="#session.tu.username"/>';
		if (!msg) {
			var returnVal = window.confirm("未登录或登录已失效！请登录！", "提示");
			if (returnVal) {
				location.href = 'login.jsp';
			}
			return false;
		}
		return true;
	}
</script>
<style type="text/css">
body,html {
	width: 1004px;
	padding: 0px;
	margin: 0px auto; /*设置居中  */
	text-align: center; /*兼容性更好  */
	border: none;
}
.btn {
	border: none;
	border-radius: 0;
	min-width: 80px;
	height: 28px;
	line-height: 16px;
	color: #fff;
}

.btn-top {
	width: 40px;
	height: 40px;
	background-color: #ccc;
}

.btn-top:hover,.btn-top:focus {
	background-color: #676767;
}

.btn-top .glyphicon-chevron-up .glyphicon-share-alt {
	font-size: 18px;
}

.glyphicon {
	position: relative;
	top: 1px;
	display: inline-block;
	font-style: normal;
	font-weight: normal;
	line-height: 1;
}

.glyphicon-share-alt:before {
	content: "回复";
}

.glyphicon-chevron-up:before {
	content: "顶部";
}
</style>
</head>

<body>
	<div class="background">
		<div class="topNav">
			<jsp:include page="/top.jsp"></jsp:include>
		</div>
		<div class="leftBodyBlank"></div>
		<div class="tBody">
			<div class="topBody" align="left">
				<div style="float: left;">
					<a href="index.jsp" title="论坛首页"><img
						src="image/homepage_24.png" /> </a>
				</div>
				<div style="float: left;line-height:24px;">&nbsp;&gt;&nbsp;论坛
				</div>
			</div>
			<div class="leftBody">
				<div class="hot">
					<div class="ltitle">
						<div style="float: left;width: 660px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;热帖榜&nbsp;&nbsp;&nbsp;&nbsp;<font
								style="font-style: italic;">TOP 10 </font>
						</div>
						<div align="center" style="float: left;width: 80px;color: #6699CC">
							<a href="topic_GetHotTopic.action">More&gt;&gt;</a>
						</div>
					</div>
					<div class="hotContent">
						<iframe width="740px" height="335px" frameborder="0"
							scrolling="no" src="topic_getIndexHotTopic.action"></iframe>
					</div>
				</div>
				<div class="fresh">
					<div class="ltitle">
						<div style="float: left;width: 660px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新帖榜&nbsp;&nbsp;&nbsp;&nbsp;<font
								style="font-style: italic;">TOP 10 </font>
						</div>
						<div align="center" style="float: left;width: 80px;">
							<a href="topic_getAllTopic.action">More&gt;&gt;</a>
						</div>
					</div>
					<div class="freshContent">
						<iframe width="740px" height="335px" frameborder="0"
							scrolling="no" src="topic_getIndexFreshTopic.action"></iframe>
					</div>
				</div>
				<div class="classics">
					<div class="ltitle">
						<div style="float: left;width: 660px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;精帖榜&nbsp;&nbsp;&nbsp;&nbsp;<font
								style="font-style: italic;">TOP 10 </font>
						</div>
						<div align="center" style="float: left;width: 80px;color: #6699CC">
							<a href="topic_GetNiceTopic.action">More&gt;&gt;</a>
						</div>
					</div>
					<div class="classicsContent">
						<iframe width="740px" height="335px" frameborder=0 scrolling="no"
							src="topic_getIndexNiceTopic.action"></iframe>
					</div>
				</div>
			</div>
			<div class="rightBody">
				<div class="announces">
					<div class="rtitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;论坛公告
					</div>
					<div class="announcesContent">
						<iframe width="200px" height="220px" frameborder=0 scrolling="no"
							src="anno_getIndexAnno.action"></iframe>
					</div>
				</div>
				<div class="newButton">
					<form action="cate_new_getAll.action" method="get"
						onsubmit="return checkLogin();">
						<input type="submit" value="我要发帖">
					</form>
				</div>
				<!-- <div class="hero">
					<div class="rtitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;论坛牛人
					</div>
					<div class="announcesContent"></div>
				</div> -->
				<div class="helps">
					<div class="rtitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;论坛帮助
					</div>
					<div class="announcesContent">
						<iframe width="200px" style="min-height: 220px;" frameborder=0
							scrolling="no" src="help_getIndexHelp.action"></iframe>
					</div>
				</div>
				<div class="friendLink">
					<div class="rtitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;友情链接
					</div>
					<div class="announcesContent">
						<iframe width="200px" height="170px" frameborder=0 scrolling="no"
							src="indexFriend.jsp"> </iframe>
					</div>
				</div>
			</div>
		</div>
		<div class="copyRight">
			<jsp:include page="/copyRight.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
