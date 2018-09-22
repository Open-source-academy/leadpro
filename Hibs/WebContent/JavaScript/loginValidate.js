function validate()
{
	var name=document.form1.name.value;
	var password=document.form1.password.value;
	if(name=="")
		{
		//alert("enter name");
		document.getElementById("namemsg").innerHTML="<font size='1px' color='#ff0033'>Enter the EMAIL</font>"
		 document.getElementById("nametxt").style.borderColor="red";
			 return false;
		}
	
 if(password=="")
		{
		//alert("enter name");
		document.getElementById("passmsg").innerHTML="<font size='1px' color='#ff0033'>Enter the PASSWORD</font>"
		document.getElementById("password").style.borderColor="red";
		 
			 return false;
		}
	
	
}
