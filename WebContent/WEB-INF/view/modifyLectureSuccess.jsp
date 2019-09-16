<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정 성공</title>

</head>
<body>

${authUser.name }님, 게시글을 수정했습니다.
<br>
<%
	String ctxPath = request.getContextPath();
%>

<c:set var = "ctxPath" value = "<%=ctxPath%>" />

<a href = "${ctxPath}/lecture.do?subject=${course[0].course_no }">[게시글 목록보기]</a>
<a href = "${ctxPath}/lecture_read.do?no=${modReq.articleNumber}&subject=${subject}">[게시글 내용보기]</a>


</body>
</html>