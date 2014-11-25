function uploadF() {
	var filename = document.getElementById('fu').value;
	if (filename != "" || filename != null) {
		var fileText = filename.substring(filename.lastIndexOf("."),
				filename.length);
		fileText = fileText.toLowerCase();
		if (fileText == '.png' || fileText == '.bmp' || fileText == '.png'
				|| fileText == '.gif' || fileText == '.jpg') {
			return true;
		}
	}
	alert("请按要求选择文件！");
	return false;
};

