<%@page import="java.net.URLEncoder"%>
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

<title>个人中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
.Homebackground {
	width: 1004px;
	margin: 0 auto;
	min-height: 800px;
	background-color: #F5F5F5;
}

.topNav {
	float: left;
}

.leftBodyBlank {
	width: 22px;
	min-height: 100px;
	float: left;
}

.tBody {
	width: 960px;
	font-family: 微软雅黑;
	float: left;
}

.topBody {
	width: 960px;
	height: 24px;
	margin-top: 10px;
	float: left;
	font-size: 14px;
	font-family: 微软雅黑;
}

.userStyle {
	width: 960px;
	margin-top: 15px;
	float: left;
	font-size: 14px;
	/* border: 1px solid #C2D5E3; */
	min-height: 400px;
}

.leftBodyNav {
	width: 140px;
	max-height: 450px;
	float: left;
	padding: 0px 25px 0px 15px;
}

.leftBodyNavStyle {
	width: 100%;
	height: 40px;
	line-height: 40px;
	font-size: 16px;
	float: left;
	border-bottom: 1px solid white;
	background-color: #A2C1DE;
}

.leftBodyNavStyle:hover {
	background-color: #89ADCE;
	color: white;
}

.leftBodyNavDown {
	width: 100%;
	height: 40px;
	line-height: 40px;
	font-size: 16px;
	font-weight: bolder;
	float: left;
	color: white;
	/* border-bottom: 1px solid white; */
	background-color: #7EA5C6;
}

.rightBody {
	width: 778px;
	max-height: 450px;
	float: left;
	/* border-left: 1px solid #C2D5E3; */
}

.content {
	width: 778px;
	float: left;
	background-color: white;
}

.butt {
	background-color: #6699CC;
	width: 100px;
	height: 30px;
	border: 0;
	color: white;
	font-size: 18px;
}

.butt:hover {
	background-color: #71AAE3;
	border: 0;
}

.leftBodyNav a:LINK,.leftBodyNav a:HOVER,.leftBodyNav a:ACTIVE,.leftBodyNav a:VISITED,.leftBodyNav a:FOCUS
	{
	text-decoration: none;
}
</style>
<script type="text/javascript">
	if (self.location != top.location) {
		top.location.href = self.location.href;
	}
	function iFrameHeight(n) {
		var ifm = document.getElementById("test" + n);
		var subWeb = document.frames ? document.frames["test" + n].document
				: ifm.contentDocument;
		if (ifm != null && subWeb != null) {
			ifm.height = subWeb.body.scrollHeight;
		}
	}
	function test_item(n) {
		var menu = document.getElementById("leftBodyNav");
		var menuli = menu.getElementsByTagName("div");
		for ( var i = 1; i <= menuli.length; i++) {
			menuli[n - 1].className = "leftBodyNavDown";
			menuli[i - 1].className = "leftBodyNavStyle";
			document.getElementById("home").style.display = 'none';//隐藏
			document.getElementById("content").style.display = 'block';//隐藏  
		}
	};
	function checkULogin() {
		var msg = '<s:property value="#session.tu.username"/>';
		if (!msg) {
			var returnVal = window.confirm("未登录或登录已失效！请登录！", "提示");
			if (returnVal) {
				location.href = 'login.jsp';
			}
			return false;
		}
		return true;
	}
	
</script>
</head>

<body>
	<div class="Homebackground">
		<div class="topNav">
			<jsp:include page="../top.jsp"></jsp:include>
		</div>
		<div class="leftBodyBlank"></div>
		<div class="tBody">
			<div class="topBody" align="left">
				<div style="float: left;">
					<a href="index.jsp" title="论坛首页"><img
						src="image/homepage_24.png"></img> </a>
				</div>
				<div style="float: left;line-height:24px;">
					&nbsp;&gt;&nbsp;<a href="./index.jsp">论坛</a>&nbsp;&gt;&nbsp;个人中心
				</div>
			</div>
			<div class="userStyle">
				<div class="leftBodyNav" id="leftBodyNav">
					<a href="user_GetNews.action" target="test1"
						onclick="return checkULogin()"><div class="leftBodyNavStyle"
							id="leftBodyNavStyle_1" onclick="javascript:test_item(1);">
							我的消息
							<s:if test="#session.tu.clock==0"></s:if>
							<s:else>
								<sup style="color: red;font-size: 14px;"><s:property
										value="#session.tu.clock" /> </sup>
							</s:else>
						</div> </a> <a href="user_GetTopics.action" target="test1"
						onclick="return checkULogin()"><div class="leftBodyNavStyle"
							id="leftBodyNavStyle_2" onclick="javascript:test_item(2);">我的帖子</div>
					</a> <a href="user_GetComments.action" target="test1"
						onclick="return checkULogin()"><div class="leftBodyNavStyle"
							id="leftBodyNavStyle_3" onclick="javascript:test_item(3);">我的评论</div>
					</a> <a href="u/updateInfo.jsp" target="test1"
						onclick="return checkULogin()"><div class="leftBodyNavStyle"
							id="leftBodyNavStyle_5" onclick="javascript:test_item(4);">修改资料</div>
					</a> <a href="u/updatePass.jsp" target="test1"
						onclick="return checkULogin()"><div class="leftBodyNavStyle"
							id="leftBodyNavStyle_6" onclick="javascript:test_item(5);">修改密码</div>
					</a> <a href="user_Logout.action" target="_top"
						onclick="return checkULogin()"><div class="leftBodyNavStyle"
							style="color: red">安全退出</div> </a>
				</div>
				<div class="rightBody">
					<div id="home" style="background-color: white;">
						<div
							style="float: left;background-color: white;width: 50px;max-height:450px;min-height: 420px;"></div>
						<div align="left"
							style="float: left;background-color: white;width: 360px;max-height:450px;min-height: 420px;line-height: 28px;">
							<p>
								用户名： <font
									style="font-size: 20px;line-height: 30px;color: #6699CC;font-weight: bolder;">
									<s:property value="user.username" /> </font><br /> 昵称：
								<s:property value="user.nickname" />
								<br />性别：
								<s:property value="user.sex" />
								<br />邮箱：
								<s:property value="user.email" />
								<br />职业：
								<s:property value="user.profession" />
								<br />现居地：
								<s:property value="user.comefrom" />
								<br />用户权限：
								<s:if test="user.roleId==0">普通用户</s:if>
								<s:elseif test="user.roleId==6">普通管理员</s:elseif>
								<s:else>超级管理员</s:else>
								<br />论坛等级：
								<s:property value="user.usersGrade.id" />
								<br />论坛头衔：
								<s:property value="user.usersGrade.honor" />
								<br />可用积分：
								<s:property value="user.integral" />
								<br />我的帖子数：
								<s:property value="user.topCount" />
								&nbsp;&nbsp;&nbsp;&nbsp;我的评论数：
								<s:property value="user.comCount" />
								<br />注册时间：
								<s:date name="user.registerTime"
									format="yyyy-MM-dd hh:mm:ss" />
						</div>
						<div align="left"
							style="float: left;background-color: white;width: 360px;min-height: 420px;max-height:450px">
							<p>
								&nbsp;&nbsp;&nbsp;&nbsp;<img alt="我的头像"
									style="width: 140px;height: 200px;"  onerror="this.src='./image/ds-java.png'" 
									src="<s:property value="user.picture" />">
							<p>
								个人简介：<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<s:property value="user.introduction" />
						</div>

					</div>
					<div class="content" id="content" style="display: none">
						<iframe id="test1" class="no" name="test1" frameBorder="0"
							scrolling="no" width="100%" height="100%"
							onLoad="iFrameHeight(1)"></iframe>
					</div>
				</div>
			</div>
		</div>

		<div class="copyRight">
			<jsp:include page="../copyRight.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
