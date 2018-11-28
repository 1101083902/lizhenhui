<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
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
		<form action="/UserInfoMana/insUserInfo" method="post"
			enctype="multipart/form-data" onsubmit="return toValidate()">
			<input type="file" name="files" onchange="showPreview(this)" /> <img
				id="portrait" src="" style="display:none;width: 100px;height: 50px" />

			<table>
				<tr>
					<td>用户名:</td>
					<td><input type="text" name="userAccoun" id="userAccoun"
						onblur="cunzai()" /></td>
				</tr>
				<tr>
					<td>密码:</td>
					<td><input type="password" name="password" id="password"
						onblur="pwd()" /><span id="span1"></span></td>
				</tr>
				<tr>
					<td>确认密码:</td>
					<td><input type="password" id="newPassword" id="newPassword"
						onblur="bidui()" /><span id="span2"></span></td>
				</tr>
				<tr>
					<td>邮箱:</td>
					<td><input type="text" name="email" id="email"
						onblur="emailvar()" /><span id="span3"></span></td>
				</tr>
				<tr>
					<td>部门:</td>
					<td><select name="deptid" id="deptid">
							<c:forEach items="${listDepartment}" var="dep">
								<option value="${dep.deptid}">${dep.deptname}</option>
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
 
 function cunzai(){
   	var userAccoun = $("input[name=userAccoun]").val();
    $.post("/UserInfoMana/Username","userAccoun="+userAccoun,function(data){
      if(data!="0"){
        alert("用户名存在");
      }
    })
 }

 
  function pwd(){
  var refpwd = /^[0-9a-zA-Z]{6,11}$/;
  var pwd = $("input[name=password]").val();
  	if(!refpwd.test(pwd)){
  		 $("#span1").html("密码格式不正确，必须是6到11位数字或字母");
  	}else{
  		 $("#span1").html("");
  	}
  }
  
  function emailvar(){
   var refemail=/^[0-9a-zA-Z]+@[0-9a-zA-Z]{2,3}.(com|cn)$/;
   var email = $("input[name=email]").val();
    if(!refemail.test(email)){
        $("#span3").html("邮箱格式不正确");
    }else{
    	$("#span3").html("");
    }
  }
  
  function showPreview(source) {
      var file = source.files[0];
      if(window.FileReader) {
          var fr = new FileReader();
          console.log(fr);
          var portrait = document.getElementById('portrait');
          fr.onloadend = function(e) {
            portrait.src = e.target.result;
          };
          fr.readAsDataURL(file);
          portrait.style.display = 'block';
      }
    }
    
  function bidui(){
    var pwd = $("input[name=password]").val();
     var newpwd = $("input[id=newPassword]").val();
     if(newpwd!=pwd){
     	$("#span2").html("两次密码输入不一致");
     }else{
     	$("#span2").html("");
     }
  }
  
  function toValidate(){
  	if($("#userAccoun").val()==""){
  		alert("用户名不能为空");
  		return false;
  	}
  	if($("#password").val()==""){
  		alert("密码不能为空");
  		return false;
  	}
  	if($("#newPassword").val()==""){
  		alert("请重复输入密码");
  		return false;
  	}
  	if($("#deptid").val()==""){
  		alert("所属部门不能为空");
  		return false;
  	}
  }
  
  </script>
</html>