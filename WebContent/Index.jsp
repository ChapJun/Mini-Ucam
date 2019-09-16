<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<title>Kwangwoon University</title>
<style>
	body {
		min-width: 1290px; 
		min-height: 400px;
	}
	
    #main_menu {
    	margin: 0 auto;
        float: right; 
        font-family: 고딕;
        margin-top: 2px; 
        font-size: 22px;
        margin-right: 100px;            
	}
        
    #main_menu > dl { overflow: hidden; }
    #main_menu > dl > dd { float: left; }
        
    .slide_ul {
    	liststyle: none;
        padding: 0;
        margin: 0;
	}
        
    .img_title {
     	font-family: 고딕;
      	font-size: 40px;
       	color: white;
       	text-shadow: -1px -1px 0 #fff, 1px 1px 0 #888;
       	position: absolute;
      	top: 53%;
       	left: 3%;
       	min-width: 1290px;
       	min-height: 400px;
       	text-decoration: none;
	}
        
    .hot {
    	position: absolute;
        bottom-margin: 30%;        
    }
    
    .slideshow img {
    	position: absolute; 
    	top: 87px; width: 99%; height: 53% 
    }
    
    .slideshow img.alt {
    	display: none;
    }
    
    .slide_btn {
    	position: absolute;
    	top: 450px;
    	left: 85%;
    }
</style>

<script>

$(function () {
    var interval = 3000;  // 간격은 3초
    // slideshow라는 클래스가 부여된 요소 각각에 대해서 처리하기
    $('.slideshow').each(function () {
        // img요소들을 둘러싸고 있는 div요소를 취득
        var container = $(this);
        // 페이드 전환 1회분의 함수
        function switchImg() {
            // img요소를 전부 취득
            var imgs = container.find('img');
            //앞에서부터 img요소 2개를 얻는다.
            var first = imgs.eq(0);// 선두의 img요소
            var second = imgs.eq(1);// 2번째의 img요소

            // 처음의 img요소를 페이드아웃시켜, 가장 뒤로 이동
            first.fadeOut(2000).appendTo(container);
            // 2번째의 img요소를 페이드인 시킨다.
            second.fadeIn(2000);
        }
        // 3초 마다 switchImg를 실행
        setInterval(switchImg, interval);
        });
    
    $('.slideshow_txt').each(function () {
        var container_txt = $(this);
        function switchText() {
            var text = container_txt.find('a');
            var first = text.eq(0);
            var second = text.eq(1);

            first.fadeOut(2000).appendTo(container_txt);
            second.fadeIn(2000);
        }
        setInterval(switchText, interval);
	});
});

</script>

</head>
<body>
	<canvas style="color: black; position: absolute; top: 87px; width: 99%; height: 50% "></canvas>
	<hr style="width: 43px; color: black; position: absolute; top: 477px; margin-left: 153px; " size="1px" color="black" noshade>
	<div style="font-size: 25px; position: absolute; top: 489px; margin-left: 153px;">Hot issue</div>
	<div>
		<canvas width="290" height="280" style="border: none; background-color: #EAEAEA; position: absolute; margin-top: 535px; margin-left: 153px; "></canvas>
		<img src="image/hotissue1.jpg" style="position: absolute; width: 290px; height: 170px; margin-top: 535px; margin-left: 153px;">
		<a style="position: absolute; margin-top: 720px; margin-left: 175px; font-size: 16px;"> <b>SNK-VITAMIN센터, 제2회<br>청년혁신 창업세미나 개최</b></a> <!-- top: 49%, left: 11.5% -->
		<a style="position: absolute; margin-top: 775px; margin-left: 175px; font-size: 14px;"> 2018.05.25</a>  <!-- top: 52.7%, left: 11.5% -->
	</div>
	<div>
		<canvas width="290" height="280" style="border: none; background-color: #EAEAEA; position: absolute; margin-top: 535px; margin-left: 465px; "></canvas>
		<img src="image/hotissue2.jpg" style="position: absolute; width: 290px; height: 170px; margin-top: 535px; margin-left: 465px;">
		<a style="position: absolute; margin-top: 720px; margin-left: 487px; font-size: 16px;"> <b>광운안전을 지킨다! 캠퍼스내內<br>여자 화장실 비상벨 설치 완료</b></a> 
		<a style="position: absolute; margin-top: 775px; margin-left: 487px; font-size: 14px;"> 2018.05.25</a>  
	</div>
	<div>
		<canvas width="290" height="280" style="border: none; background-color: #EAEAEA; position: absolute; margin-top: 535px; margin-left: 777px; "></canvas>
		<img src="image/hotissue3.JPG" style="position: absolute; width: 290px; height: 170px; margin-top: 535px; margin-left: 777px;">
		<a style="position: absolute; margin-top: 720px; margin-left: 799px; font-size: 16px;"> <b>광운대 무(無)알콜 축제 '2018<br>광운팡야' 성공리에 개최</b></a> 
		<a style="position: absolute; margin-top: 775px; margin-left: 799px; font-size: 14px;"> 2018.05.25</a>  
	</div>
	<div>
		<canvas width="290" height="280" style="border: none; background-color: #EAEAEA; position: absolute; margin-top: 535px; margin-left:1089px; "></canvas>
		<img src="image/hotissue4.jpg" style="position: absolute; width: 290px; height: 170px; margin-top: 535px; margin-left: 1089px;">
		<a style="position: absolute; margin-top: 720px; margin-left: 1111px; font-size: 16px;"> <b>[한국대학신문] 광운대, 지역<br>사회와 함께 공존하는 캠퍼스</b></a> 
		<a style="position: absolute; margin-top: 775px; margin-left: 1111px; font-size: 14px;"> 2018.05.25</a>  
	</div>
	
	<img src="image/kw.png" style="position: absolute; float: left; margin-left: 25px; margin-top: 15px;"/>
    <nav id="main_menu">
    	<dl>
        	<dd> <a href="login.do" target = "_blank" style="text-decoration: none; color: black;"><b>Mini-UCAMPUS</b></a></dd>
            <dd> &nbsp; &nbsp; &nbsp; &nbsp;</dd>
            <u:isLogin>
            	<dd> <a href="list.do" style="text-decoration: none; color:darkred;"><b>KW-LIFE</b></a></dd>
            </u:isLogin>          	
           	<u:notLogin>
            	<dd> <a href="articleLogin.do" style="text-decoration: none; color:darkred;"><b>KW-LIFE</b></a></dd>
            </u:notLogin>
		</dl>
	</nav>     
	
	<div class="slideshow">
		<img alt="" src="image/main1.png">
        <img alt="" src="image/main2.png" class="alt">
        <img alt="" src="image/main3.png" class="alt">
        <img alt="" src="image/main4.jpg" class="alt">
	</div>
	
	<div class="slideshow_txt">
		<a class="img_title" >[중앙일보] 기술∙환경∙예술 어우러진 캠퍼스 '주목'</a>
		<a class="img_title" style="display: none;">산업계 관점 대학평가 정보통신분야 최우수대학 선정</a>
		<a class="img_title" style="display: none;">광운대, 숭실대 잡고 U리그 2연승 달성</a>
		<a class="img_title" style="display: none;">유학생 ALL-CARE 프로그램 '광운유학생 친교의 밤'</a>
	</div> 	

	<div  class="slide_btn">
		<img src="image/left.png" id="left_btn">
		&nbsp;
		<img src="image/pause.png" id="pause_btn">
		&nbsp;
		<img src="image/right.png" id="right_btn">
	</div>
</body>
</html>