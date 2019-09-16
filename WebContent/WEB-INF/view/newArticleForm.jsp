<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

	    body{
			min-width: 1290px;
			min-height: 400px;
			}
			
		a, a:visited {
			text-decoration: none;
			color: black;
		}
		
		table{
			position: absolute;
			top: 220px;
			left: 150px;
		}
		
		th {
			width: 120px;
		}
		
		
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>

<!--광운대 로고 클릭하면 메인 화면으로 이동할 수 있게 링크 설정-->
    <a href="Index.jsp"><img src="image/kw.png" style="position: absolute; float: left; margin-left: 25px; margin-top: 15px;" /></a>
    <!-- 자유게시판 -->
    <p style=" position: absolute; top: 100px; margin-left: 150px; font-family: 맑은고딕; font-size: 40px;">자유게시판</p>
	<!-- 오른쪽 kw-life 이미지-->
    <img src="image/kwlife.png" style="position: absolute; top: 100px; margin-left: 940px;  width: 200px;" />
    <!--자유게시판 목록-->
    <a href="#"><b style=" position: absolute; top: 260px; margin-left: 960px; font-family: 맑은고딕; font-size: 20px;">자유게시판</b></a>
    <hr style="width: 200px; position: absolute; top: 300px; margin-left: 940px; " size="1" color="darkgray" noshade>

<form action = "write.do" method = "post">
<table class="table table-bordered" style="width: 740px; overflow-y: auto; overflow-wra: break-word">   
            <tr>
                <th>글 제목</th>
                <td style="width: 600px;">
    			<div style="width: 600px; overflow-y: auto; overflow-wrap: break-word;">
    				<input type="text" name="title" class="form-control"/>
    			</div>
    			</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td style="width: 600px;">
    			<div style="width: 600px; overflow-y: auto; overflow-wrap: break-word;">
    				${authUser.name}
    			</div></td>
            </tr>
            <tr>
                <th>내용</th>
                <td style="width: 600px;">
    		<div style="width: 600px; overflow-y: auto; overflow-wrap: break-word;">
    		<textarea rows="10" cols="10"  name="content" class="form-control" style="resize: none;"></textarea>
    		</div></td>
            </tr>
 
			<tr>
				<td><input type="image" src="image/register.png" style="position: absolute; top: 360px; left: 555px;"></td>
				<td><a href = "list.do"><img src = "image/cancel.png" style="position: absolute; top: 360px; left: 635px;"> </a></td>
            </tr>
</table>
</form>

</body>
</html>