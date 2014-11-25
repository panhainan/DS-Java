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
}

.inputText {
	width: 180px;
	height: 30px;
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

.file {
	border: 1px solid #C2D5E3;
	height: 24px
}
</style>
<script type="text/javascript" src="./JS/jquery-1.11.0.js"></script>
<script type="text/javascript" src="./JS/uploadPic.js"></script>
<script type="text/javascript">
	function iFrameHeight(n) {
		var ifm = document.getElementById("test" + n);
		var subWeb = document.frames ? document.frames["test" + n].document
				: ifm.contentDocument;
		if (ifm != null && subWeb != null) {
			ifm.height = subWeb.body.scrollHeight;
		}
	}
	function warnNic() {
		var ns = document.getElementById("nics");
		ns.innerHTML = '&nbsp;长度须小于16个字符，不能为空，用于展示给其它用户查看!';
		ns.style.color = 'green';
		ns.style.backgroundColor = '#E2F3FE';
		ns.style.border = '1px solid #BED7EE';
	}
	function warnEmail() {
		var prts = document.getElementById("emailts");
		prts.innerHTML = '&nbsp;请输入您的常用有效邮箱！';
		prts.style.color = 'green';
		prts.style.backgroundColor = '#E2F3FE';
		prts.style.border = '1px solid #BED7EE';
	}
	function checknic() {
		var nics = document.getElementById("uNic").value;
		var nic = nics.replace(/(&nbsp;)|\s|\u00a0/g, '');
		var ns = document.getElementById("nics");
		var defaultNickname = document.getElementById("defaultNic").value;
		if (nic == null || nic == "") {
			ns.innerHTML = "&nbsp;<img src='image/wrong.gif'></img>&nbsp;请按要求输入昵称!&nbsp;";
			ns.style.color = "red";
			ns.style.backgroundColor = '#F8F8F8';
			ns.style.border = '1px solid red';
			return false;
		}
		if(defaultNickname==nic){ 
			ns.innerHTML = '&nbsp;未修改!&nbsp;';
			ns.style.color = 'green';
			ns.style.backgroundColor = '#F8F8F8';
			ns.style.border = '0';
			return true;
		}
			$.post(
							"user_CheckNic.action",
							{
								"userNic" : nic
							},
							function(data) {
								var d = $.parseJSON(data);
								// console.log(d.success);
								if (d.success == true) {
									ns.innerHTML = '&nbsp;<img src="image/wrong.gif"></img>&nbsp;该昵称已被使用!';
									ns.style.color = "red";
									ns.style.backgroundColor = '#F8F8F8';
									ns.style.border = '1px solid red';
									return false;
								}
								;
							});
		ns.innerHTML = '&nbsp;<img src="image/icon_ok.gif"></img>';
		ns.style.color = 'green';
		ns.style.backgroundColor = '#F8F8F8';
		ns.style.border = '0';
		return true;
	}
	function checkemail() {
		var userEmail = $("#uEmail").val();
		var ets = document.getElementById("emailts");
		var defaultEmail =  $("#defaultEmail").val();
		if(defaultEmail==userEmail){
			ets.innerHTML = '&nbsp;未修改！&nbsp;';
			ets.style.color = 'green';
			ets.style.backgroundColor = '#F8F8F8';
			ets.style.border = '0';
			return true;
		}
		if (!isEmail(userEmail)) {
			ets.innerHTML = "&nbsp;<img src='image/wrong.gif'></img>&nbsp;请注意邮箱格式!";
			ets.style.color = "red";
			ets.style.backgroundColor = '#F8F8F8';
			ets.style.border = '1px solid red';
			return false;
		}
		ets.innerHTML = '&nbsp;<img src="image/icon_ok.gif"></img>';
		ets.style.color = 'green';
		ets.style.backgroundColor = '#F8F8F8';
		ets.style.border = '0';
		return true;
	}
	function isEmail(str) {
		var reg = /[a-z0-9-]{1,30}@[a-z0-9-]{1,65}.[a-z]{3}/;
		return reg.test(str);
	}
	function checkUpdate() {
	if (!checknic()) {
		return false;
	} else if (!checkemail()) {
		return false;
	}
	return true;
}
	
 	var msg=""+'${request.tipMessage}'; 
 	if(msg!=""){ 
   		alert(msg); 
 	} 
 	
</script>

<div id="home">

	<div
		style="float: left;background-color: white;width: 50px;height: 100%"></div>
	<div style="float: left;width: 460px;height: 100%">
		<form action="user_UpdateInfo.action" method="post" onsubmit="return checkUpdate()">
			<div align="left"
				style="float: left;background-color: white;width: 100%;height: 90%;line-height: 28px;">
				<table>
					<tr height="30px;">
						<td width="60px;">用户名</td>
						<td><s:property value="#session.tu.username" /></td>
					</tr>
					<tr>
						<td>昵&nbsp;&nbsp;&nbsp;称</td>
						<td><input type="text" class="inputText"
							value="<s:property value="#session.tu.nickname" />"
							name="userNic" maxlength="16" onblur="return checknic()"
							onfocus="warnNic()" id="uNic" /><input id="defaultNic"
							value="<s:property value="#session.tu.nickname" />"
							style="display: none;" />
						</td>
						<td id="nics"
							style="height:20px;line-height:12px;text-align: left;font-size: 12px;"></td>
					</tr>
					<tr>
						<td>性&nbsp;&nbsp;&nbsp;别</td>
						<td><input name="userSex" type="radio" 
							value="男"> 男 <input name="userSex" type="radio"
							value="女"> 女</td>
					</tr>
					<tr>
						<td>邮&nbsp;&nbsp;&nbsp;箱</td>
						<td><input type="text" name="userEmail" class="inputText"
							id="uEmail" value="<s:property value="#session.tu.email" />"
							onfocus="warnEmail()" onblur="return checkemail();" /><input
							id="defaultEmail"
							value="<s:property value="#session.tu.email" />"
							style="display: none;" />
						</td>
						<td id="emailts"
							style="height:20px;line-height:20px;text-align: left;font-size: 12px;"></td>
					</tr>
					<tr>
						<td>职&nbsp;&nbsp;&nbsp;业</td>
						<td><input type="text" class="inputText" name="userProfe"
							value="<s:property value="#session.tu.profession" />">
						</td>
					</tr>

					<tr>
						<td>现居地</td>
						<td><input type="text" class="inputText" name="userFrom"
							value="<s:property value="#session.tu.comefrom" />"></td>
					</tr>
				</table>
				个人简介<br />
				<s:textarea style="width: 450px;height: 100px;resize: none;"
					value="%{#session.tu.introduction}" name="userIntro">
				</s:textarea>

			</div>
			<div align="center"
				style="float: left;background-color: white;width: 100%;height:10%;margin-top: 10px;">
				<input type="submit" value="保存资料" class="butt" />
			</div>
		</form>
	</div>
	<div align="center"
		style="float: left;background-color: white;width: 240px;height: 100%;border-left: 1px solid #C2D5E3;">
		<p>
			<img alt="我的头像" style="width: 160px;height: 220px;"  onerror="this.src='./image/ds-java.png'" 
				src="<s:property value="#session.tu.picture" />">
		<form action="uploadUserPic.action" enctype="multipart/form-data"
			method="POST" onsubmit="return uploadF();">
			<div align="right">
				<input type="text" class="inputText" style="width: 160px;"
					id="f_file"> <input type="button" value="选择" class="butt" 
					style="width: 50px;" onClick="fu.click()"> <input
					name="fileUpload" type="file" id="fu"
					onchange="f_file.value=this.value" style="display:none">
			</div>
			<input type="text" name="user.username"
				value="<s:property value="#session.tu.username" />"
				style="display: none;" />
			<p>
				<input type="submit" value="上传" class="butt"
					style="height: 30px;width: 80px;font-size: 16px;" />
			<p align="left" style="margin-left: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;允许上传格式bmp,png,gif,jpg!</p>
		</form>
	</div>

</div>




