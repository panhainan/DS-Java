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

<title>论坛公告</title>

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

.leftNav {
	width: 180px;
	min-height: 300px;
	padding-left: 15px;
	margin-top: 15px;
	padding-top: 10px;
	float: left;
	border: 1px solid #C2D5E3;
	background-color: #F5F5F5;
}

.rightDiv {
	margin-top: 15px;
	margin-left: 10px;
	padding: 0px 20px 0px 20px;
	width: 700px;
	float: left;
	background-color: #F5F5F5;
	border: 1px solid #C2D5E3;
}

.leftNav ul {
	list-style: none;
	margin: 0;
	padding: 0;
	width: 180px;
	height: 30px;
	line-height: 30px;
}

.leftNav ul li {
	width: 180px;
	height: 30px;
	line-height: 30px;
	font-size: 14px;
}

.contentDiv {
	width: 100%;
	float: left;
	min-height: 360px;
}

.pageNav {
	width: 50%;
	height: 40px;
	margin-bottom: 10px;
	font-size: 12px;
	float: left;
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
					&nbsp;&gt;&nbsp;<a href="index.jsp">论坛</a>&nbsp;&gt;&nbsp;论坛公告
				</div>
			</div>
			<input style="display: none;" id="annoDivId"
				value="<s:property value="annoId" />" />
			<div class="leftNav" align="left">
				<s:iterator value="listAnno" var="anno">
					<ul>
						<li><a id="title<s:property value="#anno.id" />"
							href="anno_getAll.action?annoId=<s:property value="#anno.id" />"
							target="_top"><s:property value="#anno.title" /> </a></li>
					</ul>
				</s:iterator>
			</div>
			<div class="rightDiv">
				<s:iterator value="listAnno" var="anno">
					<div style="float: left;width: 100%;display: none;"
						id="<s:property value="#anno.id" />">
						<div class="contentDiv">
							<div align="center"
								style="font-size: 26px;height:80px;line-height: 80px;width: 90%;float: left;">
								<s:property value="#anno.title" />

							</div>
							<div align="center"
								style="font-size: 14px;height:80px;line-height: 80px;width: 10%;float: left;">
								<s:if test="#session.tu.roleId==6||#session.tu.roleId==16">
									<a
										href="anno_ManageGoUpdate.action?announce.id=<s:property value="#anno.id" />">更新</a>
								</s:if>
								<s:else></s:else>
							</div>
							<div align="left">
								<s:property value="#anno.announcement" escape="false" />
							</div>
							<div align="right" style="margin-bottom: 50px;font-size: 13px;">
								发布于：
								<s:date name="#anno.thetime" format="yyyy-MM-dd HH:mm:ss"></s:date>
							</div>
						</div>
						<div class="pageNav" align="left">
							<s:if test="%{#anno.id==annoSize}">
							</s:if>
							<s:else>
								<a
									href="anno_getAll.action?annoId=<s:property value="%{#anno.id+1}" />">&lt;&lt;上一篇</a>
							</s:else>
						</div>
						<div class="pageNav" align="right">
							<s:if test="%{#anno.id==1}">

							</s:if>
							<s:else>
								<a
									href="anno_getAll.action?annoId=<s:property value="%{#anno.id-1}" />">下一篇&gt;&gt;</a>
							</s:else>
						</div>
					</div>

				</s:iterator>
			</div>

			<script type="text/javascript">
				var annoId = $("#annoDivId").val();
				showDiv(annoId);
				function showDiv(DivId) {
					//console.log("DivId=" + DivId);
					$("#" + DivId).show();
					$("#title" + DivId).css("font-weight", "bolder");
					$("#title" + DivId).css("font-size", "16px");
				}
			</script>
		</div>
		<div class="copyRight">
			<jsp:include page="./copyRight.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
