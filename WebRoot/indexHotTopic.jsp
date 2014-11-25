<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<style type="text/css">
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
</style>

<div style="font-family: 微软雅黑;">
	<table>
		<%
			int i = 1;
		%>

		<s:iterator value="listTopic" id="topic">
			<tr>
				<td style="width: 35px;font-style: italic;" align="center"><%=i%></td>
				<td><div style="width:600px;">
						<div
							style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;max-width: 400px;float: left;">
							<a
								href="cate_goCate.action?category.id=<s:property value="#topic.topicsType.typesCategory.id" />"
								target="_top" style="font-size: 14px;"><s:property
									value="#topic.topicsType.typesCategory.name" /> </a>-<a
								href="type_goType.action?type.id=<s:property
								value="#topic.topicsType.id" />"
								target="_top" style="font-size: 14px;"><s:property
									value="#topic.topicsType.name" /> </a>||&nbsp;<a
								href="topic_goTopic.action?topic.id=<s:property
								value="#topic.id" />"
								target="_top" class="topicTitle"><s:property
									value="#topic.title" /> </a>
						</div>
						<div style="float: left;font-size: 12px;color: #4C9ED9">
							&nbsp;&nbsp;[
							<s:property value="#topic.integral" />分
							]&nbsp;[回复:
							<s:property value="#topic.countComment" />
							]&nbsp;[
							<s:if test="#topic.status==0">未结帖</s:if>
							<s:else>已结帖</s:else>
							]<s:if
							test="#topic.niceTopic==1">[<font color="red">精品</font>]</s:if> <s:else></s:else>
						</div>
					</div></td>
				<td align="right" width="80px;"><div
						style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;max-width: 80px;">
						<a class="topicTitle" href="user_GoUser.action?user.id=<s:property
										value="#topic.topicsUser.id" />" target="_top"
							style="font-size: 14px;"><s:property
								value="#topic.topicsUser.nickname" />
						</a>&nbsp;&nbsp;
					</div></td>
			</tr>
			<%
				i++;
			%>
		</s:iterator>
	</table>
</div>
