<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

body {
	font-family: "Jeju Gothic", serif;  
}

.wrapper {
	width : 650px;
	margin : 0 auto;
}
</style>
</head>
<body>

<div class = "wrapper">
<form action = "modify.do" method = "post">
<p>글 번호 : ${modReq.articleNumber }</p>
<input type = "hidden" name = "no" value = "${modReq.articleNumber }">
<p>글 제목 : <input type = "text" name = "title" value = "${modReq.title }">
		  <c:if test = "${errors.title }">제목을 입력하세요.</c:if>
</p>

<p>글 내용 :<br>
<textarea rows="5" cols="30" name = "content">${modReq.content }</textarea>
</p>

<input type = "submit" value = "글 수정">


</form>
</div>
</body>
</html>