<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@page import="java.sql.Connection"%>
<%@page import="dao.UserConnection"%>
<%

String prefix=session.getAttribute("prefix").toString();

ResultSet rs3;
Connection con;
con=UserConnection.userConnect();
rs3=con.createStatement().executeQuery("select id,name,address,mobileno,email,dealdate,product,status from  "+prefix+"enquireydetails  order by id desc");
 %>
 
 <%
if(session.getAttribute("username")==null)
{
	response.sendRedirect("index.jsp");
	
}
else 
{
%>
 
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bodyBackGround.css" media="screen" />
<link rel="shortcut icon" href="images/logo.ico"/><link rel="stylesheet" type="text/css" href="css/pagehead.css" media="screen" />
<title>Lead Pro:Follow Up</title>
<script  type="text/JavaScript" src="JavaScript/pageRedirect.js"></script>
<script  type="text/JavaScript" src="JavaScript/RedirectForSMS.js"></script>
<script language="javascript" src="JavaScript/ChkBox.js"></script>
<script  type="text/JavaScript" src="JavaScript/SendMailRedirect.js"></script>

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
<body class="back" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('images/layout_button_03.gif','images/layout_button_05.gif')">
<!-- Save for Web Slices (new home.psd) -->
<table width="1001" bgcolor="#FFFFFF" height="713" border="0" align="center" cellpadding="0" cellspacing="0" id="Table_01">
	<tr>
		<td colspan="5">
			<img src="images/layout_01.png" width="1000" height="155" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="155" alt=""></td>
	</tr>
	<tr>
		<td rowspan="3">
			</td>
		<td rowspan="2"><a href="UserHome.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','images/layout_button_03.gif',1)"><img src="images/layout_03.gif" name="Image15" alt="Back to HOME" width="181" height="103" border="0"></a></td>
		<td rowspan="2">
			</td>
		<td><a href="UserLogOut.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image16','','images/layout_button_05.gif',1)"><img src="images/layout_05.gif" name="Image16" width="106" height="40" border="0"></a></td>
		<td rowspan="3">
			</td>
		<td>
			<img src="images/spacer.gif" width="1" height="40" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2">
			</td>
		<td>
			<img src="images/spacer.gif" width="1" height="63" alt="5"></td>
	</tr>
	<tr>
		<td colspan="2">
			<img src="images/layout_08.gif" width="752" height="7" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="7" alt=""></td>
	</tr>
	<tr>
		<td colspan="5" valign="top"><table align="center">
<tr align="center"><td class="pagehead ">Follow Up</td></tr>
<tr><td>&nbsp;</td></tr>
</table>
	<form action="FollowUpSearch.jsp" name="form1">	
	<table align="center" border ="1" bordercolor="#819FF7" cellspacing=".3" width="900">
	<tr><td align="left" colspan="3"><input  type="button" Value="Mail" onClick="SendMails1();"/><input  type="button" Value="SMS" onClick="SendSMS();"/></td><td colspan="2" align="right"> Search Customer  </td>
<td colspan="2"><input type="text" id="msg" name="search" placeholder="PhoneNo/Name of the Customer" size="32"> </td>
<td colspan="1"><input type="button" name="one" value="Search" onClick="search1();" /> </td>
</tr>
	<tr bgcolor="#819FF7" >
		<td colspan="2" align="center"><input type="checkbox" value="on" name="allbox" onclick="return checkAll();"/></td><th width="19%" >Name</th><th>Mobile No</th><th width="19%">Email</th><th>Date<br/><font size="1">yyyy-mm-dd</font></th><th  width="15%">Product</th><th  width="15%">Status</th><th colspan="4"></th>
	</tr>
	<% 
	
	while(rs3.next())
	{%>
	<tr>
	<td><input TYPE=checkbox name=mailid VALUE=<%=rs3.getString(5)%>></td>
	<td><input TYPE=checkbox name=mobile VALUE=<%=rs3.getString(4)%>></td>
	<th ><%=rs3.getString(2) %></th><th><%=rs3.getString(4) %></th><th><%=rs3.getString(5) %></th><th><%=rs3.getString(6) %></th><th><%=rs3.getString(7) %></th><th><%=rs3.getString(8) %></th>
	<th><a href="moveToSales.jsp?id=<%=rs3.getString(1)%>"><img height="18" width="18" src="images/sales.png" alt="Move to Sales "></a></th>
	<td><a href="EnqEdit.jsp?id=<%=rs3.getString(1)%>"><img height="18" width="18" src="images/follow.png" alt="Follow Up"></a></td>
	<td><a href="EnqTrash.jsp?id=<%=rs3.getString(1)%>" onclick="return move();"><img height="18" width="18" src="images/delete.png" alt="Move Trash "></a></td>
	<td><a href="EnqDel.jsp?id=<%=rs3.getString(1)%>" onclick="return deleteEnq();"><img height="18" width="18" src="images/delete.jpg" alt="Delete Your Entry"></a></td>

	</tr>
	<%}
	%>
	
	</table></form>
		
		</td>
		<td>
			<img src="images/spacer.gif" width="1" height="364" alt=""></td>
	</tr>
	<tr>
		<td colspan="5" bgcolor="#4E82BB"><br><br><br><br>
			</td><td>
			<img src="images/spacer.gif" width="1" height="84" alt=""></td>
	</tr>
</table>
<!-- End Save for Web Slices -->
</body>
</html>
<%}%>