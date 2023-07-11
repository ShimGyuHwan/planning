<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
 
    request.setCharacterEncoding("UTF-8");
 
%>
    
<%
	String a = (String)request.getAttribute("a");
	String b = (String)request.getAttribute("b");
	String name = (String)request.getAttribute("name");
	String tel = (String)request.getAttribute("tel");
	String n1 = (String)request.getAttribute("n1");
	String n2 = (String)request.getAttribute("n2");
	String result[] = n1.split("-");
    String result2[] = n2.split("-");
    	int sum = Integer.parseInt(result2[2]) - Integer.parseInt(result[2]);
		if(result[1] == "01" || result[1] == "03" || result[1] == "05" || result[1] == "07" || result[1] == "08" || result[1] == "10" || result[1] == "12"){
	    	if(sum < 0){
    			sum = 31 + Integer.parseInt(result2[2]) - Integer.parseInt(result[2]);
    		}
		}
		else if(result[1] == "04" || result[1] == "06" || result[1] == "09" || result[1] == "11"){
	    	if(sum < 0){
    			sum = 30 + Integer.parseInt(result2[2]) - Integer.parseInt(result[2]);
    		}
		}
		else if(result[1] == "2"){
	    	if(sum < 0){
    			sum = 28 + Integer.parseInt(result2[2]) - Integer.parseInt(result[2]);
    		}
		}
		String c = "";
		String d = "";
		if(a == "0"){
			c = "가야산";
			if(b == "0"){
				d = "백운동";
			}
			else if(b == "1"){
				d = "삼정";
			}
			else if(b == "2"){
				d = "치인";
			}
		}
		else if(a == "1"){
			c = "계룡산";
			d = "동학사";
			b = "0";
		}
		else if(a == "2"){
			c = "내장산";
			if(b == "4"){
				b = "0";
				d = "가인";
			}
			else if(b == "5"){
				b = "1";
				d = "가장";
			}
		}
		else if(a == "3"){
			c = "덕유산";
			if(b == "6"){
				b = "0";
				d = "덕유대1";
			}
			else if(b == "7"){
				b = "1";
				d = "덕유대2";
			}
			else if(b == "8"){
				b = "2";
				d = "덕유대3";
			}
		}
		else if(a == "4"){
			c = "무등산";
			d = "도원";
			b = "0";
		}
		else if(a == "5"){
			c = "설악산";
			d = "설악동";
			b = "0";
		}
		else if(a == "6"){
			c = "소백산";
			if(b == "11"){
				b = "0";
				d = "남천";
			}
			else if(b == "12"){
				b = "1";
				d = "삼가";
			}
		}
		else if(a == "7"){
			c = "월악산";
			if(b == "13"){
				b = "0";
				d = "단돈재";
			}
			else if(b == "14"){
				b = "1";
				d = "단돈재2";
			}
			else if(b == "15"){
				b = "2";
				d = "덕주";
			}
			else if(b == "16"){
				b = "3";
				d = "송계";
			}
		}
		ArrayList<String> msg = (ArrayList<String>)request.getAttribute("msg");
		int ss = 0;
		if(msg.toString() != "[]"){
			ss = msg.size();		
		}
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야영장 예약하기</title>
<link rel="stylesheet" type="text/css" href="./css/font.css?v=3">
<link rel="stylesheet" type="text/css" href="./css/header2.css?v=5">
<link rel="stylesheet" type="text/css" href="./css/select.css?v=3">

</head>
<body>
<form id="fc" method="post" action="http://localhost:8080/plan/part3.do">
<header>
<div class="top">
	<div class="logo"></div>
	<ul>
		<li>이용안내</li>
		<li onclick="reser()">예약하기</li>
		<li onclick="adf()" style="cursor:pointer;">예약확인</li>
		<li>마이페이지</li>
		<li>그린포인트</li>
	</ul>
	<ol>
		<li class="top_logout"><svg xmlns="http://www.w3.org/2000/svg" height="35" viewBox="0 -960 960 960" width="35" fill="currentColor" color="#FFFFFF"><path d="M400-400q-50 0-85-35t-35-85q0-22 7-41.5t21-35.5q-4-10-6-21t-2-22q0-38 20.5-67.5T374-751q20-23 47-36t59-13q32 0 59 13t47 36q33 14 53.5 43.5T660-640q0 11-2 22t-6 21q14 16 21 35.5t7 41.5q0 50-35 85t-85 35H400Zm0-60h160q25.5 0 42.75-18.5T620-519.957q0-10.043-3-19.543T606-558q-8-10-11-19.135-3-9.134-3-17.173 0-11.692 4-23.192t4-22.553Q600-659 590-673.5 580-688 563-696q-7-3-12-7t-10-9q-6.774-8-22.355-18-15.58-10-38.613-10-23.032 0-38.639 10.545Q425.786-718.909 419-711q-5 5-10 9.5t-12 6.5q-17 7-27 21.5t-10 33.447q0 11.053 4 22.553t4 23.192q0 8.039-3 17.173Q362-568 354-558q-8 9-11 18.5t-3 19.543Q340-497 357.25-478.5T400-460ZM160-80v-94q0-38 19-65t49-41q67-30 128.5-45T480-340q62 0 123 15.5t127.921 44.694q31.301 14.126 50.19 40.966Q800-212 800-174v94H160Zm60-60h520v-34q0-16-9.5-30.5T707-226q-64-31-117-42.5T480-280q-57 0-111 11.5T252-226q-14 7-23 21.5t-9 30.5v34Zm260 0Zm0-320Z"/></svg><span><%=name %>님 환영합니다<input type="button" class="top_btn" value="로그아웃" onclick="logingo()"></span></li>
		<li class="top_login" style="display:none;"><svg xmlns="http://www.w3.org/2000/svg" height="35" viewBox="0 -960 960 960" width="35" fill="currentColor" color="#FFFFFF"><path d="M400-400q-50 0-85-35t-35-85q0-22 7-41.5t21-35.5q-4-10-6-21t-2-22q0-38 20.5-67.5T374-751q20-23 47-36t59-13q32 0 59 13t47 36q33 14 53.5 43.5T660-640q0 11-2 22t-6 21q14 16 21 35.5t7 41.5q0 50-35 85t-85 35H400Zm0-60h160q25.5 0 42.75-18.5T620-519.957q0-10.043-3-19.543T606-558q-8-10-11-19.135-3-9.134-3-17.173 0-11.692 4-23.192t4-22.553Q600-659 590-673.5 580-688 563-696q-7-3-12-7t-10-9q-6.774-8-22.355-18-15.58-10-38.613-10-23.032 0-38.639 10.545Q425.786-718.909 419-711q-5 5-10 9.5t-12 6.5q-17 7-27 21.5t-10 33.447q0 11.053 4 22.553t4 23.192q0 8.039-3 17.173Q362-568 354-558q-8 9-11 18.5t-3 19.543Q340-497 357.25-478.5T400-460ZM160-80v-94q0-38 19-65t49-41q67-30 128.5-45T480-340q62 0 123 15.5t127.921 44.694q31.301 14.126 50.19 40.966Q800-212 800-174v94H160Zm60-60h520v-34q0-16-9.5-30.5T707-226q-64-31-117-42.5T480-280q-57 0-111 11.5T252-226q-14 7-23 21.5t-9 30.5v34Zm260 0Zm0-320Z"/></svg><span><input type="button" class="top_btn" value="로그인" onclick="logingo()"></span></li>
		<li class="top_login" style="display:none;"><svg xmlns="http://www.w3.org/2000/svg" height="35" viewBox="0 -960 960 960" width="35" fill="currentColor" color="#FFFFFF"><path d="M0-240v-53q0-38.567 41.5-62.784Q83-380 150.376-380q12.165 0 23.395.5Q185-379 196-377.348q-8 17.348-12 35.165T180-305v65H0Zm240 0v-65q0-32 17.5-58.5T307-410q32-20 76.5-30t96.5-10q53 0 97.5 10t76.5 30q32 20 49 46.5t17 58.5v65H240Zm540 0v-65q0-19.861-3.5-37.431Q773-360 765-377.273q11-1.727 22.171-2.227 11.172-.5 22.829-.5 67.5 0 108.75 23.768T960-293v53H780Zm-480-60h360v-6q0-37-50.5-60.5T480-390q-79 0-129.5 23.5T300-305v5ZM149.567-410Q121-410 100.5-430.562 80-451.125 80-480q0-29 20.562-49.5Q121.125-550 150-550q29 0 49.5 20.5t20.5 49.933Q220-451 199.5-430.5T149.567-410Zm660 0Q781-410 760.5-430.562 740-451.125 740-480q0-29 20.562-49.5Q781.125-550 810-550q29 0 49.5 20.5t20.5 49.933Q880-451 859.5-430.5T809.567-410ZM480-480q-50 0-85-35t-35-85q0-51 35-85.5t85-34.5q51 0 85.5 34.5T600-600q0 50-34.5 85T480-480Zm.351-60Q506-540 523-557.351t17-43Q540-626 522.851-643t-42.5-17Q455-660 437.5-642.851t-17.5 42.5Q420-575 437.351-557.5t43 17.5ZM480-300Zm0-300Z"/></svg><span><input type="button" class="top_btn" value="회원가입" onclick="joinok()"></span></li>
	</ol>
</div>
</header>
<!-- <form id="fc" method="post" action="http://192.168.10.142:8080/plan/part3.do"> -->

<section style="width: 1200px; height: 800px;">
	<div class="box">
		<div class="u"><u>야영장 예약하기</u></div>
		<div class="i" id="mg"></div>
		<ul class="aja">
			<li><img src="./ico/camping.svg" class="i2"><%=c%> <%=d%> 야영장</li>
			<li><div  class="b"><input type="radio" name="slocal1" class="t2" value="가동" id="ck1"> <%=d%> - 가동 </div><div class="suc" id="suc1">완료</div></li>
			<li><div  class="b"><input type="radio" name="slocal1" class="t2" value="나동" id="ck2"> <%=d%> - 나동 </div><div class="suc" id="suc2">완료</div></li>
			<li><div  class="b"><input type="radio" name="slocal1" class="t2" value="다동" id="ck3"> <%=d%> - 다동 </div><div class="suc" id="suc3">완료</div></li>
			<li><div  class="b"><input type="radio" name="slocal1" class="t2" value="라동" id="ck4"> <%=d%> - 라동 </div><div class="suc" id="suc4">완료</div></li>
			<li><div class="lic1" id="lic1"><!-- 총금액 --></div></li>
			<li><div class="lic2"><img src="./ico/report.svg" class="i3">예약자 정보</div></li>
			<li></li>
			<li>고객명  <input type="text" class="t1" value="<%=name%>" name="sname"></li>
			<li>연락처  <input type="text" class="t1" value="<%=tel%>" name="stel"><a class="ship">연락 받을 수 있는 연락처를 기입</a></li>
			<li>
				인원수  <select class="s1" name="sle">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
				</select>
				<a class="ship2">방문 인원 선택은 야영장 기준 최대 인원수 범위</a>
			</li>
		</ul>
		<input type="button" class="btn" value="예약 선택" onclick="btnn()">
		<div class="day1"></div>
	</div>
	<div class="did"><%=n1 %> - <%=n2 %></div>
	<input type="hidden" name="sarea1" value="<%=c%>">
	<input type="hidden" name="sarea2" value="<%=d%>">
	<input type="hidden" name="sdate1" value="<%=n1%>">
	<input type="hidden" name="sdate2" value="<%=n2%>">
	<input type="hidden" name="stotal" value="" id="hh">
	<input type="hidden" name="num" id="num">
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
	var total = <%=sum%>;
	var a1 = <%=a%>;
	var a2 = <%=b%>;
	function adf(){
		window.location = "./reserv_ck.html";
	}
	<%
	 int w = 0;
	while(w < ss){
	%>
	if("<%=msg.get(w)%>" == "가동"){
		document.getElementById("suc1").style.display = "block";
		document.getElementById("ck1").style.display = "none";
	}
	else if("<%=msg.get(w)%>" == "나동"){
		document.getElementById("suc2").style.display = "block";
		document.getElementById("ck2").style.display = "none";
	}
	else if("<%=msg.get(w)%>" == "다동"){
		document.getElementById("suc3").style.display = "block";
		document.getElementById("ck3").style.display = "none";
	}
	else if("<%=msg.get(w)%>" == "라동"){
		document.getElementById("suc4").style.display = "block";
		document.getElementById("ck4").style.display = "none";
	}
	<%	
		w++;
	}
	%>

</script>
<script src="./js/select.js?v=1"></script>
<script>
	function logingo() {
		fc.method="post";
		fc.action="./login.html";
		fc.submit();
	}
</script>
</html>