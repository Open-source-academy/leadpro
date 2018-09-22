function resetPass()
{   
	
	var old=document.form1.old.value;
	var pass=document.form1.pass.value;
	var conpass=document.form1.conpass.value;
	
	if(old=="")
		{
		document.getElementById("oldmsg").innerHTML="<font size='1px' color='#ff0033'>Enter your old Password</font>"
		 document.getElementById("old").style.borderColor="red";
		document.form1.old.focus();
		return false;
		}
	if(pass=="")
		{
		document.getElementById("passmsg").innerHTML="<font size='1px' color='#ff0033'>Enter your new Password</font>"
		 document.getElementById("pass").style.borderColor="red";
		document.form1.pass.focus();
		return false;
		
		}
	if(conpass=="")
		{
		document.getElementById("conpassmsg").innerHTML="<font size='1px' color='#ff0033'>Conform your password</font>"
		 document.getElementById("conpass").style.borderColor="red";
		document.form1.conpass.focus();
		return false;
		
		}
	if(pass!=conpass)
		{
		document.getElementById("passmsg").innerHTML="<font size='1px' color='#ff0033'>Conform your password</font>"
		document.getElementById("passmsg").innerHTML="<font size='1px' color='#ff0033'>Conform your password</font>"
		
		 document.getElementById("pass").style.borderColor="red";	
		  document.getElementById("conpass").style.borderColor="red";
		  
		  document.form1.pass.focus();
		return false;
		}
	
	
	
}
