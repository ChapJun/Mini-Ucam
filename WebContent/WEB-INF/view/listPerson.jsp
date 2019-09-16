<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강생 조회</title>
<link href = "main.css" rel = "stylesheet">
<style>

tr {

	line-height: 30px;
	padding : 5px;
}
td {

	padding : 5px;
	text-align : center;
}


.short {

	width : 40px;
}
</style>
</head>
<body>
<div id = "wrapper">

<div style = "padding : 0px; height : auto; float : left; margin-right : 30px;">
<a href = "main.jsp"><img src = "http://microbiomekorea.co.kr/wp-content/uploads/2017/06/ndku.jpg"
 						  alt = "Logo" width = "200" height = "150"></a></div>
<div class = "info" style = "margin-top:30px;">
<u:isLogin>
<p>${authUser.name} (${authUser.id})</p>
<a href = "logout.do" style = "text-decoration : none; color : white;">로그아웃</a>
</u:isLogin>
</div> 				
<!-- learn.do, manage.do, subject.do, lecture.do  -->		  
<nav>
<ul>
	<li><a href = "lecture.do?subject=${course[0].course_no }">강의 자료실</a>          
	<li><a href = "person.do?subject=${course[0].course_no }">수강생 관리</a>
</ul>
</nav>
<% int no = 0; %>
<div id = "main">

<% int num = Integer.parseInt(request.getParameter("subject")); %>
<c:set var = "num" value = "<%= num %>" />	

<form action = "person.do">  <!-- method = "GET" person.do?subject=??? -->
	<select name = "subject">
		<c:forEach var = "course" items = "${course}">
			<c:choose>
			
				<c:when test = "${course.course_no == num }">
					<option selected value = "${course.course_no }">${course.course_name } (${course.course_no })</option>
				</c:when>
				
				<c:otherwise>
					<option value = "${course.course_no }">${course.course_name } (${course.course_no })</option>
				</c:otherwise>
				
			</c:choose>
		</c:forEach>
	</select>
	<input type = "submit" value = "Go">
</form>	
	<form action = "mailForm.jsp">
	<table border = "1" style = "margin-top : 30px; width:600px; border-collapse: collapse;">
		<tr>
			<th class = "short">선택</th>
			<th class = "short">No</th>
			<th>이름</th>
			<th>전공</th>
			<th>번호</th>
			<th>이메일</th>
		</tr>
		<c:forEach var = "person" items = "${person }">
			<tr>
				<td class = "short"><input type = "checkbox" name = "check" value = "${person.email }"></td>
				<td class = "short"><%= ++no %></td>
				<td  style = "font-size:12px;">${person.student_name }</td>
				<td  style = "font-size:12px;">${person.major }</td>
				<td  style = "font-size:12px;">${person.phone }</td>
				<td  style = "font-size:12px;">${person.email }</td>
			</tr>	
		</c:forEach>
	</table>
	<input type = "hidden" value = "${authUser.name }" name = "from_name">
	<input type = "submit" value = "이메일 보내기" style = "margin-top:30px;">
	</form>
	

</div>

</div>
</body>
</html>