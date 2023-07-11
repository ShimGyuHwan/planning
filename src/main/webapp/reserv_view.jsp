<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
 
    request.setCharacterEncoding("UTF-8");
 
%>
    
<%
  Date now = new Date();
%>
<%
    	ArrayList<String> al = (ArrayList<String>)request.getAttribute("list");
    	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/header2.css?v=6">
<link rel="stylesheet" type="text/css" href="./css/default.css?v=2">
<link rel="stylesheet" type="text/css" href="./css/view.css?v=4">
<script src="./js/view.js?v=1"></script>


<title>예약확인페이지</title>
</head>
<body>
<header>
<div class="top">
	<div class="logo"></div>
	<ul>
		<li>이용안내</li>
		<li>예약하기</li>
		<li onclick="adf()" style="cursor:pointer;">예약확인</li>
		<li>마이페이지</li>
		<li>그린포인트</li>
	</ul>
	<ol>
		<li class="top_logout"><svg xmlns="http://www.w3.org/2000/svg" height="35" viewBox="0 -960 960 960" width="35" fill="currentColor" color="#FFFFFF"><path d="M400-400q-50 0-85-35t-35-85q0-22 7-41.5t21-35.5q-4-10-6-21t-2-22q0-38 20.5-67.5T374-751q20-23 47-36t59-13q32 0 59 13t47 36q33 14 53.5 43.5T660-640q0 11-2 22t-6 21q14 16 21 35.5t7 41.5q0 50-35 85t-85 35H400Zm0-60h160q25.5 0 42.75-18.5T620-519.957q0-10.043-3-19.543T606-558q-8-10-11-19.135-3-9.134-3-17.173 0-11.692 4-23.192t4-22.553Q600-659 590-673.5 580-688 563-696q-7-3-12-7t-10-9q-6.774-8-22.355-18-15.58-10-38.613-10-23.032 0-38.639 10.545Q425.786-718.909 419-711q-5 5-10 9.5t-12 6.5q-17 7-27 21.5t-10 33.447q0 11.053 4 22.553t4 23.192q0 8.039-3 17.173Q362-568 354-558q-8 9-11 18.5t-3 19.543Q340-497 357.25-478.5T400-460ZM160-80v-94q0-38 19-65t49-41q67-30 128.5-45T480-340q62 0 123 15.5t127.921 44.694q31.301 14.126 50.19 40.966Q800-212 800-174v94H160Zm60-60h520v-34q0-16-9.5-30.5T707-226q-64-31-117-42.5T480-280q-57 0-111 11.5T252-226q-14 7-23 21.5t-9 30.5v34Zm260 0Zm0-320Z"/></svg><span><%out.print(al.get(0));%>님 환영합니다<input type="button" class="top_btn" value="로그아웃" onclick="logingo()"></span></li>
		<li class="top_login" style="display:none;"><svg xmlns="http://www.w3.org/2000/svg" height="35" viewBox="0 -960 960 960" width="35" fill="currentColor" color="#FFFFFF"><path d="M400-400q-50 0-85-35t-35-85q0-22 7-41.5t21-35.5q-4-10-6-21t-2-22q0-38 20.5-67.5T374-751q20-23 47-36t59-13q32 0 59 13t47 36q33 14 53.5 43.5T660-640q0 11-2 22t-6 21q14 16 21 35.5t7 41.5q0 50-35 85t-85 35H400Zm0-60h160q25.5 0 42.75-18.5T620-519.957q0-10.043-3-19.543T606-558q-8-10-11-19.135-3-9.134-3-17.173 0-11.692 4-23.192t4-22.553Q600-659 590-673.5 580-688 563-696q-7-3-12-7t-10-9q-6.774-8-22.355-18-15.58-10-38.613-10-23.032 0-38.639 10.545Q425.786-718.909 419-711q-5 5-10 9.5t-12 6.5q-17 7-27 21.5t-10 33.447q0 11.053 4 22.553t4 23.192q0 8.039-3 17.173Q362-568 354-558q-8 9-11 18.5t-3 19.543Q340-497 357.25-478.5T400-460ZM160-80v-94q0-38 19-65t49-41q67-30 128.5-45T480-340q62 0 123 15.5t127.921 44.694q31.301 14.126 50.19 40.966Q800-212 800-174v94H160Zm60-60h520v-34q0-16-9.5-30.5T707-226q-64-31-117-42.5T480-280q-57 0-111 11.5T252-226q-14 7-23 21.5t-9 30.5v34Zm260 0Zm0-320Z"/></svg><span><input type="button" class="top_btn" value="로그인" onclick="logingo()"></span></li>
		<li class="top_login" style="display:none;"><svg xmlns="http://www.w3.org/2000/svg" height="35" viewBox="0 -960 960 960" width="35" fill="currentColor" color="#FFFFFF"><path d="M0-240v-53q0-38.567 41.5-62.784Q83-380 150.376-380q12.165 0 23.395.5Q185-379 196-377.348q-8 17.348-12 35.165T180-305v65H0Zm240 0v-65q0-32 17.5-58.5T307-410q32-20 76.5-30t96.5-10q53 0 97.5 10t76.5 30q32 20 49 46.5t17 58.5v65H240Zm540 0v-65q0-19.861-3.5-37.431Q773-360 765-377.273q11-1.727 22.171-2.227 11.172-.5 22.829-.5 67.5 0 108.75 23.768T960-293v53H780Zm-480-60h360v-6q0-37-50.5-60.5T480-390q-79 0-129.5 23.5T300-305v5ZM149.567-410Q121-410 100.5-430.562 80-451.125 80-480q0-29 20.562-49.5Q121.125-550 150-550q29 0 49.5 20.5t20.5 49.933Q220-451 199.5-430.5T149.567-410Zm660 0Q781-410 760.5-430.562 740-451.125 740-480q0-29 20.562-49.5Q781.125-550 810-550q29 0 49.5 20.5t20.5 49.933Q880-451 859.5-430.5T809.567-410ZM480-480q-50 0-85-35t-35-85q0-51 35-85.5t85-34.5q51 0 85.5 34.5T600-600q0 50-34.5 85T480-480Zm.351-60Q506-540 523-557.351t17-43Q540-626 522.851-643t-42.5-17Q455-660 437.5-642.851t-17.5 42.5Q420-575 437.351-557.5t43 17.5ZM480-300Zm0-300Z"/></svg><span><input type="button" class="top_btn" value="회원가입" onclick="joinok()"></span></li>
	</ol>
</div>
</header>
<form id="f">
<input type="hidden" name="num" value="<%out.print(al.get(3));%>" id="h">
<section>
	<div class="all">
		<p>야영장 예약확인</p>
		<div><img src="./ico/camping.svg" class="ico"><span><%out.print(al.get(4));%> <%out.print(al.get(5));%> 야영장</span><span><%out.print(al.get(7));%> ~ <%out.print(al.get(8));%></span></div>
		<div><span>야영장 위치</span><span><%out.print(al.get(5));%> - <%out.print(al.get(6));%></span></div>
		<div>총 금액: <%out.print(al.get(10));%>원</div>
		<div><img src="./ico/report.svg" class="ico"><span>예약자 정보</span></div>
		<div><span>고객명</span><span><%out.print(al.get(0));%></span></div>
		<div><span>연락처</span><span><%out.print(al.get(1));%></span></div>
		<div><span>인원수</span><span><%out.print(al.get(2));%></span></div>
		<div><span>예약번호</span><span><%out.print(al.get(3));%></span></div>
		<div><img src="./ico/pay.svg" class="ico"><span>결제수단</span></div>
		<div class="box_all">
			<span class="box" id="pay"></span>
			<span class="comp" id="ok"></span>
			
		</div>
		
		<div class="b">
		<input type="button" class="btn" value="예약취소" onclick="back()">
		</div>
	</div>
</section>
</form>
	<footer>
   <div class="bottom">
         <span>(국립공원공단) 강원도 원주시 혁신로 22 (우)26466 사업자등록번호: 211-82-06541 예약안내: 1670-9201 (평일 09-18시, 점심시간 12-13시) FAX: 033-769-9579 이메일: csnp@knps.or.kr</span>
         <span>Copyright @ Korea National Park Service. All Rights Reserved.</span>
   </div>
</footer>
</body>
<script>
var p =document.getElementById("pay");
var o =document.getElementById("ok");
var msg ="<%out.print(al.get(9));%>";
var h = document.getElementById("h");

if(msg =="a"){
	p.innerText="무통장 입금";
	o.innerText="입금완료";
}
else if(msg=="b"){
	p.innerText="신용카드";
}
else if(msg=="c"){
	p.innerText="계좌이체";
}
function adf(){
	window.location = "./reserv_ck.html";
}
</script>
</html>