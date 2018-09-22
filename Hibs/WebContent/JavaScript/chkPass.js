function validate()
{
	var oldpass=document.form1.oldpass.value;
	var newpass=document.form1.newpass.value;
	var newpass1=document.form1.newpass1.value;
		
	if(oldpass=="")
		{
		document.getElementById("old").innerHTML="<font size='1px' color='#ff0033'>Enter the old Password</font>"
		 document.getElementById("oldpass").style.borderColor="red";
		return false;
		}
	if(newpass=="")
		{
		document.getElementById("new1").innerHTML="<font size='1px' color='#ff0033'>Enter the new Password</font>"
		 document.getElementById("newpass").style.borderColor="red";
		return false;
		}
	if(newpass1=="")
		{
		document.getElementById("new2").innerHTML="<font size='1px' color='#ff0033'>Conform the Password</font>"
		 document.getElementById("newpass1").style.borderColor="red";
		return false;
		}
	if(newpass1!=newpass)
		{
		document.getElementById("new1").innerHTML="<font size='1px' color='#ff0033'>Password  doesn't match</font>"
			document.getElementById("new2").innerHTML="<font size='1px' color='#ff0033'>Password  doesn't match</font>"
		 document.getElementById("newpass").style.borderColor="red";
		document.getElementById("newpass1").style.borderColor="red";
		return false;
		}
	
}