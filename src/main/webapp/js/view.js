/**
 * 
 */
function back(){
	
	if(confirm("예약을 취소 하시겠습니까?")){
		f.method="post";
		f.action="r_delete.do";
		f.submit();
	}
	else{
		
	}
}