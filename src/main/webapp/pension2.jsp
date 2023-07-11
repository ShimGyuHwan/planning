<%@page import="plan.namecheck"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8"); %>
    <%request.setCharacterEncoding("UTF-8");
	 HttpSession se = request.getSession();
   	 String jnm = (String)se.getAttribute("jnm");
     String jtel = (String)request.getAttribute("jtel");
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/default.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/header2.css?v=7">
<link rel="stylesheet" type="text/css" href="./css/pension2.css?v=1">
<style>
  @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
</style>
<script src="./js/login.js?v=7"></script>
<script src="./js/header.js?v=5"></script>
<script src="./js/reserv_ck.js?v=4"></script>
<title>야영장 예약하기</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");  %>
<form id="frm">
<header>
<div class="top">
	<div class="logo"></div>
	<ul>
		<li>이용안내</li>
		<li onclick="reser()">예약하기</li>
		<li onclick="adf()">예약확인</li>
		<li>마이페이지</li>
		<li>그린포인트</li>
	</ul>
	<ol>
		<li class="top_logout"><svg xmlns="http://www.w3.org/2000/svg" height="35" viewBox="0 -960 960 960" width="35" fill="currentColor" color="#FFFFFF"><path d="M400-400q-50 0-85-35t-35-85q0-22 7-41.5t21-35.5q-4-10-6-21t-2-22q0-38 20.5-67.5T374-751q20-23 47-36t59-13q32 0 59 13t47 36q33 14 53.5 43.5T660-640q0 11-2 22t-6 21q14 16 21 35.5t7 41.5q0 50-35 85t-85 35H400Zm0-60h160q25.5 0 42.75-18.5T620-519.957q0-10.043-3-19.543T606-558q-8-10-11-19.135-3-9.134-3-17.173 0-11.692 4-23.192t4-22.553Q600-659 590-673.5 580-688 563-696q-7-3-12-7t-10-9q-6.774-8-22.355-18-15.58-10-38.613-10-23.032 0-38.639 10.545Q425.786-718.909 419-711q-5 5-10 9.5t-12 6.5q-17 7-27 21.5t-10 33.447q0 11.053 4 22.553t4 23.192q0 8.039-3 17.173Q362-568 354-558q-8 9-11 18.5t-3 19.543Q340-497 357.25-478.5T400-460ZM160-80v-94q0-38 19-65t49-41q67-30 128.5-45T480-340q62 0 123 15.5t127.921 44.694q31.301 14.126 50.19 40.966Q800-212 800-174v94H160Zm60-60h520v-34q0-16-9.5-30.5T707-226q-64-31-117-42.5T480-280q-57 0-111 11.5T252-226q-14 7-23 21.5t-9 30.5v34Zm260 0Zm0-320Z"/></svg><span id="jnm"></span></li>
		<li class="top_login" style="display:none;"><svg xmlns="http://www.w3.org/2000/svg" height="35" viewBox="0 -960 960 960" width="35" fill="currentColor" color="#FFFFFF"><path d="M400-400q-50 0-85-35t-35-85q0-22 7-41.5t21-35.5q-4-10-6-21t-2-22q0-38 20.5-67.5T374-751q20-23 47-36t59-13q32 0 59 13t47 36q33 14 53.5 43.5T660-640q0 11-2 22t-6 21q14 16 21 35.5t7 41.5q0 50-35 85t-85 35H400Zm0-60h160q25.5 0 42.75-18.5T620-519.957q0-10.043-3-19.543T606-558q-8-10-11-19.135-3-9.134-3-17.173 0-11.692 4-23.192t4-22.553Q600-659 590-673.5 580-688 563-696q-7-3-12-7t-10-9q-6.774-8-22.355-18-15.58-10-38.613-10-23.032 0-38.639 10.545Q425.786-718.909 419-711q-5 5-10 9.5t-12 6.5q-17 7-27 21.5t-10 33.447q0 11.053 4 22.553t4 23.192q0 8.039-3 17.173Q362-568 354-558q-8 9-11 18.5t-3 19.543Q340-497 357.25-478.5T400-460ZM160-80v-94q0-38 19-65t49-41q67-30 128.5-45T480-340q62 0 123 15.5t127.921 44.694q31.301 14.126 50.19 40.966Q800-212 800-174v94H160Zm60-60h520v-34q0-16-9.5-30.5T707-226q-64-31-117-42.5T480-280q-57 0-111 11.5T252-226q-14 7-23 21.5t-9 30.5v34Zm260 0Zm0-320Z"/></svg><span><input type="button" class="top_btn" value="로그인" onclick="logingo()"></span></li>
		<li class="top_login" style="display:none;"><svg xmlns="http://www.w3.org/2000/svg" height="35" viewBox="0 -960 960 960" width="35" fill="currentColor" color="#FFFFFF"><path d="M0-240v-53q0-38.567 41.5-62.784Q83-380 150.376-380q12.165 0 23.395.5Q185-379 196-377.348q-8 17.348-12 35.165T180-305v65H0Zm240 0v-65q0-32 17.5-58.5T307-410q32-20 76.5-30t96.5-10q53 0 97.5 10t76.5 30q32 20 49 46.5t17 58.5v65H240Zm540 0v-65q0-19.861-3.5-37.431Q773-360 765-377.273q11-1.727 22.171-2.227 11.172-.5 22.829-.5 67.5 0 108.75 23.768T960-293v53H780Zm-480-60h360v-6q0-37-50.5-60.5T480-390q-79 0-129.5 23.5T300-305v5ZM149.567-410Q121-410 100.5-430.562 80-451.125 80-480q0-29 20.562-49.5Q121.125-550 150-550q29 0 49.5 20.5t20.5 49.933Q220-451 199.5-430.5T149.567-410Zm660 0Q781-410 760.5-430.562 740-451.125 740-480q0-29 20.562-49.5Q781.125-550 810-550q29 0 49.5 20.5t20.5 49.933Q880-451 859.5-430.5T809.567-410ZM480-480q-50 0-85-35t-35-85q0-51 35-85.5t85-34.5q51 0 85.5 34.5T600-600q0 50-34.5 85T480-480Zm.351-60Q506-540 523-557.351t17-43Q540-626 522.851-643t-42.5-17Q455-660 437.5-642.851t-17.5 42.5Q420-575 437.351-557.5t43 17.5ZM480-300Zm0-300Z"/></svg><span><input type="button" class="top_btn" value="회원가입" onclick="joinok()"></span></li>
	</ol>
</div>
</header>
<section>
<div class="box">
<p>야영장 예약하기</p>
<input type="hidden" name="mou" id="h1">
<input type="hidden" id="h2" name="moo">
<input type="hidden" id="j1" value="<%=jnm%>" name="jnm" >
<input type="hidden" id="j2" value="" name="jtel">

		<ul class="mou">
			<li class="m0" name="mou" id="m0" onclick="mou(0)">가야산<span><img src="./last_webpage/ico/arrow.svg"></span></li>
			<li class="m0" name="mou" id="m1" onclick="mou(1)">계룡산<span><img src="./last_webpage/ico/arrow.svg"></span></li>
			<li class="m0" name="mou" id="m2" onclick="mou(2)">내장산<span><img src="./last_webpage/ico/arrow.svg"></span></li>
			<li class="m0" name="mou" id="m3" onclick="mou(3)">덕유산<span><img src="./last_webpage/ico/arrow.svg"></span></li>
			<li class="m1" name="mou" id="m4" onclick="mou(4)">무등산<span><img src="./last_webpage/ico/arrow.svg"></span></li>
			<li class="m1" name="mou" id="m5" onclick="mou(5)">설악산<span><img src="./last_webpage/ico/arrow.svg"></span></li>
			<li class="m1" name="mou" id="m6" onclick="mou(6)">소백산<span><img src="./last_webpage/ico/arrow.svg"></span></li>
			<li class="m1" name="mou" id="m7" onclick="mou(7)">월악산<span><img src="./last_webpage/ico/arrow.svg"></span></li>												
	</ul>
	<ul class="help_2">
			<li><svg xmlns="http://www.w3.org/2000/svg" height="35" viewBox="0 -960 960 960" width="35"><path d="M479.982-280q14.018 0 23.518-9.482 9.5-9.483 9.5-23.5 0-14.018-9.482-23.518-9.483-9.5-23.5-9.5-14.018 0-23.518 9.482-9.5 9.483-9.5 23.5 0 14.018 9.482 23.518 9.483 9.5 23.5 9.5ZM453-433h60v-253h-60v253Zm27.266 353q-82.734 0-155.5-31.5t-127.266-86q-54.5-54.5-86-127.341Q80-397.681 80-480.5q0-82.819 31.5-155.659Q143-709 197.5-763t127.341-85.5Q397.681-880 480.5-880q82.819 0 155.659 31.5Q709-817 763-763t85.5 127Q880-563 880-480.266q0 82.734-31.5 155.5T763-197.684q-54 54.316-127 86Q563-80 480.266-80Zm.234-60Q622-140 721-239.5t99-241Q820-622 721.188-721 622.375-820 480-820q-141 0-240.5 98.812Q140-622.375 140-480q0 141 99.5 240.5t241 99.5Zm-.5-340Z"/></svg></li>
			<li id="am">야영장을 선택해 주세요.</li>
			<li id="am2" style="display:none"><a id="cm"></a>야영장을 선택하셨습니다.</li>
	</ul>
	<ul class="seldate">
		<li><u>입실일자</u><input type="date" id="date1" name="date1"></li>
		<li><u>퇴실일자</u><input type="date" id="date2" name="date2"></li>
	</ul>
	
	<ul class="selarea">
		<li><input type="button" value="야영장 선택" onclick="carea()"></li>
	</ul>
</div>
</section>
<footer>
   <div class="bottom">
         <span>(국립공원공단) 강원도 원주시 혁신로 22 (우)26466 사업자등록번호: 211-82-06541 예약안내: 1670-9201 (평일 09-18시, 점심시간 12-13시) FAX: 033-769-9579 이메일: csnp@knps.or.kr</span>
         <span>Copyright @ Korea National Park Service. All Rights Reserved.</span>
   </div>
</footer>
</form>
</body>
<script>
	function carea() {
		document.getElementById("date1");
		document.getElementById("date2");
		var date1=document.getElementById("date1").value;
		var date2=document.getElementById("date2").value;
		if(date1>=date2){
			alert("입실 일자는 퇴실일자보다 빨라야합니다.");
		}
		else{
			frm.method="post";
			//frm.action="http://192.168.10.143:8080/plan/select.do";
			frm.action="http://localhost:8080/plan/select.do";
			frm.submit();			
		}

	}
	var uri = window.location.search;
	var result = uri.split("?jtel=");
	document.getElementById("j2").value=result[1];
	document.getElementById("jnm").innerHTML = "<%=jnm%>" + "님 환영합니다." + `<input type="button" class="top_btn" value="로그아웃" onclick="logingo()">`;
</script>
<script src="./js/pension2.js?v=1" defer></script>
</html>