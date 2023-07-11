/**
 * 
 */
 function back(){
	 
	    if (!confirm("예약을 취소하시겠습니까?")) {
       
    } else {
		//location.href="http://192.168.10.144:8080/plan/login.html"; 
       	location.href="http://localhost:8080/plan/login.html"; 
           }
 }
 
 function complete(){
	 
	 alert("예약이 완료되었습니다.")
		f.method="post";
		f.action="./reserv_ck.html";
		f.submit();
	 
	 
 }