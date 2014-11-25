<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>">
<script type="text/javascript">
	function iframeAutoFit() {
		try {
			if (window != parent) {
				var a = parent.document.getElementsByTagName("IFRAME");
				for ( var i = 0; i < a.length; i++) //author:meizz
				{
					if (a[i].contentWindow == window) {
						var h1 = 0, h2 = 0;
						a[i].parentNode.style.height = a[i].offsetHeight + "px";
						a[i].style.height = "10px";
						if (document.documentElement
								&& document.documentElement.scrollHeight) {
							h1 = document.documentElement.scrollHeight;
						}
						if (document.body)
							h2 = document.body.scrollHeight;
						var h = Math.max(h1, h2);
						if (document.all) {
							h += 4;
						}
						if (window.opera) {
							h += 1;
						}
						a[i].style.height = a[i].parentNode.style.height = h
								+ "px";
					}
				}
			}
		} catch (ex) {
		}
	}
	if (window.attachEvent) {
		window.attachEvent("onload", iframeAutoFit);
		//window.attachEvent("onresize",  iframeAutoFit);
	} else if (window.addEventListener) {
		window.addEventListener('load', iframeAutoFit, false);
		//window.addEventListener('resize',  iframeAutoFit,  false);
	}
</script>
<script type="text/javascript" src="./JS/jquery-1.11.0.js"></script>
<style type="text/css">
.background {
	width: 100%;
	height: 100%;
	margin: 0 auto;
	font-family: "微软雅黑";
}

.topicTitle:link,.topicTitle:visited {
	color: #525252;
	text-decoration: none;
}

.topicTitle:hover {
	color: #2C86E5;
	text-decoration: underline;
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

.listTopicStyle {
	background-color: white;
	margin-bottom: 10px;
	border: 1px solid #C2D5E3;
}

.listTopicStyle a:link,.listTopicStyle a:visited {
	color: black;
	text-decoration: none;
} /* 未被访问的链接 */ /*已被访问的链接 */
.listTopicStyle a:hover {
	color: #2979BF;
	font-weight: bolder;
	text-decoration: none;
} /* 鼠标指针移动到链接上 */
</style>
<div class="background">
	<div style="min-height: 350px;">
		<s:if test="listTopic.size()==0">
			<h1 align="center" style="color: #6699CC">暂无帖子</h1>
		</s:if>
		<s:iterator value="listTopic" id="topic">
			<table class="listTopicStyle">
				<tr>
					<td
						style="border-bottom: 1px solid #C2D5E3;background-color: #EFF4FB;width:750px;height: 20px">
						<div style="width: 400px;text-align: left;float: left;">
							<font style="font-size: 12px;color: #817E7E;">&nbsp;状态：</font> <font
								style="font-size: 14px;color: red;"><s:if
									test="#topic.status==0">
								未结帖
							</s:if> <s:else>
								已结帖
							</s:else> <s:if test="topic.niceTopic==1">[<font color="red">精品</font>]</s:if>
								<s:else></s:else> </font> <font style="font-size: 12px;color: #817E7E;">[问题积分:
								<s:property value="#topic.integral" /> ]&nbsp;[评论量: <s:property
									value="#topic.countComment" /> ]</font>
						</div>
						<div style="width: 300px;text-align: right;float: left;">
							<font style="font-size: 14px;color: #817E7E;">发布时间:<s:date
									name="#topic.topicTime" format="yyyy-MM-dd HH:mm"></s:date> </font>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width:750px;height: 30px">
						<div
							style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;max-width: 750px;float: left;">
							<a
								href="cate_goCate.action?category.id=<s:property value="#topic.topicsType.typesCategory.id" />"
								target="_top" style="font-size: 14px;">[<s:property
									value="#topic.topicsType.typesCategory.name" />]</a><a
								href="type_goType.action?type.id=<s:property
								value="#topic.topicsType.id" />"
								target="_top" style="font-size: 13px;">[<s:property
									value="#topic.topicsType.name" />]</a>&nbsp;&nbsp;<a
								href="topic_goTopic.action?topic.id=<s:property
								value="#topic.id" />"
								target="_top" class="topicTitle"><font
								style="font-size: 16px;font-weight: bold;"><s:property
										value="#topic.title" /> </font> </a>
						</div>
					</td>
				</tr>
			</table>
		</s:iterator>

	</div>
	<s:if test="listTopic.size()!=0">
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
						<a href="user_GetTopics.action?nowPage=2"><button>2</button> </a>
						<a
							href="user_GetTopics.action?nowPage=<s:property value="%{currentPage+1}"/>"><button
								style="width: 80px;">下一页</button> </a>
					</s:if>
					<s:elseif test="currentPage==2">
						<a
							href="user_GetTopics.action?nowPage=<s:property value="%{currentPage-1}"/>"><button
								style="width: 80px;">上一页</button> </a>
						<a href="user_GetTopics.action?nowPage=1"><button>1</button> </a>
						<button disabled="disabled">2</button>
						<button disabled="disabled" style="width: 80px;">下一页</button>
					</s:elseif>
				</s:elseif>
				<s:elseif test="%{totalPages == 3}">
					<s:if test="currentPage==1">
						<button disabled="disabled" style="width: 80px;">上一页</button>
						<button disabled="disabled">1</button>
						<a href="user_GetTopics.action?nowPage=2"><button>2</button> </a>
						<a href="user_GetTopics.action?nowPage=3"><button>3</button> </a>
						<a
							href="user_GetTopics.action?nowPage=<s:property value="%{currentPage+1}"/>"><button
								style="width: 80px;">下一页</button> </a>
					</s:if>
					<s:elseif test="currentPage==2">
						<a
							href="user_GetTopics.action?nowPage=<s:property value="%{currentPage-1}"/>"><button
								style="width: 80px;">上一页</button> </a>
						<a href="user_GetTopics.action?nowPage=1"><button>1</button> </a>
						<button disabled="disabled">2</button>
						<a href="user_GetTopics.action?nowPage=3"><button>3</button> </a>
						<a
							href="user_GetTopics.action?nowPage=<s:property value="%{currentPage+1}"/>"><button
								style="width: 80px;">下一页</button> </a>
					</s:elseif>
					<s:elseif test="currentPage==3">
						<a
							href="user_GetTopics.action?nowPage=<s:property value="%{currentPage-1}"/>"><button
								style="width: 80px;">上一页</button> </a>
						<a href="user_GetTopics.action?nowPage=1"><button>1</button> </a>
						<a href="user_GetTopics.action?nowPage=2"><button>2</button> </a>
						<button disabled="disabled">3</button>
						<button disabled="disabled" style="width: 80px;">下一页</button>
					</s:elseif>
				</s:elseif>
				<s:elseif test="%{totalPages > 3}">
					<s:if test="%{currentPage==1}">
						<button disabled="disabled" style="width: 80px;">上一页</button>
						<button disabled="disabled">1</button>
						<a href="user_GetTopics.action?nowPage=2"><button>2</button> </a>
						<a><button disabled="disabled">...</button> </a>
						<a
							href="user_GetTopics.action?nowPage=<s:property value="%{totalPages}" />"><button>
								<s:property value="%{totalPages}" />
							</button> </a>
						<a
							href="user_GetTopics.action?nowPage=<s:property value="%{currentPage+1}"/>"><button
								style="width: 80px;">下一页</button> </a>
					</s:if>
					<s:elseif test="%{currentPage<totalPages}">
						<a
							href="user_GetTopics.action?nowPage=<s:property value="%{currentPage-1}"/>"><button
								style="width: 80px;">上一页</button> </a>
						<a href="user_GetTopics.action?nowPage=1"><button>1</button> </a>
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
							href="user_GetTopics.action?nowPage=<s:property value="%{totalPages}" />"><button>
								<s:property value="%{totalPages}" />
							</button> </a>
						<a
							href="user_GetTopics.action?nowPage=<s:property value="%{currentPage+1}"/>"><button
								style="width: 80px;" style="width: 80px;">下一页</button> </a>
					</s:elseif>
					<s:elseif test="%{currentPage==totalPages}">
						<a
							href="user_GetTopics.action?nowPage=<s:property value="%{currentPage-1}"/>"><button
								style="width: 80px;">上一页</button> </a>
						<a href="user_GetTopics.action?nowPage=1"><button>1</button> </a>
						<a><button disabled="disabled">...</button> </a>
						<a
							href="user_GetTopics.action?nowPage=<s:property value="%{totalPages-1}" />"><button>
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
					document.goPageForm.action = "user_GetTopics.action?nowPage="
							+ selectedPage;
					goPageForm.submit();
				}

			}
		</script>
		<div class="pageGo" align="right">
			<form action="user_GetTopics.action" method="post" name="goPageForm">
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
	</s:if>
</div>