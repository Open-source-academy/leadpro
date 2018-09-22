<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.UserConnection"%>
<%@page import="java.sql.ResultSet"%>
<%
String prefix=session.getAttribute("prefix").toString();
Connection con;
ResultSet rs; 
con=UserConnection.userConnect();
rs=con.createStatement().executeQuery("SELECT id,name,MobileNo,address,email,product FROM "+prefix+"PURCHASETABLE order by id desc");
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
<head><link rel="shortcut icon" href="images/logo.ico"/>
<script  type="text/JavaScript" src="JavaScript/RedirectForSMS.js"></script>
<script language="javascript" src="JavaScript/ChkBox.js"></script>
<script  type="text/JavaScript" src="JavaScript/SendMailRedirect.js"></script>

<link rel="stylesheet" type="text/css" href="css/bodyBackGround.css" media="screen" /><link rel="stylesheet" type="text/css" href="css/pagehead.css" media="screen" />

<title>Lead Pro:Closure </title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="javascript" type="text/javascript" src="JavaScript/ClosureSearchRedirect.js"></script>
</head>
<body bgcolor="#FFFFFF" class="back" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('images/layout_button_03.gif','images/layout_button_05.gif')">
<!-- Save for Web Slices (new home.psd) -->
<table width="1001" height="713" border="0" align="center" cellpadding="0" cellspacing="0" id="Table_01" 
bgcolor="#FFFFFF">
	<tr>
		<td colspan="5">
			<img src="images/layout_01.png" width="1000" height="155" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="155" alt=""></td>
	</tr>
	<tr>
		<td rowspan="3">
			</td>
		<td rowspan="2"><a href="UserHome.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','images/layout_button_03.gif',1)"><img src="images/layout_03.gif" name="Image15" width="181" height="103" border="0" alt="Back to HOME"></a></td>
		<td rowspan="2">
			</td>
		<td><a href="UserLogOut.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image16','','images/layout_button_05.gif',1)"><img src="images/layout_05.gif" name="Image16" width="106" height="40" border="0"></a></td>
		<td rowspan="3">
			
		<td>
			<img src="images/spacer.gif" width="1" height="40" alt="2"></td>
	</tr>
	<tr>
		<td rowspan="2">
			</td>
		<td>
			<img src="images/spacer.gif" width="1" height="63" alt="4"></td>
	</tr>
	<tr>
		<td colspan="2">
			<img src="images/layout_08.gif" width="752" height="7" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="7" alt=""></td>
	</tr>
	<tr>
		<td colspan="5" valign="top">
<table align="center">
<tr align="center"><td class="pagehead ">Closure<td></tr>
<tr><td>&nbsp;</td></tr>
</table>
		<form action="ClosureSearch.jsp" name="form1" onsubmit="return Search()">
		<table align="center" bordercolor="#819FF7" border="1" cellspacing=".3" width ="900">
		<tr><td align="left" colspan="3"><input  type="button" Value="Mail" onClick="SendMails1();"/><input  type="button" Value="SMS" onClick="SendSMS();"/></td><td colspan="1" align="right"> Search Customer  </td>
<td colspan="1"><input type="text" name="search" placeholder="PhoneNo/Name of the Customer" size="22" id="msg"> </td>
<td colspan="2"><input type="button" value="Search" onclick="return ClosereDirectSearch();">  </td>
</tr>
<tr bgcolor="#819FF7" align="center">
<td colspan="2"><input type="checkbox" value="on" name="allbox" onclick="return checkAll();"/></td><td>NAME</td><td>MOBILE</td><td>ADDRESS </td><td>EMAIL</td><td>PRODUCT</td>
</tr>
<%while(rs.next()){ %>
<tr>
<td><input TYPE=checkbox name=mailid VALUE="<%=rs.getString(5)%>"></td><td><input TYPE=checkbox name=mobile VALUE="<%=rs.getString(3)%>"></td><TD valign="top"><%=rs.getString(2) %></TD><TD valign="top"><%=rs.getString(3) %></TD><TD valign="top"><textarea rows="4" cols="15"><%=rs.getString(4) %></textarea></TD><TD  valign="top"><%=rs.getString(5) %></TD><TD valign="top"><%=rs.getString(6) %></TD>
</tr>
<%} %>
</table>
	</form>	
		</td>
		<td>
			<img src="images/spacer.gif" width="1" height="364" alt=""></td>
	</tr>
	<tr>
		<td colspan="5" bgcolor="#4E82BB"><br><br><br><br>
			</td>
		<td>
			<img src="images/spacer.gif" width="1" height="84" alt=""></td>
	</tr>
</table>
<!-- End Save for Web Slices -->
</body>
</html>
<%}%>