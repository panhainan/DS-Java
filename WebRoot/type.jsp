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

<title>版块</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
.background {
	width: 1004px;
	overflow: auto;
	background-color: #F5F5F5;
	margin: 0 auto;
	min-height: 700px;
}

.leftBodyBlank {
	width: 22px;
	min-height: 300px;
	float: left;
}

.tBody {
	width: 982px;
	float: left;
	font-family: 微软雅黑;
}

.smallNav {
	width: 982px;
	height: 24px;
	margin-top: 10px;
	float: left;
	font-size: 14px;
}

.cateTitle:HOVER {
	color: red;
}
</style>
</head>

<body>
	<div class="background" align="left">
		<div class="top_nav">
			<jsp:include page="/top.jsp"></jsp:include>
		</div>
		<div class="leftBodyBlank"></div>
		<div class="tbody">
			<div class="smallNav" align="left">
				<div style="float: left;">
					<a href="index.jsp" title="论坛首页"><img
						src="image/homepage_24.png"></img> </a>
				</div>
				<div style="float: left;line-height:24px;">
					&nbsp;&gt;&nbsp;<a href="index.jsp">论坛</a>&nbsp;&gt;&nbsp;版块
				</div>
			</div>
			<div style="float: left;margin-top: 15px;">
				<s:iterator value="listCate" var="cate">
					<div style="width: 960px;margin:0px 0px 20px 0px;float: left;">
						<div
							style="width: 960px;height: 35px;background-color: #A2C1DE;line-height: 35px;color:white">
							&nbsp;&nbsp; <a class="cateTitle"
								href="cate_goCate.action?category.id=<s:property value="#cate.id" />"><s:property
									value="#cate.name" /> </a><font style="font-size: 12px;">(共<font
								style="font-weight: bolder;"><s:property
										value="#cate.countTopics" /> </font>主题/<font
								style="font-weight: bolder;"><s:property
										value="#cate.countComments" /> </font>回复)</font>
						</div>
						<div style="width: 958px;border: 1px solid #C2D5E3;">
							<iframe
								src="cate_getType.action?category.id=<s:property value="#cate.id" />"
								marginwidth="0" marginheight="0px" frameborder="0"
								scrolling="no" width="100%"></iframe>
						</div>
					</div>
				</s:iterator>
			</div>
		</div>
		<div class="copyRight">
			<jsp:include page="/copyRight.jsp"></jsp:include>
		</div>
	</div>


</body>
</html>
