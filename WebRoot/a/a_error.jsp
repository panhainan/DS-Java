<%@ page language="java"
	import="java.util.*,com.phn.bean.Users,java.io.*" pageEncoding="UTF-8"%>
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
<%
	Users user = (Users) session.getAttribute("tu");
	if (user == null) {
		PrintWriter pw = response.getWriter();
		pw.println("<script type='text/javascript'>alert('未登录或登录已失效！请登录！');window.location.href = '"
				+ basePath + "login.jsp';</script>");

	} else if (user.getRoleId() == 0) {
		PrintWriter pw = response.getWriter();
		pw.println("<script type='text/javascript'>alert('权限不够！切换账号登录');window.location.href = '"
				+ basePath + "login.jsp';</script>");
	} else {
%>
<title>操作错误</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="./ueditor/third-party/SyntaxHighlighter/shCoreDefault.css">
<script type="text/javascript"
	src="./ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
<!-- 配置文件 -->
<script type="text/javascript" src="./ueditor/Topic-ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="./ueditor/ueditor.all.js"></script>
<!-- 语言包文件(建议手动加载语言包，避免在ie下，因为加载语言失败导致编辑器加载失败) -->
<script type="text/javascript" src="./ueditor/lang/zh-cn/zh-cn.js"></script>

<link rel="stylesheet" href="./CSS/manage.css" />
<script type="text/javascript" src="./JS/jquery-1.11.0.js"></script>
<script type="text/javascript">
	SyntaxHighlighter.all();
	function validAnno() {
		var topTitle = $("#tTitle").val().replace(/(&nbsp;)|\s|\u00a0/g, '');
		var content = editor.getContent();
		if (topTitle == "" || topTitle == null) {
			alert("请填写文公告标题!");
			return false;
		} else if (content.replace(/(&nbsp;)|\s|\u00a0/g, '') == ""
				|| content.replace(/(&nbsp;)|\s|\u00a0/g, '') == null) {
			alert("公告内容不能为空！");
			return false;
		} else if (editor.getContentLength(true) < 50) {
			alert("文章内容不得少于50个字符！");
			return false;
		}

		$("#content").val(editor.getContent());
		console.log(editor.getContent());
		return true;
	};
	function showLen(obj) {
		document.getElementById('span').innerHTML = ' 您还可以输入'
				+ (50 - obj.value.length) + '个字符';
		document.getElementById('span').style.color = 'red';
	}
</script>
<style type="text/css">
.background {
	width: 1004px;
	overflow: auto;
	background-color: #F5F5F5;
	margin: 0px auto; /*设置居中  */
}
</style>
</head>

<body>
	<div class="body">
		<div class="top">
			<img alt="" src="image/manager_top.jpg" />
		</div>
		<div class="left">
			<jsp:include page="./left.jsp"></jsp:include>
		</div>

		<div class="right">
			<br />
			<br />
			<h1 align="center">操作失败</h1>
			<br />
			<br />
			<div align="center">
				<img alt="error" src="image/error.png">
			</div>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>
