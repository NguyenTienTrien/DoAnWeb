var x=1;
function setMK(){
	
	var node=document.getElementById("change_MK");
	if(x===1)
	{
		x=0;
		document.getElementById("currenMK").style="";
	}
	else{
		x=1;
		document.getElementById("currenMK").style="display: none";
	}

}