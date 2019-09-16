<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<style>

@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

body {
	min-width: 1290px;
    min-height: 400px;
}

a, a:visited {
	text-decoration: none;
	color: black;
}

        button {
            border: none;
            background-color: white;
        }

        .search {
            margin: 0 auto;
        }

        .list {
            font-family: 'Nanum Gothic', sans-serif;
        }

        .list_button {
            text-align: center;
        }
        
</style>
</head>
<body>
	<!--광운대 로고-->
    <a href = "Index.jsp"><img src="image/kw.png" style=" margin-left: 25px; margin-top: 15px;" /></a>
    <!-- 자유게시판 -->
    <p style=" position: absolute; top: 70px; margin-left: 150px; font-family: 맑은고딕; font-size: 40px;">자유게시판</p>
    <!-- 오른쪽 kw-life 이미지-->
    <img src="image/kwlife.png" style="position: absolute; top: 100px; margin-left: 1030px;  width: 200px;" />
    <!--자유게시판 목록-->
    <a href="list.do"><b style=" position: absolute; top: 260px; margin-left: 1050px; font-family: 맑은고딕; font-size: 20px;">자유게시판</b></a>
    <hr style="width: 200px; position: absolute; top: 300px; margin-left: 830px; " size="1" color="darkgray" noshade>
    
    <!--게시글 쓰기 버튼-->
    <a href="write.do"><img src="image/btn_write.png" style=" float : left; position: absolute; top: 265px; margin-left: 770px; "/></a>
    
    <div class="list">
    	<hr style="width: 900px; position: absolute; top: 300px; margin-left: 153px; " size="1" color="darkgray" noshade>
    	
    	<c:if test = "${articlePage.hasNoArticles() }">
    		<p style="position: absolute; top: 332px; margin-left: 270px; font-size: 17px;  "> <b>게시글이 없습니다.</b></p>
    	</c:if>
    	
    	<c:set var = "no" value = "${articlePage.total }" />
    	
    	<% int top1 = 400, top2 = 347, top3 = 332, top4 = 362;%>
    	<c:forEach var = "article" items = "${articlePage.content }">
    		<hr style="width: 900px; position: absolute; top: <%=top1%>px; margin-left: 153px; " size="1" color="gainsboro" noshade>
    		<span style="font-size: 14px; color: dimgray; position: absolute; top: <%=top2%>px; margin-left: 200px; ">
    		<!-- ${article.number }  -->${no}</span>
    		<a href="read.do?no=${article.number }&pageNo=${articlePage.currentPage}" 
    		style="position: absolute; top: <%=top3%>px; margin-left: 270px; font-size: 17px;"> 
    		<b><c:out value = "${article.title }" /></b></a>
    		<span style="position: absolute; top: <%=top4%>px; margin-left: 270px; font-size: 13px; color: dimgray; ">
    		조회수  ${article.readCount} | ${article.date} | ${article.writer.name }</span>
    		
    		<c:set var = "no" value = "${no - 1}" />
    		<% top1 += 100; top2 += 100; top3 += 100; top4 +=100;%>	
    	</c:forEach>
    
    </div>
    
     <!--검색 기능
    <div class="search">
        <canvas style="background-color:whitesmoke; border: 1px solid gainsboro; width: 900px; height: 50px;  position: absolute; top: 200px; margin-left: 150px; "></canvas>
        
        <b style="font-size: 20px; font-family: 맑은고딕; position: absolute; top: 210px; margin-left: 300px; ">Search</b>
        <select style="position: absolute; top: 210px; margin-left: 380px; height: 30px; ">
            <option id="search_title" style = "width:150px;">제목</option>
        </select>
        <input type="text" name = "search" placeholder="검색어를 입력해 주세요" style="position: absolute; top: 210px; margin-left: 480px; height: 24px; width: 370px; " />
        <button type="submit"> <img src="image/search.png" style="width: 25px; height: 25px; position: absolute; top: 213px; margin-left: 860px; " /></button>
        
    </div>
    -->
    
    <!--게시글 이동 버튼-->
    <c:if test = "${articlePage.hasArticles() }">
    	<div class="list_button" style = "margin-top : <%= top1-70 %>px;">	
            <c:if test = "${articlePage.startPage > 5 }">
				<a href = "list.do?pageNo=${articlePage.startPage -5 }"><img src="image/btn_prev_2.png" /></a> &nbsp;
			</c:if>
			<c:forEach var = "pNo" begin = "${articlePage.startPage }" end = "${articlePage.endPage }">
				<a href = "list.do?pageNo=${pNo }">[${pNo}]</a>
			</c:forEach>
            <c:if test = "${articlePage.endPage < articlePage.totalPages }">
				<a href = "list.do?pageNo=${articlePage.startPage + 5 }"><img src="image/btn_next_2.png" /></a> &nbsp;
			</c:if>
        </div>
    </c:if>
    
</body>
</html>