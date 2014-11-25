function warnName() {
	var ts = document.getElementById("namets");
	ts.innerHTML = '&nbsp;长度须在3-8个字节之间，注册成功后用户名不允许修改!';
	ts.style.color = 'green';
	ts.style.backgroundColor = '#E2F3FE';
	ts.style.border = '1px solid #BED7EE';
}
function warnNic() {
	var ns = document.getElementById("nics");
	ns.innerHTML = '&nbsp;长度须小于16个字符，不能为空，用于展示给其它用户查看!';
	ns.style.color = 'green';
	ns.style.backgroundColor = '#E2F3FE';
	ns.style.border = '1px solid #BED7EE';
}
function warnPass() {
	var pts = document.getElementById("passts");
	pts.innerHTML = '&nbsp;长度须在6-16个字节之间，请注意区分大小写！';
	pts.style.color = 'green';
	pts.style.backgroundColor = '#E2F3FE';
	pts.style.border = '1px solid #BED7EE';
}
function warnRpass() {
	var prts = document.getElementById("passrts");
	prts.innerHTML = '&nbsp;请注意与上述输入密码一致！';
	prts.style.color = 'green';
	prts.style.backgroundColor = '#E2F3FE';
	prts.style.border = '1px solid #BED7EE';
}
function warnEmail() {
	var prts = document.getElementById("emailts");
	prts.innerHTML = '&nbsp;请输入您的常用有效邮箱！';
	prts.style.color = 'green';
	prts.style.backgroundColor = '#E2F3FE';
	prts.style.border = '1px solid #BED7EE';
}
function checkname() {
	var tname = document.getElementById("uName").value;
	name = tname.replace(/(&nbsp;)|\s|\u00a0/g, '');
	var ts = document.getElementById("namets");
	if (name == null || name == "" || name.length < 3) {
		ts.innerHTML = "&nbsp;<img src='image/wrong.gif'></img>&nbsp;请按要求输入用户名!";
		ts.style.color = "red";
		ts.style.backgroundColor = '#F8F8F8';
		ts.style.border = '1px solid red';
		return false;
	}
	$
			.post(
					"user_CheckName.action",
					{
						"userName" : name
					},
					function(data) {
						var d = $.parseJSON(data);
						// console.log(d.success);
						if (d.success == true) {
							ts.innerHTML = '&nbsp;<img src="image/wrong.gif"></img>&nbsp;该用户名已被使用!';
							ts.style.color = "red";
							ts.style.backgroundColor = '#F8F8F8';
							ts.style.border = '1px solid red';
							return false;
						}
						;
					});
	ts.innerHTML = '&nbsp;<img src="image/icon_ok.gif"></img>';
	ts.style.color = 'green';
	ts.style.backgroundColor = '#F8F8F8';
	ts.style.border = '0';
	return true;
}
function checknic() {
	var tnic = document.getElementById("uNic").value;
	var nic = tnic.replace(/(&nbsp;)|\s|\u00a0/g, '');
	var ns = document.getElementById("nics");
	if (nic == null || nic == "") {
		ns.innerHTML = "&nbsp;<img src='image/wrong.gif'></img>&nbsp;请按要求输入昵称!";
		ns.style.color = "red";
		ns.style.backgroundColor = '#F8F8F8';
		ns.style.border = '1px solid red';
		return false;
	}
	$
			.post(
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
function checkpass() {
	var userPass = $("#uPass").val();
	var pts = document.getElementById("passts");
	if (userPass.length < 6 || userPass.length > 16) {
		pts.innerHTML = "&nbsp;<img src='image/wrong.gif'></img>&nbsp;请按要求输入密码!";
		pts.style.color = "red";
		pts.style.backgroundColor = '#F8F8F8';
		pts.style.border = '1px solid red';
		return false;
	}else if(userPass.replace(/(&nbsp;)|\s|\u00a0/g, '')=="" || userPass.replace(/(&nbsp;)|\s|\u00a0/g, '')==null){
		pts.innerHTML = "&nbsp;<img src='image/wrong.gif'></img>&nbsp;密码不能含空格!";
		pts.style.color = "red";
		pts.style.backgroundColor = '#F8F8F8';
		pts.style.border = '1px solid red';
		return false;
	}
	pts.innerHTML = '&nbsp;<img src="image/icon_ok.gif"></img>';
	pts.style.color = 'green';
	pts.style.backgroundColor = '#F8F8F8';
	pts.style.border = '0';
	return true;
}

function checkrpass() {
	var userPass = $("#uPass").val();
	var userRPass = $("#uRPass").val();
	var prts = document.getElementById("passrts");
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
	prts.innerHTML = '&nbsp;<img src="image/icon_ok.gif"></img>';
	prts.style.color = 'green';
	prts.style.backgroundColor = '#F8F8F8';
	prts.style.border = '0';
	return true;
}
function checkemail() {
	var tuserEmail = $("#uEmail").val();
	var userEmail = tuserEmail.replace(/(&nbsp;)|\s|\u00a0/g, '');
	var ets = document.getElementById("emailts");
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
function register() {
	if (!checkname()) {
		return false;
	} else if (!checkpass()) {
		return false;
	} else if (!checkrpass()) {
		return false;
	} else if (!checkemail()) {
		return false;
	}
	return true;
}