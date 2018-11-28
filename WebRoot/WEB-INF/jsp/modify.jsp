<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<div align="center">
		<form action="UserUpdate" method="post">
			<input type="hidden" name="userid" value="${selUserInfo.userid}" />
			<table>
				<tr>
					<td>用户账号:</td>
					<td><input type="text" value="${selUserInfo.userAccoun}"
						disabled="disabled" /></td>
				</tr>
				<tr>
					<td>邮箱:</td>
					<td><input type="text" name="email"
						value="${selUserInfo.email}" onblur="isemail()" /></td>
				</tr>
				<tr>
					<td>旧密码:</td>
					<td><input type="text" name="oldpwd"
						value="${selUserInfo.password}" disabled="disabled" /></td>
				</tr>
				<tr>
					<td>新密码:</td>
					<td><input type="text" name="password" onblur="shi()" /></td>
				</tr>
				<tr>
					<td>所属部门:</td>
					<td><select name="deptid">
							<c:forEach items="${listDepartment}" var="dep">
								<option value="${dep.deptid}"
									${selUserInfo.deptid==dep.deptid?"selected":""}>${dep.deptname}</option>
							</c:forEach>
					</select></td>
				</tr>
			</table>
			<input type="submit" value="提交" />
		</form>
	</div>
</body>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
	function shi() {
		var oldpwd = $("input[name=oldpwd]").val();
		var newpwd = $("input[name=password]").val();
		/*      alert(oldpwd)
		     alert(newpwd) */

		if (newpwd == oldpwd) {
			alert("不能跟旧密码一致");
		} else {
			var refpwd = /^[0-9a-zA-Z]{6,18}$/;
			if (!refpwd.test(newpwd)) {
				alert("格式不正确");
			}
		}
	}

	function isemail() {
		var refemail = /^[0-9a-zA-Z]+@[0-9a-zA-Z]{2,3}.(com|cn)$/;
		var email = $("input[name=email]").val();
		if (!refemail.test(email)) {
			alert("邮箱格式不正确");
		}
	}
</script>
</html>
