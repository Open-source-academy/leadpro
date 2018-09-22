function SendMails1()
{
	var chks = document.getElementsByName('mailid');

			var hasChecked = false;
			
			for (var i = 0; i < chks.length; i++)
			{
				if (chks[i].checked)
				{
					hasChecked = true;
					break;
				}
			
			}
			
		if (hasChecked == false)
		{
		alert("Please select at atleast one Customer.");
		return false;
		}
		else
			{
			document.form1.action="SendFollowUpMail.jsp";
		document.form1.submit();
	
			}
	//	return true;
	
	
	
	
}
