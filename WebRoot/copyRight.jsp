<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>">
<style>
.copyRight {
	margin-top: 30px;
	width: 1004px;
	height: 100px;
	float: left;
	border-top: 1px dashed silver;
	/* 	background-color: yellow; */
}
</style>

<div style="text-align: center;margin-top: 20px;" align="center">
	<font face="微软雅黑" size="2px" style="line-height: 30px;"><a href="./aboutUs.jsp">关于论坛</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a  href="./technology.jsp">技术支持</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="./secret.jsp">隐私政策</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="./connect.jsp">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<s:if test="#session.tu.roleId==6||#session.tu.roleId==16"><a href="a/manage.jsp">后台管理</a></s:if><s:else><a onclick="alert('您没有权限！')">后台管理</a></s:else>
	</font><br /> <font face="微软雅黑" size="2px">Copyright@2014 梦之站 |
		湖南省长沙市(雨花区)万家丽南路2段960号<br /> 电话：0731-2309047
		邮箱：dreamstationx.@sina.com </font>
</div>
