<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>详情</title>

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
		<form action="/UserInfoMana/listUserInfo" method="post">
			用户账号:<input type="text" name="userAccoun" id="userAccoun" />&nbsp;部门:
			<select name="deptid" id="deptid">
				<option value="0">请选择</option>
				<c:forEach items="${listDepartment}" var="dep">
					<option value="${dep.deptid}">${dep.deptname}</option>
				</c:forEach>
			</select> <input type="submit" value="查询" />
			<table border="0px">
				<tr>
					<td>序号</td>
					<td>用户账号</td>
					<td>密码</td>
					<td>邮箱</td>
					<td>所属部门</td>
					<td>创建时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${listUserInfo}" var="user" varStatus="status">
					<tr>
						<td>${user.userid}</td>
						<td>${user.userAccoun}</td>
						<td>${user.password}</td>
						<td>${user.email }</td>
						<td>${user.department.deptname}</td>
						<td><fmt:formatDate value="${user.createDate}"
								pattern="yyyy-MM-dd" /></td>
						<td><a href="selUserInfo?userid=${user.userid}">修改</a>&nbsp;<a
							href="date?userid=${user.userid}" onclick="shan(${user.userid})">删除</a></td>
					</tr>
				</c:forEach>
			</table>
			<div>

				<a
					href="listUserInfo?index=1&userAccoun=${userAccoun}&deptid=${deptid}">首页</a>
				<c:if test="${pageNum>1}">
					<a
						href="listUserInfo?index=${pageNum-1}&userAccoun=${userAccoun}&deptid=${deptid}">上一页</a>
				</c:if>
				<c:if test="${pageNum!=count}">
					<a
						href="listUserInfo?index=${pageNum+1}&userAccoun=${userAccoun}&deptid=${deptid}">下一页</a>
				</c:if>
				<a
					href="listUserInfo?index=${count}&userAccoun=${userAccoun}&deptid=${deptid}">尾页</a>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
	function shan(userid) {
		if (confirm("是否删除")) {
			$.post("delete", "userid=" + userid, function(data) {
				alert("删除成功");
			})
		}
	}

	$("tr:odd").css("background", "red");
</script>
</html>