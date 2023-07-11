var array;
function ajax(){
	var data;
    function win(){
        if(window.XMLHttpRequest){
            return new XMLHttpRequest();
        }
    }
    function fileopen(){
        if(data.readyState == XMLHttpRequest.DONE && data.status == 200){
         	array = JSON.parse(this.response);
			document.getElementById("mg").style.backgroundImage = "url('"+array.camp[a1].camp_image[a2]+"')";
			document.getElementById("lic1").innerText = "총 금액 :" + (array.camp[a1].camp_money[a2] * total).toLocaleString();
			document.getElementById("hh").value = (array.camp[a1].camp_money[a2] * total).toLocaleString();
        }
    }   
    data = win();
    data.onreadystatechange = fileopen;
    data.open("GET","./json/campsite.json",true);
    data.send();
}
ajax();
var a; 
var b = 1;
var c = "";
while(b <= 8 ){
	a= Math.ceil(Math.random()*9); 
	c+=a;
	b++;
}
document.getElementById("num").value = c;

function btnn(){
	if(fc.slocal1[0].checked == false && fc.slocal1[1].checked == false && fc.slocal1[2].checked == false && fc.slocal1[3].checked == false){
		alert("동을 선택해주세요.");
	}
	else{
		fc.submit();
	}
}







