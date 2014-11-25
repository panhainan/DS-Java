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

<title>失败</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="./CSS/top.css">
<link rel="stylesheet" type="text/css" href="./CSS/copyRight.css">
<script type="text/javascript">
	var msg = "" + '${request.tipMessage}';
	if (msg != "") {
		alert(msg);
	}
</script>
<script type="text/javascript">
	function countDown(secs, surl) {
		//alert(surl);     
		var jumpTo = document.getElementById('jumpTo');
		jumpTo.innerHTML = secs;
		if (--secs >= 0) {
			setTimeout("countDown(" + secs + ",'" + surl + "')", 1000);
		} else {
			location.href = surl;
		}
	}
</script>
</head>

<body>
	<div style="background-color: #F5F5F5">
		<div class="top_nav">
			<jsp:include page="/top.jsp"></jsp:include>
		</div>
		<div class="tbody" style="min-height:400px;background-color: #F5F5F5 ">
			<div style="height: 150px;width: 800px;"></div>
			<font color="#6699CC" style="font-size: 24px;font-weight: bolder;">操作失败!</font>
			请稍等<span id="jumpTo"
				style="font-size: 20px;font-weight: bolder;color:#6699CC">5</span>秒后自动跳返回先前界面
			<script type="text/javascript">
				countDown(4, 'javascript:history.go(-1);');
			</script>
			<p align="center" style="font-size: 16px;">
				如果您的浏览器不支持跳转,<a style="text-decoration: none"
					href="javascript:history.go(-1);"><font color="#FF0000">请点击这里</font>
				</a>.
			</p>
		</div>
		<div class="copyRight">
			<jsp:include page="/copyRight.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
