function SendSMS()
{
	var chks = document.getElementsByName('mobile');

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
		alert("Please select atleast one Customer.");
		return false;
		}
		else
			{
			document.form1.action="SendFollowUpSms.jsp";
		document.form1.submit();
	
			}
}