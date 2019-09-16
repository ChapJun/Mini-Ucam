<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "u" tagdir = "/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 읽기</title>
<style>

@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

body {
	font-family: "Jeju Gothic", serif;  
	min-width: 1290px;
    min-height: 400px;
}

.wrapper {
	width : 650px;
	margin : 0 auto;
}

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

	<!--광운대 로고 클릭하면 메인 화면으로 이동할 수 있게 링크 설정-->
    <a href="Index.jsp"><img src="image/kw.png" style="position: absolute; float: left; margin-left: 25px; margin-top: 15px;" /></a>
    <!-- 자유게시판 -->
    <p style=" position: absolute; top: 70px; margin-left: 150px; font-family: 맑은고딕; font-size: 40px;">자유게시판</p>
    <!-- 오른쪽 kw-life 이미지-->
    <img src="image/kwlife.png" style="position: absolute; top: 100px; margin-left: 1130px;  width: 200px;" />
    <!--자유게시판 목록-->
    <a href="list.do"><b style=" position: absolute; top: 260px; margin-left: 1150px; font-family: 맑은고딕; font-size: 20px;">자유게시판</b></a>
    <hr style="width: 200px; position: absolute; top: 300px; margin-left: 1130px; " size="1" color="darkgray" noshade>

	<hr style="width: 900px; position: absolute; top: 200px; margin-left: 153px; " size="1" color="darkgray" noshade>
    <b style="position: absolute; top: 228px; margin-left: 160px; font-size: 17px; ">${articleData.article.title}</b>
    <!--조회수, 작성자-->
    <span style="position: absolute; top: 258px; margin-left: 160px; font-size: 13px; color: dimgray; ">
    	조회수 ${articleData.article.readCount} | ${articleData.article.date} | ${articleData.article.writer.name }</span>
	
	<!--내용 영역-->
    <hr style="width: 900px; position: absolute; top: 290px; margin-left: 153px; " size="1" color="gainsboro" noshade>
    <!-- 설정 영역 넘어갈 경우 스크롤 바 설정-->
    <table style=" position: absolute; top: 307px; margin-left: 154px; ">
        <tr>
            <td valign="top" style="width: 900px; height: 285px; ">
                <div style=" width: 900px; height: 285px; overflow-y: auto; overflow-wrap: break-word;">
                    <u:pre value="${articleData.content }" />
                </div>
            </td>
        </tr>
    </table>
    
    <hr style="width: 900px; position: absolute; top: 600px; margin-left: 153px; " size="1" color="gainsboro" noshade>
    <!--목록 버튼-->
    <c:set var = "pageNo" value = "${empty param.pageNo ? '1' : param.pageNo }" />
    <a href="list.do?pageNo=${pageNo }"> <img src="image/btn_list.png" style="position: absolute; top: 620px; margin-left: 980px;" /></a>
    <c:if test="${authUser.id == articleData.article.writer.id }">
        <!--수정 버튼-->
        <a href="modify.do?no=${articleData.article.number }"> <img src="image/btn_edit.png" style="position: absolute; top: 620px; margin-left: 160px;" /></a>
        <!--삭제 버튼-->
        <a href="delete.do?no=${articleData.article.number }"> <img src="image/btn_delete.png" style="position: absolute; top: 620px; margin-left: 270px;" /></a>
    </c:if>

</body>
</html>