var count = 0;
function pay(a){
		var pay = document.getElementById("pay");
		var pay2 = document.getElementById("pay2");
		var card = document.getElementById("card");
		var bank = document.getElementById("bank");
	if(a==1){
		pay.style.backgroundColor="#000000";
		pay.style.color="#ffffff";
		card.style.backgroundColor="#ffffff";
		card.style.color="#000000";
		bank.style.backgroundColor="#ffffff";
		bank.style.color="#000000";
		pay2.style.display="block";
		f.pay.value="a";
		count++;
	}
	else if(a==2){
		pay.style.backgroundColor="#ffffff";
		pay.style.color="#000000";
		card.style.backgroundColor="#000000";
		card.style.color="#ffffff";
		bank.style.backgroundColor="#ffffff";
		bank.style.color="#000000";
		pay2.style.display="none";
		f.pay.value="b";
		count++;
	}
	else if(a==3){
		pay.style.backgroundColor="#ffffff";
		pay.style.color="#000000";
		card.style.backgroundColor="#ffffff";
		card.style.color="#000000";
		bank.style.backgroundColor="#000000";
		bank.style.color="#ffffff";
		pay2.style.display="none";
		f.pay.value="c";
		count++;
	}

}
function gogo(){
	if(count == 0){
		alert("결제수단을 선택해주세요");
	}
	else{
		f.method="post";
		//f.action="http://192.168.10.153:8080/plan/finalok.do";
		f.action="./finalok.do";
		f.submit();
	}
	

}
function reser(){
   frm.method="post";
   frm.action="http://localhost:8080/plan/login.html";
   frm.submit();
}