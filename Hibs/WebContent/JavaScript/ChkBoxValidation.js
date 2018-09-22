function checkAll()
{
var len=document.mail.elements.length;
alert(len);
	for (var i=0;i<document.mail.elements.length;i++)
	{
		var e=document.forms[0].elements[i];
		if ((e.name != 'allbox') && (e.type=='checkbox'))
		{
			e.checked=document.forms[0].allbox.checked;
		}
	}
}