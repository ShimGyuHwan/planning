/**
 * 
 */function check(){
	
	if(rck.rnum.value.length!=8){
		
	alert("올바른 예약번호를 입력하세요");
	rck.rnum.focus();	
	}
	else{
		rck.method="post";
		rck.action="controller.do";
		rck.submit();
		
	}
 }