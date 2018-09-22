<%
if(session.getAttribute("admin")==null)
{
	response.sendRedirect("index.jsp");
	
}
else 
{
%>

<html>
<head>
<script src="JavaScript/chkPass.js"></script>
<link rel="shortcut icon" href="images/logo.ico"/>
<title>Lead Pro:Admin </title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('images/Lead-pro-but_04.gif','images/Control_Panel-layout_but_04.gif')">
<!-- Save for Web Slices (new Control Panel layout.psd) -->
<table width="1000" height="368" border="0" align="center" cellpadding="0" cellspacing="0" id="Table_01">
	<tr>
		<td height="155" colspan="4">
			<img src="images/leadpro_layout_01.png" width="1000" height="155" alt=""></td>
	</tr>
	<tr>
		<td width="72" rowspan="3" bgcolor="#F5F4F4">&nbsp;</td>
		<td width="721" rowspan="2">
			<img src="images/leadpro_layout_03.png" alt="" width="721" height="110" border="0" usemap="#Map"></td>
		<td width="137"><a href="ControlPanalLogout.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','images/Control_Panel-layout_but_04.gif',1)"><img src="images/leadpro_layout_04.gif" name="Image5" width="137" height="38" border="0"></a><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','images/Lead-pro-but_04.gif',1)"></a></td>
		<td width="70" rowspan="3" bgcolor="#F5F4F4">&nbsp;</td>
	</tr>
	<tr>
		<td>
			<img src="images/leadpro_layout_06.png" width="137" height="72" alt=""></td>
	</tr>
	<tr>
		<td colspan="2" valign="top" bgcolor="#FFFFFF">
		<!---Working Place--->
<form name="form1" action="adminResetPassBean.jsp" onsubmit="return validate()">
<table align="center" width=50%>
<tr>
</tr>
<tr>
<td>Enter old Password</td><td>:</td><td><input type="text" id="oldpass" name="oldpass" placeholder="Enter old Password"/></td><td width="25%"><div id="old"><font size='1px' color='#ff0033'>*</font></div></td>
</tr>
<tr>
<td>Enter New Password</td><td>:</td><td><input type="password" id="newpass" name="newpass" placeholder="Enter New Password"/></td><td><div id="new1"><font size='1px' color='#ff0033'>*</font></div></td>
</tr>
<tr>
<td>Conform Password</td><td>:</td><td><input type="password" id="newpass1" name="newpass1" placeholder="Conform Password"/></td><td><div id="new2"><font size='1px' color='#ff0033'>*</font></div></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
<td align="right"><input type="image" alt="Save" src="images/save.png" width="75" height="30"></td><td></td><td><a href="Lead_pro_Controlpanel.html"><img src="images/back.png" alt="Back to Control Panel" width="75" height="30" ></a></td><td></td>
</tr>
</table>

</form>

<!-- work end-->
		&nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<img src="images/leadpro_layout_08.png" width="1000" height="84" alt=""></td>
	</tr>
</table>
<!-- End Save for Web Slices -->

<map name="Map"><area shape="rect" coords="20,13,253,94" href="Lead_pro_Controlpanel.html"></map></body>
</html>
<%}%>