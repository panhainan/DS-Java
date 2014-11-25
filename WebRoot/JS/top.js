/*function test_itemNav(n) {
	var menuNav = document.getElementById("menuNav");
	var menuNavli = menuNav.getElementsByTagName("li");
	for (var i = 0; i < menuNavli.length; i++) {
		menuNavli[i].className = "";
		menuNavli[n].className = "yesNav";

	}
};*/
function logout() {
	// alert("确定退出吗？");
	var r = confirm("确定退出吗？");
	if (r == true) {
		return true;
	} else {
		return false;
	}
};
