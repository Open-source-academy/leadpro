<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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
<title>Lead Pro: User Home</title>

<link rel="stylesheet" type="text/css" href="css/bodyBackGround.css" media="screen" />



</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('images/button_04.gif')" class="back">
<!-- Save for Web Slices (Control Panel.psd) -->
<table width="1000" height="714" border="0" align="center" cellpadding="0" cellspacing="0" id="Table_01" bgcolor="#FFFFFF">
	<tr>
		<td colspan="8">
			<img src="images/layout_01.png" width="1000" height="155" alt=""></td>
	</tr>
	<tr>
		<td rowspan="4" bgcolor="white">
			</td>
		<td colspan="5" rowspan="2">
			<img src="images/Control-Panel_03.gif" width="740" height="110" alt=""></td>
		<td><a href="UserLogOut.jsp" ><img src="images/layout_05.gif" name="Image23" width="90" height="40" border="0"></a></td>
		<td rowspan="4"  bgcolor="white">
			</td>
	</tr>
	<tr>
		<td  bgcolor="white">
			</td>
	</tr>
	<tr>
		<td rowspan="2" bgcolor="white">
			</td>
		<td>
			<img src="images/Control-Panel_08.gif" alt="" width="155" height="158" border="0" usemap="#Map"></td>
		<td>
			<img src="images/Control-Panel_09.gif" alt="" width="190" height="158" border="0" usemap="#Map2"></td>
		<td>
			<img src="images/Control-Panel_10.gif" alt="" width="181" height="158" border="0" usemap="#Map3"></td>
		<td colspan="2" rowspan="2" bgcolor="white">
			</td>
	</tr>
	<tr>
		<td>
			<img src="images/Control-Panel_12.gif" alt="" width="155" height="206" border="0" usemap="#Map4"></td>
		<td>
			<img src="images/Control-Panel_13.gif" alt="" width="190" height="206" border="0" usemap="#Map5"></td>
		<td>
			<img src="images/Control-Panel_14.gif" alt="" width="181" height="206" border="0" usemap="#Map6"></td>
	</tr>
	<tr>
		<td colspan="8" bgcolor="#4E82BB">
		<br><br><br><br>
			</td>
	</tr>
	<tr>
		<td>
			<img src="images/spacer.gif" width="83" height="1" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="189" height="1" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="155" height="1" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="190" height="1" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="181" height="1" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="25" height="1" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="90" height="1" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="87" height="1" alt=""></td>
	</tr>
</table>
<!-- End Save for Web Slices -->

<map name="Map"><area shape="rect" coords="4,6,129,141" href="ProductDetailTable.jsp"></map>
<map name="Map2"><area shape="rect" coords="42,4,154,140" href="enqiry.jsp"></map>
<map name="Map3">
<area shape="rect" coords="50,4,155,141" href="Closure.jsp">
</map>
<map name="Map4"><area shape="rect" coords="1,22,139,154" href="support.jsp"></map>
<map name="Map5"><area shape="rect" coords="43,25,150,158" href="FollowUp.jsp"></map>
<map name="Map6"><area shape="rect" coords="40,27,146,156" href="trash.jsp"></map></body>
</html>

<%}%>