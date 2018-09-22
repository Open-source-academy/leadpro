function Search()
{
	var key=document.form1.search.value;
	if(key=="")
		{
		document.getElementById("msg").style.borderColor="red";
		document.form1.search.focus();
		return false;
		}
}