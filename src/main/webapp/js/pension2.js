function ajax(){
	   var mdata;
	   function win(){
	      if(window.XMLHttpRequest){
	         return new XMLHttpRequest();
	      }
	   }
	   function file(){
	      if(mdata.readyState==XMLHttpRequest.DONE && mdata.status==200){
	            htmlview(JSON.parse(this.response));
	            //names(JSON.parse(this.response));
	      }
	   }
	   
	   mdata = win();
	   mdata.onreadystatechange = file;
	   mdata.open("GET","./last_webpage/json/campsite.json",true);
	   mdata.send();
	}
	ajax();
	

function htmlview(data){
	var w = 0;
	var ww =0;
	var www = 0;
	//console.log(data["camp"][0]["camp_part"]);	
	 data["camp"].forEach(function(a1,b1){ 
		 www = 0;
		 var ai = document.getElementById("m"+w)
		 var ol = document.createElement("ol");
		 ol.className ="olcs";
		 ol.id ="aa"+w;
		 var ea = data["camp"][w]["camp_part"].length;
		 console.log(ea);
		 while(www < ea){
			var li = document.createElement("li");
			li.id="mm"+ww;
			li.className="licss";
			li.setAttribute("onclick","abc("+ww+")");
			li.innerText = data["camp"][w]["camp_part"][www];
			ol.append(li);
			 www++;
			 ww++;
		 }
		 ai.append(ol);
		 w++;
		//console.log(a1);
		
	 });	 
	   
}
/*
function names(data){
	var w=0;
	data["camp"].forEach(function (a11,b11){
	console.log(data["camp"][b11]["camp_name"]);
	while(w<data["camp"][b11]["camp_name"].length){
		var adm=document.getElementById("cm");
		if(data["camp"][b11]["camp_name"][0]=="가야산"){
			adm.innerText="가야산";
		}
		else if(data["camp"][b11]["camp_name"][1]=="계룡산"){
			adm.innerText="계룡산";
		}
		
		w++;
	}

	 });
}
*/
function mou(a){
	var w = 0;
	while(w<8){
		document.getElementById("aa"+w).style.display = "none";
		document.getElementById("m"+w).style.backgroundColor ="white";
		w++;
	}
	document.getElementById("m"+a).style.backgroundColor ="#666666";
	var cm = document.getElementById("cm");
	document.getElementById("h1").value = a;
	document.getElementById("aa"+a).style.display = "flex";
	document.getElementById("aa"+a).style.justifyContent = "center";
	document.getElementById("aa"+a).style.flexDirection = "row";
	
	document.getElementById("am").style.display="none";
	document.getElementById("am2").style.display="block";
	
	
	if(a==0){
		cm.innerText="가야산 ";
		document.getElementsByClassName("m1")[0].style.marginTop= "70px";
		document.getElementsByClassName("m1")[1].style.marginTop= "70px";
		document.getElementsByClassName("m1")[2].style.marginTop= "70px";
		document.getElementsByClassName("m1")[3].style.marginTop= "70px";
		
	}
	else if(a==1){
		cm.innerText="계룡산 ";
		document.getElementsByClassName("m1")[0].style.marginTop= "70px";
		document.getElementsByClassName("m1")[1].style.marginTop= "70px";
		document.getElementsByClassName("m1")[2].style.marginTop= "70px";
		document.getElementsByClassName("m1")[3].style.marginTop= "70px";
	}
	else if(a==2){
		cm.innerText="내장산 ";
		document.getElementsByClassName("m1")[0].style.marginTop= "70px";
		document.getElementsByClassName("m1")[1].style.marginTop= "70px";
		document.getElementsByClassName("m1")[2].style.marginTop= "70px";
		document.getElementsByClassName("m1")[3].style.marginTop= "70px";
	}
	else if(a==3){
		cm.innerText="덕유산 ";
		document.getElementsByClassName("m1")[0].style.marginTop= "70px";
		document.getElementsByClassName("m1")[1].style.marginTop= "70px";
		document.getElementsByClassName("m1")[2].style.marginTop= "70px";
		document.getElementsByClassName("m1")[3].style.marginTop= "70px";
	}
	else if(a==4){
		cm.innerText="무등산 ";
		document.getElementsByClassName("m1")[0].style.marginTop= "70px";
		document.getElementsByClassName("m1")[1].style.marginTop= "70px";
		document.getElementsByClassName("m1")[2].style.marginTop= "70px";
		document.getElementsByClassName("m1")[3].style.marginTop= "70px";
		document.getElementById("aa"+a).style.top="-140px";
	}
	else if(a==5){
		cm.innerText="설악산 ";
			document.getElementsByClassName("m1")[0].style.marginTop= "70px";
		document.getElementsByClassName("m1")[1].style.marginTop= "70px";
		document.getElementsByClassName("m1")[2].style.marginTop= "70px";
		document.getElementsByClassName("m1")[3].style.marginTop= "70px";
		document.getElementById("aa"+a).style.top="-140px";
	}
	else if(a==6){
		cm.innerText="소백산 ";
		document.getElementsByClassName("m1")[0].style.marginTop= "70px";
		document.getElementsByClassName("m1")[1].style.marginTop= "70px";
		document.getElementsByClassName("m1")[2].style.marginTop= "70px";
		document.getElementsByClassName("m1")[3].style.marginTop= "70px";
		document.getElementById("aa"+a).style.top="-140px";
	}
	else if(a==7){
		cm.innerText="월악산 ";
			document.getElementsByClassName("m1")[0].style.marginTop= "70px";
		document.getElementsByClassName("m1")[1].style.marginTop= "70px";
		document.getElementsByClassName("m1")[2].style.marginTop= "70px";
		document.getElementsByClassName("m1")[3].style.marginTop= "70px";
		document.getElementById("aa"+a).style.top="-140px";
	}
}

function abc(c){
	document.getElementById("h2").value=c;
	var ac = 0;
	while(ac < 17){
		document.getElementById("mm"+ac).style.backgroundColor = "#ffffff";
		document.getElementById("mm"+ac).style.color = "#000000";
		ac++;		
	}
	document.getElementById("mm"+c).style.backgroundColor = "#000000";
	document.getElementById("mm"+c).style.color = "white";
	
	
	/*if (c==0) {
		document.getElementById("mm0").style.backgroundColor = "#000000";
		document.getElementById("mm0").style.color = "white";
		document.getElementById("mm1").style.backgroundColor = "#ffffff";
		document.getElementById("mm1").style.color = "#000000";
		document.getElementById("mm1").style.backgroundColor = "#ffffff";
		document.getElementById("mm1").style.color = "#000000";
		
	}
	else if(c==1){
		document.getElementById("mm0").style.backgroundColor = "#ffffff";
		document.getElementById("mm0").style.color = "#000000";
		document.getElementById("mm1").style.backgroundColor = "#000000";
		document.getElementById("mm1").style.color = "white";
		document.getElementById("mm2").style.backgroundColor = "#ffffff";
		document.getElementById("mm2").style.color = "#000000";
	}
	else if(c==2){
		document.getElementById("mm0").style.backgroundColor = "#ffffff";
		document.getElementById("mm0").style.color = "#000000";
		document.getElementById("mm1").style.backgroundColor = "#ffffff";
		document.getElementById("mm1").style.color = "#000000";
		document.getElementById("mm2").style.backgroundColor = "#000000";
		document.getElementById("mm2").style.color = "white";
	}*/

}
