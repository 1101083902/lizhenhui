<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
</body>
<div align="center">
	<img id="img" src="" width="200px" id="img" style="display: none"/><br /> <span>${massage}</span>
	<form action="login" method="post">
		账户<input type="text" name="userAccoun" onblur="Verifying()" /><span
			id="span"></span><br> 密码<input type="text" name="password" /><br>
		<input type="submit" value="提交" /> <a
			href="/UserInfoMana/selDepartment">注册</a>
	</form>
</div>
</body>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
	function Verifying() {
		var userAccoun = $("[name=userAccoun]").val();
		$.post("Verifying", "userAccoun=" + userAccoun, function(data) {
			if (data != "") {
				$("#img").attr("src", "upload/" + data);
				$("#img").css("display","block");
				$("#span").html("");
			} else {
				$("#span").html("账号不存在");
				$("#img").css("display","none");
				$("#img").html("")
			}
		})
	}
</script>
</html>
