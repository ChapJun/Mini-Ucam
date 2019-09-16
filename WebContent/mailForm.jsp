<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Send Mail</title>
<style>

@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

body {
	font-family: "Jeju Gothic", serif;  
}
#wrapper {

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
	margin : 30px auto;
}

fieldset {
	
	margin-bottom : 10px;
}
</style>
</head>
<body>

<%
	String name = request.getParameter("from_name");
	String[] email = request.getParameterValues("check");
%>

<div id = "wrapper">
<c:set var = "ema" value = "<%= email %>" />

<h1 style = "text-align: center;">JSP 메일 보내기</h1>
<form name="a" action="mailSend.jsp" method="post" target = "_blank">
<fieldset>
	<legend>E-mail</legend>
	<ul>
		<li><label for = "name">보내는 사람</label>
		<input type = "text" name = "name" value = "<%= name %>" id = "name"></li>
		
		<c:forEach var = "i" begin = "0" end = "<%= email.length-1 %>">
        	<li><label for = "to">받는 사람</label>
        	<input type="text" name="to" value = "${ema[i]}" id = "to" style = "width : 200px;"></li>
        </c:forEach>
        
        <li><label for = "title">제목</label>
        <input type = "text" name = "title" id = "title" style = "width : 200px;"></li>
        <li><label for = "content">내용</label>
        <textarea rows="10" cols="50" name = "content" id = "content"></textarea></li>
        <li><input type = "hidden" name = "from" value = "junc94@naver.com"></li>
	</ul>
		<input type="submit" value="Transmission" id = "login">
</fieldset>
</form>

	<script> 
 			function check() {
    			document.a.submit();
			}
	</script>
	
</div>
</body>
</html>