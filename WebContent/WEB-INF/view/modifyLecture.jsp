<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>
<link href = "main.css" rel = "stylesheet">
<style>



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
	clear : both;
	display : block;
	margin : 0 auto;
}

nav ul li a, nav ul li a:visited {

    line-height: 10px;
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
<nav>
<ul>
	<li><a href = "lecture.do?subject=${course[0].course_no }">강의 자료실</a>
	<li><a href = "person.do?subject=${course[0].course_no }">수강생 관리</a>
</ul>
</nav>
<div id = "main">

<form action = "modify_Lecture.do" method = "post" enctype = "multipart/form-data">
<ul>

	<li><label for = "no">글 번호</label>
	<input type = "text" id = "no"  name = "no" readonly value= "${modReq.articleNumber }">
	
	<li><label for = "title">글 제목</label>
	<input type = "text" id = "title" name = "title" value = "${modReq.title }">
	<c:if test = "${errors.title }">제목을 입력하세요.</c:if></li>
	
	<li><label for = "content">내용</label>
	<textarea name = "content" id = "content" rows="5" cols="30">${modReq.content }</textarea></li>
	
	<c:if test = "${modReq.path != \"\" }">
		<li><label for = "origin">(수정할 경우 기존파일은 삭제됩니다.)</label>
		<input type = "text" id = "origin" name = "origin" readonly value = "${modReq.path }" style = "width : 250px">
	</c:if>
	
	<li><label for = "path">경로</label>
	<input type = "file"  name = "path"></li> 
	
	<li><input type = "hidden" name = "subject" value = <%= request.getParameter("subject") %>></li>
</ul>

<input type = "submit" value = "글 수정" id = "login">
</form>
</div>


</div> 
</body>
</html>