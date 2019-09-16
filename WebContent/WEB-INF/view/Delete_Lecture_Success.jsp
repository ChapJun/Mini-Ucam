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
<nav>
<ul>
	<li><a href = "lecture.do?subject=${course[0].course_no }">강의 자료실</a>
	<li><a href = "person.do?subject=${course[0].course_no }">수강생 관리</a>
</ul>
</nav>
<div id = "main">
${authUser.name }님, 게시글을 삭제했습니다.<br>

<%
	String ctxPath = request.getContextPath();
%>

<c:set var = "ctxPath" value = "<%=ctxPath%>" />

<a href = "${ctxPath}/lecture.do?subject=${course[0].course_no}">[게시글 목록보기]</a>
</div>
</div>
</body>
</html>