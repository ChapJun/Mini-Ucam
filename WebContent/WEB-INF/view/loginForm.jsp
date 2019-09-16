<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href = "style.css" rel = "stylesheet">
<title>Mini UCAMPUS</title>
</head>
<body>
<form action = "login.do" method = "post"> 
<div id = "wrapper">
	<div id = "top">
		<img src = "image/kwangMark.jpg">
		<h1>Mini Ucampus</h1>
	</div>
	<div id = "main">
	<c:if test = "${errors.idOrPwNotMatch }">
		<script>alert("개인번호와 암호가 일치하지 않습니다.");</script>
	</c:if>
		<fieldset>
		<h2>Login</h2>
		<ul>
			<li><label for = "seq">사용자구분</label>
			<select name = "seq" id = "seq" style = "width:160px;">
				<option value = "교수">교수</option>
				<option value = "학생">학생</option>
			</select>
			</li>
			<li><label for = "id">개인번호</label>
			<input type = "text" name = "id" id = "id" placeholder = "개인번호" value = "${param.id}">
			<c:if test = "${errors.id}">개인번호를 입력하세요.</c:if></li>
			
			<li><label for = "password">비밀번호</label>
			<input type = "password" name = "password" id = "password" placeholder = "비밀번호">
			<c:if test = "${errors.password}">암호를 입력하세요.</c:if></li>
		</ul>
		<div class = "btn_Class">
			<a href = "join.do" id = "Join" class = "btn">회원가입</a>
			<input type = "submit" value = "Login" id = "Login" class = "btn">
		</div>
		</fieldset>
	</div>
	<div id = "foot">
		<p>Produce by 안지은 연제원  윤준 함혜리</p>
	</div>
</div>
</form>
</body>
</html>