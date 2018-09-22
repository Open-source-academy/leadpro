function validate()
{
	var instituteName=document.regForm.IName.value;  
	var address1=document.regForm.Address.value;	 
	var profile=document.regForm.Profile.value;		 
	var city=document.regForm.City.value;		 
	var pincode=document.regForm.Pincode.value;		 
	var mobile=document.regForm.mobile.value;		 
	var email=document.regForm.Email.value;
	
	
	if(instituteName=="")
		{
		document.getElementById("namemsg").innerHTML="<font size='1px' color='#ff0033'>Enter your Organization Name</font>"
		 document.getElementById("instituteName").style.borderColor="red";
		document.regForm.IName.focus();
		return false;
		}
	
	
	if(address1=="")
		{
		document.getElementById("addressmsg").innerHTML="<font size='1px' color='#ff0033'>Enter the Address</font>"
		 document.getElementById("address1").style.borderColor="red";
		document.regForm.Address.focus();
			 return false;
		}
	if(profile=="")
		{
	document.getElementById("profilemsg").innerHTML="<font size='1px' color='#ff0033'>Enter the Organization Profile</font>"
		 document.getElementById("profile").style.borderColor="red";
		document.regForm.Profile.focus();
			 return false;
		}
	if(city=="")
		{
		document.getElementById("citymsg").innerHTML="<font size='1px' color='#ff0033'>Enter the City</font>"
		 document.getElementById("city").style.borderColor="red";
		document.regForm.City.focus();
			 return false;
		}
	if(pincode=="")
		{
		document.getElementById("pinmsg").innerHTML="<font size='1px' color='#ff0033'>Enter the Pin Code</font>"
		 document.getElementById("pincode").style.borderColor="red";
		document.regForm.Pincode.focus();
			 return false;
		}
	if(mobile=="" )
		{
		document.getElementById("mobilemsg").innerHTML="<font size='1px' color='#ff0033'>Enter the Correct Mobile No</font>"
		 document.getElementById("mobile").style.borderColor="red";
		document.regForm.mobile.focus();
			 return false;
		}
	if(mobile.length>10 || mobile.length<10 )
		{
	//	document.getElementById("mobilemsg").innerHTML="<font size='1px' color='#ff0033'>Enter the 10 digit Mobile No</font>"
		 document.getElementById("mobile").style.borderColor="red";
		document.regForm.mobile.focus();
			 return false;
		}
	if(email=="")
		{
		 document.getElementById("emailmsg").innerHTML="<font size='1px' color='#ff0033'>Enter the Email</font>"
		 document.getElementById("email").style.borderColor="red";
		document.regForm.Email.focus();
			 return false;
		}
}