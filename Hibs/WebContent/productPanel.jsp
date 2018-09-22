<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="dao.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.UserConnection"%>
<%!String product; %>
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
<title>Control Panel</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="css/bodyBackGround.css" media="screen" />

<style type="text/css">
<!--
.style1 {
	font-size: 12pt;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
	color: #4E82BB;
}
-->
</style>
</head>
<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#CCCCCC">
<!-- Save for Web Slices (Control Panel.psd) -->
<table  width="1000" height="258" border="0" align="center" cellpadding="0" cellspacing="0" id="Table_01" bgcolor="white">
	<tr>
		<td colspan="5">
			<img height="155" width="1000" src="images/head.png" alt=""></td>
	</tr>
	<tr>
		<td width="70" bgcolor="#F6F5F4">&nbsp;</td>
	    <td width="196">
	    
	    <table width="100%" border="0">
          <tr bgcolor="4e82bb">
            <td height="28" colspan="3"align="center">User Tables</td>
          </tr>
          <%
          
          		String prefix=session.getAttribute("prefix").toString();
		String getUserTables="select tableLabel,tableName from "+prefix+"userTablesDetails";
		int cut=prefix.length();

				Connection con=UserConnection.userConnect();
				ResultSet rs= con.createStatement().executeQuery(getUserTables);
				while(rs.next()){
				%>
		
          <tr bgcolor="#999999">
            <td  width="70%">&nbsp;&nbsp;<%=rs.getString(1) %></td>
            <td width="15%"><a href="editTable.jsp?table=<%=rs.getString(2) %>"><img height="18" width="18" src="images/view.png" alt="View "></a> <br></td><!--  table name loop -->
            <td width="15%"><a href="addDataToTable.jsp?table=<%=rs.getString(2) %>"><img height="18" width="18" src="images/edit.png" alt="Edit "></a></td>
          </tr>
          <%} %>
          <tr bgcolor="4e82bb">
            <td colspan="3" align="right"><b><a href="productPanelNewTable.jsp">Add Your Products</a> </b></td>
          </tr>
        </table>
        </td>
	    <td width="12">&nbsp;</td>
	    <td width="650" valign="top"><table width="100%" border="0" >
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td align="right"><a href="Lead_pro_Controlpanel.html"><img src="images/controlpanelback.png"/></a></td>
          </tr>
          <tr>
            <td colspan="3">&nbsp;<strong style="color: rgb(0, 0, 0); font-family: Arial,Helvetica,sans; font-size: 11px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 14px; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;">Lorem Ipsum</strong><span style="color: rgb(0, 0, 0); font-family: Arial,Helvetica,sans; font-size: 11px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 14px; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; display: inline ! important; float: none;"><span class="Apple-converted-space">&nbsp;</span>is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;Contents Under Construction...!!<br></td>
          </tr>
        </table></td>
	    <td width="72" bgcolor="#F6F5F4">&nbsp;</td>
	</tr>
	
	
	
	<tr>
		<td colspan="5" bgcolor="#4E82BB"><br><br><br><br>
			</td>
	</tr>
</table>
<!-- End Save for Web Slices -->
</body>
</html>
<%}%>