function mailChk()
{
	var mail=document.mailForm.email.value;
	var sub=document.mailForm.sub.value;
	var msg=document.mailForm.msg.value;
	var atpos=mail.indexOf("@");
    var dotpos=mail.lastIndexOf(".");
    
    var custmail=document.mailForm.custmail.value;
	var custPass=document.mailForm.pass.value;
	
	if(custmail=="" ||custPass=="")
		{
		alert("Your mail is not Configured..! Please contact your Administrator...!");
		return false;
		}
    
	
	if(mail=="")
		{
		 document.getElementById("mail").style.borderColor="red";
			return false;
		}
	
	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=mail.length)
		  {
		  alert("Not a valid e-mail address");
		  return false;
		  }
	
	
	if(sub=="")
		{
		 document.getElementById("sub").style.borderColor="red";
			return false;
		}
	if(msg=="")
		{
		 document.getElementById("msg").style.borderColor="red";
			return false;
		}
	
}