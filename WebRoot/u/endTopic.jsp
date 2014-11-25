<%@ page language="java" import="java.util.*,com.phn.bean.Users"
	pageEncoding="UTF-8"%>
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

<title><s:if test="topic.status==0">[未结帖]</s:if>
	<s:else>[已结帖]</s:else>
	<s:property value="topic.title" />
</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="./JS/jquery-1.11.0.js"></script>

<style type="text/css">
.btn {
	border: none;
	border-radius: 0;
	min-width: 80px;
	height: 28px;
	line-height: 16px;
	color: #fff;
}

.btn-top {
	width: 40px;
	height: 40px;
	background-color: #ccc;
}

.btn-top:hover,.btn-top:focus {
	background-color: #676767;
}

.btn-top .glyphicon-chevron-up .glyphicon-share-alt {
	font-size: 18px;
}

.glyphicon {
	position: relative;
	top: 1px;
	display: inline-block;
	font-style: normal;
	font-weight: normal;
	line-height: 1;
}

.glyphicon-share-alt:before {
	content: "回复";
}

.glyphicon-chevron-up:before {
	content: "顶部";
}

.background {
	width: 1004px;
	overflow: auto;
	background-color: #F5F5F5;
	margin: 0 auto;
	min-height: 700px;
}

.tBody {
	margin-left: 22px;
	font-family: 微软雅黑;
}

.smallNav {
	width: 982px;
	height: 24px;
	margin-top: 10px;
	float: left;
	font-size: 14px;
}

.editMenu {
	width: 520px;
	height: 30px;
	margin-top: 15px;
	float: left;
}

.butt {
	background-color: #6699CC;
	width: 100px;
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

.titleStyle {
	width: 960px;
	height: 40px;
	line-height: 40px;
	margin-top: 15px;
	background-color: #A2C1DE;
	float: left;
	text-align: left;
}

.topicStyle {
	float: left;
	width: 958px;
	min-height: 300px;
	background-color: #EFF4FB;
	border: 1px solid #C2D5E3;
}

.userInfo {
	width: 190px;
	height: 280px;
	float: left;
	background-color: #EFF4FB;
}

.commentInfo {
	float: left;
	width: 958px;
	/* 	min-height: 50px; */
	background-color: #EFF4FB;
	border: 1px solid #C2D5E3;
	font-family: 微软雅黑;
}

.commentUserInfo {
	width: 190px;
	height: 260px;
	float: left;
	background-color: #EFF4FB;
}

.theComment {
	text-align: left;
	width: 728px;
	min-height: 240px;
	float: left;
	padding: 10px 20px 20px 20px;
	word-break: break-all;
	float: left;
}
</style>
<script type="text/javascript" language="javascript">
	function goDiv(div) {
		var a = $("#" + div).offset().top;
		$("html,body").animate({
			scrollTop : a
		}, 'slow');
	}
	function goTop() {
		$('html, body').animate({
			scrollTop : 0
		}, 'slow');
	};
	function countGrade() {
		var totalGrade = $("#totalGrade").val();
		var giveGrade = $(".giveGrade");
		giveAllGrade = 0;
		for ( var i = 0; i < giveGrade.length; i++) {
			if (parseInt(giveGrade[i].value) < 0 || giveGrade[i].value == ""
					|| giveGrade[i].value == null) {
				giveGrade[i].value = 0;
			}
			if (parseInt(giveGrade[i].value) >= 0) {
			} else {
				giveGrade[i].value = 0;
			}
			giveAllGrade += parseInt(giveGrade[i].value);
		}
		$(".lastGrade").val(totalGrade - giveAllGrade);
		if ($(".lastGrade").val() < 0) {
			giveGrade.css("border", "1px solid red");
		}
		if ($(".lastGrade").val() >= 0) {
			giveGrade.css("border", "1px solid silver");
		}
	}
	function endTopic() {
		var topic_id = $("#topicId").val();
		var arrayObj = new Array(); //创建一个数组
		var giveGrade = $(".giveGrade");
		for ( var i = 0; i < giveGrade.length; i++) {
			arrayObj.push(giveGrade[i].value);
		}
		if ($(".lastGrade").val() == 0) {
			window.location.href = "topic_EndTopic.action?listFloor="
					+ arrayObj + "&&topic.id=" + topic_id;
		} else {
			alert("请按要求分配分值！");
		}
	}
</script>
</head>

<body>
	<div class="background">
		<div class="topNav">
			<jsp:include page="../top.jsp"></jsp:include>
		</div>
		<div class="tBody">
			<div class="smallNav" align="left">
				<div style="float: left;">
					<a href="index.jsp" title="论坛首页"><img
						src="image/homepage_24.png"></img> </a>
				</div>
				<div style="float: left;line-height:24px;">
					&nbsp;&gt;&nbsp;<a>论坛</a>&nbsp;&gt;&nbsp;<a>发帖</a>
				</div>
			</div>
			<div class="editMenu">
				<input type="button" value="确认结帖" onclick="endTopic();" class="butt" />
				<input type="button" value="取消" onclick="history.go(-1)"
					class="butt" />
			</div>

			<div class="titleStyle" align="left">
				<div style="width:800px;float: left;font-size: 13px; ">
					&nbsp; <font style="font-size: 13px;color: white"><s:if
							test="topic.status==0">[未结帖]</s:if>
						<s:else>[已结帖]</s:else>
					</font>
					<s:property value="topic.title" />
					<font style="font-size: 13px;color: white">[积分: <s:property
							value="topic.integral" /> 分]</font>
				</div>
			</div>
			<div class="topicStyle">
				<input id="totalGrade" type="text" style="display: none;"
					value="<s:property value="topic.integral" />" /> <input
					id="topicId" value="<s:property value="topic.id" />"
					style="display: none;">
				<div class="userInfo">
					<div style="height:180px;" align="center">
						<img width="120px;" height="160px;" style="padding-top: 20px;"
							src="<s:property value="topic.topicsUser.picture"/>">
					</div>
					<div style="height:80px;padding-top: 20px" align="center">
						<s:property value="topic.topicsUser.nickname" />
						<br /> 等级：
						<s:property value="topic.topicsUser.usersGrade.id" />
						<br /> 头衔：
						<s:property value="topic.topicsUser.usersGrade.honor" />
					</div>
				</div>
				<div
					style="border-left:1px solid  #C2D5E3;min-height: 300px;float: left;width: 760px;">
					<div class="theTop">
						<div
							style="height: 28px;line-height:28px;font-size:13px;width:440px;text-align: left;float: left;border-bottom:1px solid  #C2D5E3;"
							align="left">
							&nbsp;&nbsp;发表于：
							<s:date name="topic.topicTime" format="yyyy-MM-dd HH:mm:ss"></s:date>
						</div>
						<div
							style="height: 28px;line-height:28px;font-size:14px;width:320px;text-align: right;float: left;border-bottom:1px solid  #C2D5E3;"
							align="left">楼主&nbsp;&nbsp;&nbsp;&nbsp;</div>
					</div>
					<div
						style="text-align: left;width: 728px;float: left;padding:10px 20px 20px 20px;word-break: break-all;">
						<s:property value="topic.content" escape="false" />
					</div>
				</div>
			</div>
			<div>
				<s:iterator value="listComment" id="comment">
					<div class="commentInfo">
						<s:iterator value="#comment.commentsUser" id="u">
							<div class="commentUserInfo">
								<div style="width:200px;height:180px;" align="center">
									<img alt="上传图片" width="120px;" height="160px;"
										style="padding-top: 20px"
										src="<s:property value="#u.picture"/>">
								</div>
								<div style="width:200px;height:80px;padding-top: 20px"
									align="center">
									<s:property value="#u.nickname" />
									<br /> 等级：
									<s:property value="#u.usersGrade.id" />
									<br /> 头衔：
									<s:property value="#u.usersGrade.honor" />
								</div>
							</div>
							<div
								style="border-left:1px solid  #C2D5E3;min-height: 280px;float: left;width: 758px">
								<div
									style="height: 28px;line-height:28px;font-size:13px;width:440px;text-align: left;float: left;border-bottom:1px solid  #C2D5E3;"
									align="left">
									&nbsp;&nbsp;回复于：
									<s:date name="#comment.commentTime"
										format="yyyy-MM-dd HH:mm:ss"></s:date>
								</div>
								<div
									style="height: 28px;line-height:28px;font-size:14px;width:318px;text-align: right;float: left;border-bottom:1px solid  #C2D5E3;">
									<div style="float: right;font-size: 12px;">
										&nbsp;#
										<s:property value="#comment.floor" />
										&nbsp;&nbsp;
									</div>
									<s:if test="topic.topicsUser.id!=#comment.commentsUser.id">
										<div style="float: right;">
											&nbsp;&nbsp;给<input value="0" class="giveGrade" type="text"
												onchange="countGrade();"
												style="width: 40px;text-align: center;" />分
										</div>
										<div style="float: right;width: 100px;font-size: 12px;">
											剩余<input type="text" class="lastGrade" disabled="disabled"
												style="text-align: center;width: 50px;"
												value="<s:property value="topic.integral" />"> 分
										</div>

									</s:if>
									<s:else></s:else>

								</div>
								<div class="theComment"
									id="comment<s:property value="#comment.floor" />">
									<s:property value="#comment.content" escape="false" />
								</div>
							</div>
						</s:iterator>

					</div>
				</s:iterator>
			</div>
			<div class="editMenu">
				<input type="button" value="确认结帖" onclick="endTopic();" class="butt" />
				<input type="button" value="取消" onclick="history.go(-1)"
					class="butt" />
			</div>
		</div>
		<div class="copyRight">
			<jsp:include page="../copyRight.jsp"></jsp:include>
		</div>
	</div>
</body>

</html>
