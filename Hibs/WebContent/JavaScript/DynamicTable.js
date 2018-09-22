function CreateTextbox()
{
	var product=document.form1.product.value; // span=productmsg
	var no=document.form1.no.value;  // id =fieldmsg
if(product=="")
	{
	document.getElementById("productmsg").innerHTML="<font size='1px' color='#ff0033'>Enter the Product Name</font>"
		 document.getElementById("product").style.borderColor="red";
	document.getElementById("msg1").style.visibility = "hidden";
		document.regForm.product.focus();
	}

if(no=="")
	{
	document.getElementById("fieldmsg").innerHTML="<font size='1px' color='#ff0033'>Enter no fields</font>"
		 document.getElementById("no").style.borderColor="red";
	document.getElementById("msg2").style.visibility = "hidden";
		document.regForm.no.focus();
	}
else
	{
for ( i=0;i<no;i++)
{
createTextbox.innerHTML = createTextbox.innerHTML +"<tr><td><input type=text name='mytext'+i/></td><td><SELECT name='element'+i><OPTION value='VarChar(50)'>Text</OPTION><OPTION value='integer'>Number</OPTION><OPTION value='date'>Date</OPTION><OPTION value='Double'>Double</OPTION></SELECT></br></td></tr>"
}
}
}