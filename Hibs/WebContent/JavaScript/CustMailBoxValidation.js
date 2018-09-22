function mailBoxValidate()
{
	var mail=document.form1.email.value;
	var sub=document.form1.sub.value;
	var msg=document.form1.msg.value;
	var custmail=document.form1.custmail.value;
	var custPass=document.form1.pass.value;
	
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