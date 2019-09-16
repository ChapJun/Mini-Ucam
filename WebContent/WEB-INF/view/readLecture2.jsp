<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.net.URLEncoder" %>
   	<%@ page import = "lecture.ArticleData" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

td {
	
	padding : 5px;
}

th {
	background-color: #ccc;
	width : 25%;
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
	<table border = "1" style = "border-collapse: collapse;">
	<tr>
		<th>번호</th>
		<td>${articleData.article.number }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${articleData.article.writer.name }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${articleData.article.title }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="word-break:break-all;"><u:pre value = "${articleData.content.content}" /></td>
	</tr>
	<tr>
		<th>파일</th>
		<% 
			String file_name = (String)request.getAttribute("file_path");
			URLEncoder.encode(file_name, "UTF-8");
		%>
		<td><a href = "fileDown.jsp?file_name=<%= file_name %>">${articleData.content.path }</a></td>
	</tr>
	<tr>
		<td colspan = "2" style = "text-align:center;">
		<c:set var = "pageNo" value = "${empty param.pageNo ? '1' : param.pageNo }" />
		<a href = "lecture2.do?subject=<%= request.getParameter("subject") %>&pageNo=${pageNo }">[목록]</a>
		</td>
	</table>
</div>

</div>
</body>
</html>