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

<title>热门帖子</title>

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
	width: 360px;
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

table td {
	height: 30px;
	font-size: 16px;
}

a:link,a:visited {
	color: #525252;
	text-decoration: none;
} /* 未被访问的链接 */ /*已被访问的链接 */
a:hover {
	color: #525252;
	text-decoration: underline;
} /* 鼠标指针移动到链接上 */
.topicTitle:link,.topicTitle:visited {
	color: #525252;
	text-decoration: none;
}

.topicTitle:hover {
	color: #2C86E5;
	text-decoration: underline;
}

.titleStyle {
	width: 960px;
	height: 35px;
	line-height: 30px;
	margin-top: 15px;
	background-color: #A2C1DE;
	float: left;
	text-align: left;
}

.listTopicDiv {
	float: left;
	width: 960px;
	height: 320px;
	background-color: white;
	width: 960px;
	/* border: 1px solid #C2D5E3; */
}

.listTopicStyle td {
	border-bottom: 1px dashed silver;
}
</style>
<script type="text/javascript">
	function checkNewTop() {
		var msg = '<s:property value="#session.tu.username"/>';
		if (!msg) {
			var returnVal = window.confirm("未登录或登录已失效！请登录！", "提示");
			if (returnVal) {
				location.href = 'login.jsp';
			}
		} else {
			window.location.href = 'cate_new_getAll.action';
		}
	}
</script>
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
					&nbsp;&gt;&nbsp;<a href="index.jsp">论坛</a>&nbsp;&gt;&nbsp;热门帖子
				</div>
			</div>
			<div>
				<div class="editMenu">
					<input type="button" value="发帖" class="butt" style="width: 80px;"
						onclick="checkNewTop()" /> <input type="button" value="刷新"
						onclick="window.location.href = 'topic_getAllTopic.action'"
						class="butt" style="width: 80px;" />
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
								<a href="topic_GetHotTopic.action?nowPage=2"><button>2</button>
								</a>
								<a
									href="topic_GetHotTopic.action?nowPage=<s:property value="%{currentPage+1}"/>"><button
										style="width: 80px;">下一页</button> </a>
							</s:if>
							<s:elseif test="currentPage==2">
								<a
									href="topic_GetHotTopic.action?nowPage=<s:property value="%{currentPage-1}"/>"><button
										style="width: 80px;">上一页</button> </a>
								<a href="topic_GetHotTopic.action?nowPage=1"><button>1</button>
								</a>
								<button disabled="disabled">2</button>
								<button disabled="disabled" style="width: 80px;">下一页</button>
							</s:elseif>
						</s:elseif>
						<s:elseif test="%{totalPages == 3}">
							<s:if test="currentPage==1">
								<button disabled="disabled" style="width: 80px;">上一页</button>
								<button disabled="disabled">1</button>
								<a href="topic_GetHotTopic.action?nowPage=2"><button>2</button>
								</a>
								<a href="topic_GetHotTopic.action?nowPage=3"><button>3</button>
								</a>
								<a
									href="topic_GetHotTopic.action?nowPage=<s:property value="%{currentPage+1}"/>"><button
										style="width: 80px;">下一页</button> </a>
							</s:if>
							<s:elseif test="currentPage==2">
								<a
									href="topic_GetHotTopic.action?nowPage=<s:property value="%{currentPage-1}"/>"><button
										style="width: 80px;">上一页</button> </a>
								<a href="topic_GetHotTopic.action?nowPage=1"><button>1</button>
								</a>
								<button disabled="disabled">2</button>
								<a href="topic_GetHotTopic.action?nowPage=3"><button>3</button>
								</a>
								<a
									href="topic_GetHotTopic.action?nowPage=<s:property value="%{currentPage+1}"/>"><button
										style="width: 80px;">下一页</button> </a>
							</s:elseif>
							<s:elseif test="currentPage==3">
								<a
									href="topic_GetHotTopic.action?nowPage=<s:property value="%{currentPage-1}"/>"><button
										style="width: 80px;">上一页</button> </a>
								<a href="topic_GetHotTopic.action?nowPage=1"><button>1</button>
								</a>
								<a href="topic_GetHotTopic.action?nowPage=2"><button>2</button>
								</a>
								<button disabled="disabled">3</button>
								<button disabled="disabled" style="width: 80px;">下一页</button>
							</s:elseif>
						</s:elseif>
						<s:elseif test="%{totalPages > 3}">
							<s:if test="%{currentPage==1}">
								<button disabled="disabled" style="width: 80px;">上一页</button>
								<button disabled="disabled">1</button>
								<a href="topic_GetHotTopic.action?nowPage=2"><button>2</button>
								</a>
								<a><button disabled="disabled">...</button> </a>
								<a
									href="topic_GetHotTopic.action?nowPage=<s:property value="%{totalPages}" />"><button>
										<s:property value="%{totalPages}" />
									</button> </a>
								<a
									href="topic_GetHotTopic.action?nowPage=<s:property value="%{currentPage+1}"/>"><button
										style="width: 80px;">下一页</button> </a>
							</s:if>
							<s:elseif test="%{currentPage<totalPages}">
								<a
									href="topic_GetHotTopic.action?nowPage=<s:property value="%{currentPage-1}"/>"><button
										style="width: 80px;">上一页</button> </a>
								<a href="topic_GetHotTopic.action?nowPage=1"><button>1</button>
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
									href="topic_GetHotTopic.action?nowPage=<s:property value="%{totalPages}" />"><button>
										<s:property value="%{totalPages}" />
									</button> </a>
								<a
									href="topic_GetHotTopic.action?nowPage=<s:property value="%{currentPage+1}"/>"><button
										style="width: 80px;" style="width: 80px;">下一页</button> </a>
							</s:elseif>
							<s:elseif test="%{currentPage==totalPages}">
								<a
									href="topic_GetHotTopic.action?nowPage=<s:property value="%{currentPage-1}"/>"><button
										style="width: 80px;">上一页</button> </a>
								<a href="topic_GetHotTopic.action?nowPage=1"><button>1</button>
								</a>
								<a><button disabled="disabled">...</button> </a>
								<a
									href="topic_GetHotTopic.action?nowPage=<s:property value="%{totalPages-1}" />"><button>
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
						if (selectedPage != 0 && selectedPage != currentPage) {
							document.goPageForm.action = "topic_GetHotTopic.action?nowPage="
									+ selectedPage;
							goPageForm.submit();
						}

					}
				</script>
				<div class="pageGo" align="right">
					<form action="topic_GetHotTopic.action" method="post"
						name="goPageForm">
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
			<div class="titleStyle" align="left">
				<table border="0" style="margin: 0;		font-size: 12px;">
					<tr style="height: 30px;line-height: 30px;">
						<td style="width:160px" align="left">&nbsp;&nbsp;类型</td>
						<td style="width:440px" align="left">标题</td>
						<td style="width:140px" align="center">作者</td>
						<td style="width:40px" align="center">积分</td>
						<td style="width:40px" align="center">回复</td>
						<td style="width:110px" align="center">发布时间</td>
					</tr>
				</table>
			</div>
			<div class="listTopicDiv">
				<table align="left" class="listTopicStyle">
					<s:iterator value="listTopic" id="topic">
						<tr>
							<td style="width:160px;" align="left">&nbsp;<a
								href="cate_goCate.action?category.id=<s:property value="#topic.topicsType.typesCategory.id" />"
								target="_top" style="font-size: 14px;"><s:property
										value="#topic.topicsType.typesCategory.name" /> </a>-<a
								href="type_goType.action?type.id=<s:property
								value="#topic.topicsType.id" />"
								target="_top" style="font-size: 14px;"><s:property
										value="#topic.topicsType.name" /> </a></td>
							<td align="left"><div
									style="width:440px; white-space:nowrap;overflow:hidden;text-overflow:ellipsis;float: left;">
									<font style="font-size: 13px;color: #4C9ED9"><s:if
							test="#topic.niceTopic==1">[<font color="red">精品</font>]</s:if> <s:else></s:else>[<s:if
											test="#topic.status==0">未结帖</s:if> <s:else>已结帖</s:else>]</font><a
										href="topic_goTopic.action?topic.id=<s:property
								value="#topic.id" />"
										target="_top" class="topicTitle"><s:property
											value="#topic.title" /> </a>
								</div>
							</td>

							<td align="center" width="140px;"><a class="topicTitle"
								href="user_GoUser.action?user.id=<s:property
										value="#topic.topicsUser.id" />" target="_top" style="font-size: 14px;"><s:property
										value="#topic.topicsUser.nickname" /> </a>
							</td>
							<td align="center" width="40px" style="font-size: 13px;"><s:property
									value="#topic.integral" />
							</td>
							<td align="center" width="40px" style="font-size: 13px;"><s:property
									value="#topic.countComment" />
							</td>
							<td style="font-size: 12px;" width="110px;" align="right"><s:date
									name="#topic.topicTime" format="yyyy-MM-dd HH:mm"></s:date>
							</td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
		<div class="copyRight">
			<jsp:include page="/copyRight.jsp"></jsp:include>
		</div>
	</div>

</body>
</html>
