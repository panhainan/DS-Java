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
		pw.println("<script type='text/javascript'>alert('未登录或登录已失效！请登录！');window.location.href = '"+basePath+"login.jsp';</script>");

	} else if (user.getRoleId() == 0) {
		PrintWriter pw = response.getWriter();
		pw.println("<script type='text/javascript'>alert('权限不够！切换账号登录');window.location.href = '"+basePath+"login.jsp';</script>");
	} else {
%>
<title>发布公告</title>

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
		}else if(content.replace(/(&nbsp;)|\s|\u00a0/g, '')==""||content.replace(/(&nbsp;)|\s|\u00a0/g, '')==null){
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
	function showLen(obj){
   		document.getElementById('span').innerHTML = ' 您还可以输入'+ (50 - obj.value.length) +'个字符';
   		document.getElementById('span').style.color='red';
	}
</script>
<style type="text/css">
.background {
	width: 1004px;
	overflow: auto;
	background-color: #F5F5F5;
	margin: 0px auto; /*设置居中  */
}

.titleStyle {
	width: 810px;
	height: 40px;
	margin:0px;
	line-height: 40px;
	background-color: #A2C1DE;
	font-family: 微软雅黑;
	float: left;
	text-align: left;
	color: white;
	font-weight: bolder;
}

.newStyle {
	width: 800px;
	font-family: 微软雅黑;
	float: left;
	/* border: 1px solid silver; */
}

.newStyle table {
	border-right: 1px solid #A9CBEE;
	border-bottom: 1px solid #A9CBEE
}

.newStyle table td,.newStyle table th {
	height: 30px;
	line-height: 30px;
	border-left: 1px solid #A9CBEE;
	border-top: 1px solid #A9CBEE;
}

.butt {
	background-color: #6699CC;
	width: 120px;
	height: 30px;
	margin-top: 5px;
	margin-bottom: 5px;
	border: 0;
	color: white;
	font-size: 18px;
	border: 0;
}

.butt:hover {
	background-color: #71AAE3;
	border: 0;
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
			<div class="newToic" align="center">

				<form id="newT" method="post" onsubmit="return validAnno()"
					action="anno_ManageAdd.action">
					<div class="titleStyle" align="left">
						&nbsp;&nbsp;&nbsp;&nbsp;发布论坛公告:
					</div>
					<div class="newStyle">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>标题：<input type="text" name="announce.title" id="tTitle"
									onkeyup="showLen(this);"
									style="width: 600px;height: 26px;line-height: 24px;font-size: 14px;padding-left: 6px;"
									maxlength="50" /><span id="span"
									style="color:red;font-size:14px"> 您还可以输入50个字符</span></td>
							</tr>
							<tr>
								<td width="700px"><textarea id="content"
										style="display: none;" name="announce.announcement"></textarea>
									<script id="container" type="text/plain"></script>
								</td>
								<script type="text/javascript">
							var editor = UE.getEditor('container');
						</script>
							</tr>
							<tr>
								<td width="700px" style="line-height: 50px;"><div
										align="right"
										style="width: 30%;float: left;line-height: 50px;">
										<input type="submit" value="确认"
											class="butt" />
									</div>
									<div align="center" style="width: 70%;float: left;">
										<input type="button" value="取消" class="butt"
											onclick="if(window.confirm('你确定要取消吗？')){history.go(-1);};" />
									</div>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>
