<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 자료실</title>
<link href = "main.css" rel = "stylesheet">
<style>

table {

	width : 80%;
	margin : 20px auto;
}

th, #nav td {
	background-color: #ccc;
}

td {
	
	padding : 5px;
}

#nav td {
	text-align : center;
}

a, a:visited {
	text-decoration: none;
	color : black;
}



</style>
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
<nav>
<ul>
	<li><a href = "#">과목조회</a>
	<li><a href = "lecture2.do?subject=${course[0].course_no }">강의 자료실</a>
</ul>
</nav> 	
<div id = "main">

<% int num = Integer.parseInt(request.getParameter("subject")); %>
<c:set var = "num" value = "<%= num %>" />	
	
<form action = "lecture2.do">  <!-- method = "GET" lecture.do?subject=??? -->
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



<table border = "1" style = "border-collapse: collapse;">
	
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
	</tr>
	
	<c:if test = "${articlePage.hasNoArticles() }">
	<tr>
		<td colspan = "4">게시글이 없습니다.</td>
	</tr>
	</c:if>
	
	<c:forEach var = "article" items = "${articlePage.content }">
		<tr>
			<td>${article.number }</td>
			<td>
			<a href = "lecture_read2.do?no=${article.number }&pageNo=${articlePage.currentPage}&subject=${num}">
				<c:out value = "${article.title }" />
			</a>
			</td>
			<td>${article.writer.name }</td>
			<td>${article.readCount }</td>
		</tr>
	</c:forEach>
	
	<c:if test = "${articlePage.hasArticles() }">
		<tr id = "nav">
			<td colspan = "4">
				<c:if test = "${articlePage.startPage > 5 }">
				<a href = "lecture2.do?pageNo=${articlePage.startPage -5 }&subject=${num}">[이전]</a>
				</c:if>
				<c:forEach var = "pNo" begin = "${articlePage.startPage }" end = "${articlePage.endPage }">
				<a href = "lecture2.do?pageNo=${pNo }&subject=${num}">[${pNo}]</a>
				</c:forEach>
				<c:if test = "${articlePage.endPage < articlePage.totalPages }">
				<a href = "lecture2.do?pageNo=${articlePage.startPage + 5 }&subject=${num}">[다음]</a>
				</c:if>
			</td>
		</tr>
	</c:if>


</table>
</div>
</div>
</body>
</html>