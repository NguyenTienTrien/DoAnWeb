var x;
function SearchName()
{	x=1;
	
	var node=document.getElementById('Search');
	node.setAttribute("placeholder","Tìm kiếm theo tên");
	// var a=note.setAttribute('placeholder');
	
	if(x===1)
	{
		document.getElementById("SName").style.color="red";
		document.getElementById("SType").style.color="";
		document.getElementById("SAuthor").style.color=""
	}

}
function SearchType()
{	x=2;
	var node=document.getElementById("Search");
	node.setAttribute("placeholder","Tìm kiếm theo loại");
	if(x===2)
	{
		document.getElementById("SType").style.color="red";
		document.getElementById("SName").style.color="";
		document.getElementById("SAuthor").style.color=""
	}

}
function SearchAuthor()
{	x=3;
	var node=document.getElementById("Search");
	node.setAttribute("placeholder","Tìm kiếm theo tác giả");
	if(x===3)
	{
		document.getElementById("SAuthor").style.color="red";
		document.getElementById("SType").style.color="";
		document.getElementById("SName").style.color=""
	}

}