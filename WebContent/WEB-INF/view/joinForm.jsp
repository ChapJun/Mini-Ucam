<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style>

@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

body {
	font-family: "Jeju Gothic", serif;  
}
.wrapper {

	width : 650px;
	margin : 0 auto;
}

ul {

	list-style-type : none;
}
ul li {
	
	margin : 20px;
}

label {

	width : 100px;
	float : left;
	font-weight : bold;
	margin-right : 10px;
	text-align : center;
}

#login {

	width : 300px;
	height : 50px;
	clear : both;
	display : block;
	margin : 0 auto;
}

fieldset {
	
	margin-bottom : 10px;
}

</style>
</head>
<body>
<form action = "join.do" method = "post">
	<div class = "wrapper">
	
	<h1 style="text-align:center;">회원가입</h1>
	<fieldset>
	<legend>개인 정보</legend>
	<ul>
	
		<li><label for = "seq">사용자구분</label>
			<select name = "seq" id = "seq" style = "width:160px;">
				<option value = "교수">교수</option>
				<option value = "학생">학생</option>
			</select>
		</li>
		
		<li><label for = "id">개인번호</label>
		<input type = "text" id = "id" name = "id" placeholder = "개인번호(숫자)">
		<c:if test = "${errors.id}"> 개인번호를 입력하세요.</c:if>
		<c:if test = "${errors.duplicateId }"> 이미 사용중인 번호입니다.</c:if></li>

		<li><label for = "name">이름</label>
		<input type = "text" id = "name" name = "name" size = "20" placeholder = "이름">
		<c:if test = "${errors.name }"> 이름을 입력하세요.</c:if></li>
		
		<li><label for = "pw">비밀번호</label>
		<input type = "password" id = "pw" name = "password" size = "21" placeholder = "비밀번호">
		<c:if test = "${errors.password }"> 비밀번호를 입력하세요.</c:if></li>
		
		<li><label for = "phone">핸드폰번호</label>
		<input type = "text" id = "phone" name = "phone" value = "010-" size = "20">
		<c:if test = "${errors.phone }"> 핸드폰번호를 입력하세요.</c:if></li>
		
		<li><label for = "email">이메일</label>
		<input type = "text" id = "email" name = "email" size = "20">
		<c:if test = "${errors.email }"> 이메일을 입력하세요.</c:if></li>
		
		<li><label for = "major">전공</label>
			<select name = "major" id = "major" style = "width:160px;">
				<option value = "컴퓨터소프트웨어">컴퓨터소프트웨어</option>
				<option value = "컴퓨터공학">컴퓨터공학</option>
				<option value = "전자공학">전자공학</option>
			</select>
		<c:if test = "${errors.major }"> 전공을 입력하세요.</c:if></li>
		
	</ul>
	</fieldset>
	
	<input type = "submit" value = "회원가입" id = "login">
	</div>
</form>

</body>
</html>