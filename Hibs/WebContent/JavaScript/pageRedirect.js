function search1()

		{
	var key=document.form1.search.value;
	if(key=="")
		{
		document.getElementById("msg").style.borderColor="red";
		document.form1.search.focus();
		return false;
		}
	else
		{
		document.form1.action="FollowUpSearch.jsp";
		document.form1.submit();
		}

		}
