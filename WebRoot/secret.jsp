<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>隐私政策</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="./JS/jquery-1.11.0.js"></script>
<style type="text/css">
.background {
	width: 1004px;
	overflow: auto;
	background-color: #F5F5F5;
	margin: 0 auto;
}

.leftBodyBlank {
	width: 22px;
	min-height: 300px;
	float: left;
}

.tBody {
	width: 960px;
	margin-top: 10px;
	float: left;
	font-size: 14px;
	font-family: 微软雅黑;
}
</style>
</head>

<body>
	<div class="background">
		<div class="topNav">
			<jsp:include page="/top.jsp"></jsp:include>
		</div>
		<div class="leftBodyBlank"></div>
		<div class="tBody" style="float: left;">
			<div class="topBody" align="left">
				<div style="float: left;">
					<a href="index.jsp" title="论坛首页"><img
						src="image/homepage_24.png" /> </a>
				</div>
				<div style="float: left;line-height:24px;">
					&nbsp;&gt;&nbsp;<a href="./index.jsp">论坛</a>&nbsp;&gt;&nbsp;隐私政策
				</div>
			</div>
			<div
				style="float: left;margin-top: 5px;width: 920px;margin-left:30px;word-wrap: break-word; word-break: normal;escape:false;text-align: left;">
				<p style="text-align: center;font-size: 24px;">
					<span style=";font-size:24px;font-family:&#39;宋体&#39;">隐私政策</span>
				</p>
				<p style="text-indent:28px">
					<span style=";font-size:14px;font-family:&#39;宋体&#39;">为保证论坛正常发展，规避意外风险，从而向广大用户提供更优质的服务，故此特设版权声明。为保证您的知识产权不被侵犯，</span><span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">建议您在接受本站服务之前，请务必仔细阅读</span><span
						style=";font-size:14px;font-family:&#39;宋体&#39;">。</span>
				</p>
				<p>
					<span style="font-size:14px;font-family:&#39;宋体&#39;">1、</span><span
						style=";font-size:14px;font-family:&#39;宋体&#39;">本站将按照法律规定删除违法信息，并一概不受理当事方或委托方的相关投诉。</span>
				</p>
				<p
					style=";text-autospace:ideograph-other;text-align:left;line-height:22px">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">2、</span><span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">所有在本网站发布的转载文章，必须事先征得原作者同意，且注明原作者姓名和文章来源，如有侵权或违法行为，本网站不承担任何法律责任；所有文章仅代表作者个人的观点和立场，其侵权或违法行为的责任由作者本人承担。</span>
				</p>
				<p
					style=";text-autospace:ideograph-other;text-align:left;line-height:22px">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">3、&nbsp;凡本网站上所有的文字、图片和音频、视频稿件，任何媒体、网站或个人未经本网站协议授权不得转载、链接、转贴或以其他方式复制发表，如有需要，请与本网站联系相关事宜。违者本网站将追究其法律责任。</span>
				</p>
				<p
					style=";text-autospace:ideograph-other;text-align:left;line-height:22px">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">4、&nbsp;</span><span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">本站</span><span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">所刊载的文章资料、图片、图表、数据仅供参考使用，所刊登的广告，均为广告商的个人意见及表达方式，和本网站无任何关系，如有侵权或违法行为应由其相关广告商承担责任。</span>
				</p>
				<p
					style=";text-autospace:ideograph-other;text-align:left;line-height:22px">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">5、&nbsp;用户在本站注册时，本网站将在您的同意及确认下，通过注册表格等形式要求您提供一些个人私密资料，在未经用户本人同意的情况下，本站绝对不会将用户的任何资料泄露给第三方。但当政府部门、司法机关依照法定程序要求本网站披露时或不可抗力除外。</span>
				</p>
				<p
					style=";text-autospace:ideograph-other;text-align:left;line-height:22px">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">6</span><span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">、&nbsp;凡以任何方式登陆本网站或直接、间接使用本网站资料者，视为自愿接受本项声明的约束。</span>
				</p>
				<p
					style=";text-autospace:ideograph-other;text-align:left;line-height:22px">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">7</span><span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">、&nbsp;如果您有任何疑问，请与我们联系</span><span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">。</span>
				</p>
				<p
					style=";text-autospace:ideograph-other;text-align:left;line-height:22px">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">电话：</span><span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">0731-2309047&nbsp;&nbsp;</span><span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">&nbsp;Email:</span><span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:&#39;宋体&#39;">dreamstationx.@sina.com</span>
				</p>
				<p>
					<br />
				</p>

			</div>
		</div>
		<div class="copyRight">
			<jsp:include page="/copyRight.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
