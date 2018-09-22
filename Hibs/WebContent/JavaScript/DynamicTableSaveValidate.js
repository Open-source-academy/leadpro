function validate()
{
	var product=document.form1.product.value; // span=productmsg
	var no=document.form1.no.value;  // id =fieldmsg
	
if(product=="" || no=="")
	{
	alert("Create table and fields before you save..!!");
	return false;
	}

}