function validate()
{
	

	var name=document.form1.name.value;
	var address=document.form1.address.value;
	var mobileno=document.form1.mobileno.value;
	var email=document.form1.email.value;
	var date1=document.form1.date1.value;
	//var product=document.form1.product.value;
	var source=document.form1.source.value;
	var status=document.form1.status.value;
	
	//1
	if(name=="")
		{
		//document.getElementById("namemsg").innerHTML="<font size='1px' color='#ff0033'>Enter the Name</font>"
		 document.getElementById("name").style.borderColor="red";
		document.form1.name.focus();
		return false;
		}
	//2
	if(address=="")
		{
		//document.getElementById("addressmsg").innerHTML="<font size='1px' color='#ff0033'>Enter the Address</font>"
		 document.getElementById("address").style.borderColor="red";
		document.form1.address.focus();
		return false;
		}
	//3
	if(mobileno=="")
		{
		//document.getElementById("mobilenomsg").innerHTML="<font size='1px' color='#ff0033'>Enter 10 digit Mobile No</font>"
		 document.getElementById("mobileno").style.borderColor="red";
		document.form1.mobileno.focus();
		return false;
		}
	//4
	if(email=="")
		{
		//document.getElementById("emailmsg").innerHTML="<font size='1px' color='#ff0033'>Enter the Email</font>"
		 document.getElementById("email").style.borderColor="red";
		document.form1.email.focus();
		return false;
		}
	//5
	if(date1=="")
		{
		//document.getElementById("date1msg").innerHTML="<font size='1px' color='#ff0033'>Enter the Date</font>"
		 document.getElementById("date1").style.borderColor="red";
		document.form1.date1.focus();
		return false;
		}
	//6

	//7
	if(source=="")
		{
		//document.getElementById("sourcemsg").innerHTML="<font size='1px' color='#ff0033'>Enter the Source</font>"
		 document.getElementById("source").style.borderColor="red";
		document.form1.source.focus();
		return false;
		}
	//8
	if(status=="")
		{
		//document.getElementById("statusmsg").innerHTML="<font size='1px' color='#ff0033'>Enter the Status of Customer</font>"
		 document.getElementById("status").style.borderColor="red";
		document.form1.status.focus();
		return false;
		}
}