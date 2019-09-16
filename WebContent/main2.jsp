<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ucampus Student</title>
<link href = "main.css" rel = "stylesheet">
</head>

<body>
<div id = "wrapper">

	<div style = "padding : 0px; height : auto; float : left; margin-right : 30px;">
	<a href = "main2.jsp"><img src = "http://microbiomekorea.co.kr/wp-content/uploads/2017/06/ndku.jpg"
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
			<c:choose>
			
			<c:when test = "${course[0] == null }">
				<li><a href = "#">과목조회</a>
				<li><a href = "#">강의 자료실</a>
			</c:when>
				
			<c:otherwise>
				<li><a href = "#">과목조회</a>
				<li><a href = "lecture2.do?subject=${course[0].course_no }">강의 자료실</a>		
			</c:otherwise>
			</c:choose>
		</ul>
	</nav>

	<div id = "main">
		<p>수강과목</p>
		<hr>
		
		<table id = "cour">
			<c:forEach var = "course" items = "${course}">
			<tr>
				<td>${course.course_name } (${course.course_no })</td>
				<td>${course.instructor_name }</td>
				<td>${course.room_name }</td> 
				<td>${course.lecture_time }</td>
			</tr>
			</c:forEach>
		</table>
	</div>

</div>

</body>
</html>