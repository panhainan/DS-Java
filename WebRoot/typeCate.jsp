<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>">
<script type="text/javascript">
	function iframeAutoFit() {
		try {
			if (window != parent) {
				var a = parent.document.getElementsByTagName("IFRAME");
				for ( var i = 0; i < a.length; i++) //author:meizz
				{
					if (a[i].contentWindow == window) {
						var h1 = 0, h2 = 0;
						a[i].parentNode.style.height = a[i].offsetHeight + "px";
						a[i].style.height = "10px";
						if (document.documentElement
								&& document.documentElement.scrollHeight) {
							h1 = document.documentElement.scrollHeight;
						}
						if (document.body)
							h2 = document.body.scrollHeight;
						var h = Math.max(h1, h2);
						if (document.all) {
							h += 4;
						}
						if (window.opera) {
							h += 1;
						}
						a[i].style.height = a[i].parentNode.style.height = h
								+ "px";
					}
				}
			}
		} catch (ex) {
		}
	}
	if (window.attachEvent) {
		window.attachEvent("onload", iframeAutoFit);
		//window.attachEvent("onresize",  iframeAutoFit);
	} else if (window.addEventListener) {
		window.addEventListener('load', iframeAutoFit, false);
		//window.addEventListener('resize',  iframeAutoFit,  false);
	}
</script>
<style type="text/css">
a:link,a:visited {
	background-color: white;
	text-decoration: none;
} /* 未被访问的链接 */ /*已被访问的链接 */
a:hover {
	background-color: white;
	text-decoration: none;
} /* 鼠标指针移动到链接上 */
.typeStyle{
	color: #0066C2;
}
.typeStyle:hover {
	background-image: url("image/type_bg.png");
	color: red;
}
</style>
<div style="background-color: #FAFAFA;font-family: 微软雅黑;">
	<s:iterator value="listType" var="type">
		<a target="_top"
			href="type_goType.action?type.id=<s:property
								value="#type.id" />">
			<div class="typeStyle"
				style="margin: 10px 10px 10px 17px;background-color: white;height: 60px;width: 160px;float: left;border: 1px solid #D8E6F0">
				<div style="width: 30px;height: 60px;float: left;"></div>
				<div style="width: 130px;height: 60px;float: left;">
					<div
						style="width: 100%;height: 35px;line-height:35px;float: left;font-size: 14px;font-weight: bolder;">
						<s:property value="#type.name" />
					</div>
					<div
						style="width: 100%;height: 25px;line-height:25px;float: left;color: #666666;font-size: 12px">
						共<s:property value="#type.countTopics" />主题/<s:property value="#type.countComments" />回复
					</div>
				</div>
			</div> </a>
	</s:iterator>
</div>
