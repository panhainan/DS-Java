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

<title>查询结果</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="./JS/jquery-1.11.0.js"></script>
<style type="text/css">
body,html {
	width: 1004px;
	padding: 0px;
	margin: 0px auto; /*设置居中  */
	text-align: center; /*兼容性更好  */
	background-color: #F8F8F8;
	border: none;
}

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
	width: 960px;
	font-family: 微软雅黑;
	min-height: 460px;
	float: left;
}

.smallNav {
	width: 960px;
	height: 24px;
	margin-top: 10px;
	float: left;
	font-size: 14px;
}

.editMenu {
margin-left:20px;
	width: 340px;
	height: 30px;
	margin-top: 15px;
	float: left;
}

.pageNav {
	width: 480px;
	height: 30px;
	margin-top: 15px;
	float: left;
}

.pageGo {
	width: 120px;
	height: 30px;
	line-height: 30px;
	margin-top: 15px;
	float: left;
	font-size: 13px;
	margin-top: 15px;
}

.pageNav a button {
	width: 35px;
	height: 30px;
	font-size: 14px;
	font-family: 微软雅黑;
	background-color: white;
	border: 1px solid silver;
}

.pageNav a button:HOVER {
	width: 35px;
	height: 30px;
	font-size: 14px;
	font-family: 微软雅黑;
	background-color: #A2C1DE;
	border: 1px solid silver;
}

.pageNav button {
	width: 35px;
	height: 30px;
	font-size: 14px;
	font-family: 微软雅黑;
	background-color: #EFF4FB;
	border: 1px solid silver;
}

.butt {
	background-color: #6699CC;
	width: 120px;
	height: 30px;
	margin-right: 10px;
	float: left;
	border: 0;
	color: white;
	font-size: 18px;
}

.butt:hover {
	background-color: #71AAE3;
	border: 0;
}

a:link,a:visited {
	color: #525252;
	text-decoration: none;
} /* 未被访问的链接 */ /*已被访问的链接 */
a:hover {
	color: #525252;
	text-decoration: underline;
} /* 鼠标指针移动到链接上 */
.listTopicDiv {
	float: left;
	width: 960px;
	min-height: 320px;
	margin-top: 15px;
	width: 960px;
	/* border: 1px solid #C2D5E3; */
}

.listTopicStyle {
	background-color: white;
	margin-top: 20px;
	border: 1px solid #C2D5E3;
}
</style>
</head>

<body>
	<div class="background" align="center">
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
					&nbsp;&gt;&nbsp;<a href="index.jsp">论坛</a>&nbsp;&gt;&nbsp;查询结果
				</div>
			</div>
			<div>
				<div class="editMenu">
					<div
						style="font-size: 24px;height: 30px;line-height:30px;color: red;float: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;max-width: 250px;">
						<s:property value="content" />
					</div>
					<div style="font-size: 14px;height: 30px;line-height:30px;float: left;">的搜索结果</div>
				</div>
				<div class="pageNav" align="right">
					<s:iterator value="pageBean">
						<s:if test="%{totalPages == 1}">
							<button disabled="disabled" style="width: 80px;">上一页</button>
							<button disabled="disabled">1</button>
							<button disabled="disabled" style="width: 80px;">下一页</button>
						</s:if>

						<s:elseif test="%{totalPages == 2}">
							<s:if test="currentPage==1">
								<button disabled="disabled" style="width: 80px;">上一页</button>
								<button disabled="disabled">1</button>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=2"><button>2</button>
								</a>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=<s:property value="%{currentPage+1}"/>"><button
										style="width: 80px;">下一页</button> </a>
							</s:if>
							<s:elseif test="currentPage==2">
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=<s:property value="%{currentPage-1}"/>"><button
										style="width: 80px;">上一页</button> </a>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=1"><button>1</button>
								</a>
								<button disabled="disabled">2</button>
								<button disabled="disabled" style="width: 80px;">下一页</button>
							</s:elseif>
						</s:elseif>
						<s:elseif test="%{totalPages == 3}">
							<s:if test="currentPage==1">
								<button disabled="disabled" style="width: 80px;">上一页</button>
								<button disabled="disabled">1</button>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=2"><button>2</button>
								</a>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=3"><button>3</button>
								</a>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=<s:property value="%{currentPage+1}"/>"><button
										style="width: 80px;">下一页</button> </a>
							</s:if>
							<s:elseif test="currentPage==2">
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=<s:property value="%{currentPage-1}"/>"><button
										style="width: 80px;">上一页</button> </a>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=1"><button>1</button>
								</a>
								<button disabled="disabled">2</button>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=3"><button>3</button>
								</a>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=<s:property value="%{currentPage+1}"/>"><button
										style="width: 80px;">下一页</button> </a>
							</s:elseif>
							<s:elseif test="currentPage==3">
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=<s:property value="%{currentPage-1}"/>"><button
										style="width: 80px;">上一页</button> </a>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=1"><button>1</button>
								</a>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=2"><button>2</button>
								</a>
								<button disabled="disabled">3</button>
								<button disabled="disabled" style="width: 80px;">下一页</button>
							</s:elseif>
						</s:elseif>
						<s:elseif test="%{totalPages > 3}">
							<s:if test="%{currentPage==1}">
								<button disabled="disabled" style="width: 80px;">上一页</button>
								<button disabled="disabled">1</button>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=2"><button>2</button>
								</a>
								<a><button disabled="disabled">...</button> </a>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=<s:property value="%{totalPages}" />"><button>
										<s:property value="%{totalPages}" />
									</button> </a>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=<s:property value="%{currentPage+1}"/>"><button
										style="width: 80px;">下一页</button> </a>
							</s:if>
							<s:elseif test="%{currentPage<totalPages}">
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=<s:property value="%{currentPage-1}"/>"><button
										style="width: 80px;">上一页</button> </a>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=1"><button>1</button>
								</a>
								<s:if test="%{currentPage>2}">
									<a><button disabled="disabled">...</button> </a>
								</s:if>
								<button disabled="disabled">
									<s:property value="%{currentPage}" />
								</button>
								<s:if test="%{currentPage<totalPages-1}">
									<a><button disabled="disabled">...</button> </a>
								</s:if>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=<s:property value="%{totalPages}" />"><button>
										<s:property value="%{totalPages}" />
									</button> </a>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=<s:property value="%{currentPage+1}"/>"><button
										style="width: 80px;" style="width: 80px;">下一页</button> </a>
							</s:elseif>
							<s:elseif test="%{currentPage==totalPages}">
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=<s:property value="%{currentPage-1}"/>"><button
										style="width: 80px;">上一页</button> </a>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&content=
									<s:property value="content" />&&nowPage=1"><button>1</button>
								</a>
								<a><button disabled="disabled">...</button> </a>
								<a
									href="topic_Search.action?content=<s:property value="content" />&&nowPage=<s:property value="%{totalPages-1}" />"><button>
										<s:property value="%{totalPages-1}" />
									</button> </a>
								<button disabled="disabled">
									<s:property value="%{totalPages}" />
								</button>
								<button disabled="disabled" style="width: 80px;">下一页</button>
							</s:elseif>
						</s:elseif>
					</s:iterator>
				</div>
				<script type="text/javascript">
					function goPage() {
						var currentPage = parseInt($("#currentPage").val());
						var selectedPage = parseInt($("#selectPage").val());
						var content = $("#content").val();
						if (selectedPage != 0 && selectedPage != currentPage) {
							document.goPageForm.action = "topic_Search.action?content="
									+ content + "&&nowPage=" + selectedPage;
							goPageForm.submit();
						}

					}
				</script>
				<div class="pageGo" align="right">
					<form action="topic_Search.action" method="post" name="goPageForm">
						<input type="text" id="content"
							value="<s:property value="#content" />" style="display: none">
						<input type="text" id="currentPage"
							value="<s:property value="pageBean.currentPage" />"
							style="display: none"> 第 <select onchange="goPage();"
							id="selectPage"
							style="width:70px;height:24px;border-radius:0;border: 1px solid silver;">
							<option value="0">请选择</option>
							<%
								int i = 1;
							%>
							<s:iterator value="pageBean">
								<s:iterator begin="1" end="%{totalPages}">
									<option value="<%=i%>"><%=i%></option>
									<%
										i++;
									%>
								</s:iterator>
							</s:iterator>
						</select> 页
					</form>
				</div>
			</div>
			<div class="listTopicDiv" align="center">
				<s:iterator value="listTopic" id="topic">
					<table align="center" class="listTopicStyle">
						<tr>
							<td align="left"
								style="width:900px;height:30px;border-bottom: 1px solid #C2D5E3;background-color: #EFF4FB">&nbsp;
								<a
								href="topic_goTopic.action?topic.id=<s:property
								value="#topic.id" />"
								target="_top" class="topicTitle"><font
									style="font-size: 12px;color: #58586A">[<s:property
											value="#topic.topicsType.typesCategory.name" /> - <s:property
											value="#topic.topicsType.name" />]</font> <s:property
										value="#topic.title" /> </a>
							</td>
						</tr>
						<tr>
							<td style="font-size: 12px;height:20px;color: silver;">&nbsp;&nbsp;&nbsp;&nbsp;作者:<s:property
									value="#topic.topicsUser.nickname" />&nbsp;&nbsp;日期:<s:date
									name="#topic.topicTime" format="MM.dd HH:mm"></s:date>&nbsp;&nbsp;评论量:<s:property
									value="#topic.countComment" />
							</td>
						</tr>
						<tr>
							<td
								style="border-top: 1px solid #C2D5E3;text-align:left;width: 900px;max-width: 900px;height:60px;font-size:12px;color:#363131;">
								<div style="overflow:hidden;height:60px;padding:0px 5px 5px 5px">
									<s:property value="#topic.content" escape="false" />
								</div>
							</td>

						</tr>
					</table>
				</s:iterator>

			</div>
		</div>
		<div class="copyRight">
			<jsp:include page="/copyRight.jsp"></jsp:include>
		</div>
	</div>

</body>
</html>
