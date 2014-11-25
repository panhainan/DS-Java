function login() {
	if(!checkname()){
		return false;
	}else if (!checkpass()) {
		return false;
	} else {
		return true;
	}
}
function warnName(){
	var ts = document.getElementById("namets");
	ts.innerHTML = '&nbsp;长度须在3-8个字节之间!';
	ts.style.color = 'green';
	ts.style.backgroundColor = '#E2F3FE';
	ts.style.border = '1px solid #BED7EE';
}
function warnPass(){
	var pts = document.getElementById("passts");
	pts.innerHTML = '&nbsp;长度须在6-16个字节之间，请注意区分大小写！';
	pts.style.color = 'green';
	pts.style.backgroundColor = '#E2F3FE';
	pts.style.border = '1px solid #BED7EE';
}

function checkname() {
	var tname = document.getElementById("uName").value;
	var name =tname.replace(/(&nbsp;)|\s|\u00a0/g, '');
	var ts = document.getElementById("namets");
	if(name==null||name==""||name.length<3){
		ts.innerHTML ="&nbsp;<img src='image/wrong.gif'></img>&nbsp;请按要求输入用户名!";
	    ts.style.color="red";
	    ts.style.backgroundColor = '#F8F8F8';
		ts.style.border = '1px solid red';
	    return false;
	}
	ts.innerHTML = '&nbsp;<img src="image/icon_ok.gif"></img>';
	ts.style.color = 'green';
	ts.style.backgroundColor = '#F8F8F8';
	ts.style.border = '0';
	return true;
}
function checkpass() {
	var userPass = $("#uPass").val();
	var pts = document.getElementById("passts");
	if(userPass.length<6 || userPass.length >16)	
	{	
		pts.innerHTML ="&nbsp;<img src='image/wrong.gif'></img>&nbsp;请按要求输入密码!";
		pts.style.color="red";
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