<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>">

<style type="text/css">
#home {
	background-color: white;
	width: 778px;
	height: 360px;;
	font-size: 14px;
	font-family: 微软雅黑;
	font-size: 14px;
	margin: auto;
}

.inputText {
	width: 250px;
	height: 26px;
	font-size: 16px;
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

table tr {
	height: 30px;
	line-height: 40px;
}
</style>
<script type="text/javascript" src="./JS/jquery-1.11.0.js"></script>
<script type="text/javascript">
function warnOPass() {
	var pts = document.getElementById("oldPassts");
	pts.innerHTML = '&nbsp;请输入您的旧密码！';
	pts.style.color = 'green';
	pts.style.backgroundColor = '#E2F3FE';
	pts.style.border = '1px solid #BED7EE';
}
function warnNPass() {
	var pts = document.getElementById("newPassts");
	pts.innerHTML = '&nbsp;长度须在6-16个字节之间，请注意区分大小写！';
	pts.style.color = 'green';
	pts.style.backgroundColor = '#E2F3FE';
	pts.style.border = '1px solid #BED7EE';
}
function warnRNPass() {
	var prts = document.getElementById("newRPassts");
	prts.innerHTML = '&nbsp;请注意与上述输入密码一致！';
	prts.style.color = 'green';
	prts.style.backgroundColor = '#E2F3FE';
	prts.style.border = '1px solid #BED7EE';
}
function checknpass() {
	var userPass = $("#newPass").val();
	var pts = document.getElementById("newPassts");
	if (userPass.length < 6 || userPass.length > 16) {
		pts.innerHTML = "&nbsp;<img src='image/wrong.gif'></img>&nbsp;请按要求输入密码!";
		pts.style.color = "red";
		pts.style.backgroundColor = '#F8F8F8';
		pts.style.border = '1px solid red';
		return false;
	}
	pts.innerHTML = '&nbsp;<img src="image/icon_ok.gif"></img>&nbsp;';
	pts.style.color = 'green';
	pts.style.backgroundColor = '#F8F8F8';
	pts.style.border = '0';
	return true;
}

function checkrnpass() {
	var userPass = $("#newPass").val();
	var userRPass = $("#newRPass").val();
	var prts = document.getElementById("newRPassts");
	if (userRPass.length < 6 || userRPass.length > 15) {
		prts.innerHTML = "&nbsp;<img src='image/wrong.gif'></img>&nbsp;请按要求输入密码!";
		prts.style.color = "red";
		prts.style.backgroundColor = '#F8F8F8';
		prts.style.border = '1px solid red';
		return false;
	} else if (userPass != userRPass) {
		prts.innerHTML = "&nbsp;<img src='image/wrong.gif'></img>&nbsp;请按要求输入密码!";
		prts.style.color = "red";
		prts.style.backgroundColor = '#F8F8F8';
		prts.style.border = '1px solid red';
		return false;
	}
	prts.innerHTML = '&nbsp;<img src="image/icon_ok.gif"></img>&nbsp;';
	prts.style.color = 'green';
	prts.style.backgroundColor = '#F8F8F8';
	prts.style.border = '0';
	return true;
}
function checkopass() {
	var userPass = $("#oldPass").val();
	var userDOPass = $("#defaultOldPass").val();
	var prts = document.getElementById("oldPassts");
	if (userPass != userDOPass) {
		prts.innerHTML = "&nbsp;<img src='image/wrong.gif'></img>&nbsp;旧密码输入错误!";
		prts.style.color = "red";
		prts.style.backgroundColor = '#F8F8F8';
		prts.style.border = '1px solid red';
		return false;
	}
	prts.innerHTML = '&nbsp;<img src="image/icon_ok.gif"></img>&nbsp;';
	prts.style.color = 'green';
	prts.style.backgroundColor = '#F8F8F8';
	prts.style.border = '0';
	return true;
}
function checkUpdatePass(){
	if (!checkopass()) {
			return false;
		} else if (!checknpass()) {
			return false;
		} else if (!checkrnpass()) {
			return false;
		}
		return true;
}
var msg=""+'${request.tipMessage}'; 
 	if(msg!=""){ 
   		alert(msg); 
 	} 
</script>
<div id="home" align="left">
	<form action="user_UpdatePass.action" method="post"
		onsubmit="return checkUpdatePass();">
		<table style="padding-top: 80px;margin-left: 80px">
			<tr>
				<td height="26px;">旧密码</td>
				<td><input id="oldPass" type="password"
					onblur="return checkopass();" onfocus="warnOPass()"
					class="inputText"
					value="<s:property value="#session.tu.password" />" /> <input
					id="defaultOldPass" type="password" style="display: none;"
					value="<s:property value="#session.tu.password" />" />
				</td>
				<td id="oldPassts"
					style="height:20px;line-height:20px;text-align: left;font-size: 12px;"></td>
			</tr>
			<tr>
				<td>新密码</td>
				<td><input name="userPass" type="password" class="inputText"
					id="newPass" onblur="return checknpass();" onfocus="warnNPass()" />
				</td>
				<td id="newPassts"
					style="height:20px;line-height:20px;text-align: left;font-size: 12px;"></td>
			</tr>
			<tr>
				<td>确认密码</td>
				<td><input type="password" class="inputText" id="newRPass"
					onblur="return checkrnpass();" onfocus="warnRNPass()" /></td>
				<td id="newRPassts"
					style="height:20px;line-height:20px;text-align: left;font-size: 12px;"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="确认修改" class="butt" /></td>
			</tr>
		</table>
	</form>
</div>




