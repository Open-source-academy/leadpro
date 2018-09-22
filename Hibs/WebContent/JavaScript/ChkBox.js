function checkAll()
{
var len=document.form1.elements.length;
	for (var i=0;i<document.form1.elements.length;i++)
	{
		var e=document.forms[0].elements[i];
		if ((e.name != 'allbox') && (e.type=='checkbox'))
		{
			e.checked=document.forms[0].allbox.checked;
		}
	}
}