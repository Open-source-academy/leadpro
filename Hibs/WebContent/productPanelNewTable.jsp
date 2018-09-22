<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<script type="text/javascript" src="JavaScript/DynamicTable.js"></script>
<script type="text/javascript" src="JavaScript/DynamicTableSaveValidate.js"></script>
<link rel="shortcut icon" href="images/logo.ico"/>
<title>Lead Pro:Admin </title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style1 {
	font-size: 12pt;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
	/* color: #4E82BB; */
}
-->
</style>
</head>
<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  bgcolor="#CCCCCC">
<!-- Save for Web Slices (Control Panel.psd) -->
<table width="1000" height="258" border="0" align="center" cellpadding="0" cellspacing="0" id="Table_01" bgcolor="white" >
	<tr>
		<td colspan="5">
			<img height="155" width="1000" src="images/head.png" alt=""></td>
	</tr>
	<tr>
		<td width="70" bgcolor="#FFFFF">&nbsp;</td>
	    <td width="196"><table width="100%" border="0">
          <tr bgcolor="4e82bb">
            <td height="28" colspan="3" align="center"><font color="FFFFFF"><b>Table List</b></font></td>
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
            <td  width="70%">&nbsp;&nbsp;<%=rs.getString(1)%></td>
            <td width="15%"><a href="editTable.jsp?table=<%=rs.getString(2) %>"><img height="18" width="18" src="images/view.png" alt="View "></a> <br></td><!--  table name loop -->
            <td width="15%"><a href="addDataToTable.jsp?table=<%=rs.getString(2) %>"><img height="18" width="18" src="images/edit.png" alt="Edit "></a></td>
          </tr>
          <%} %>
          <tr bgcolor="4e82bb">
            <td colspan="3" align="right"><b><a href="#"><font color="FFFFFF"><b>Add More Tables>></b></font></a> </b></td>
          </tr>
          
        </table>	      </td>
	    <td width="12">&nbsp;</td>
	    <td width="650" valign="top">
	    
	    
	    <form name="form1" action="ProductMasterCreation.jsp" method="get" onsubmit="return validate()">
	    <table width="638" border="0" height="167">
          <tr >
            <td></td>
            <td colspan="2" align="right"><a href="Lead_pro_Controlpanel.html"><img src="images/controlpanelback.png" style="width: 72px; height: 61px;" width="72" height="61"/></a></td>
          </tr>
<tr valign="top">
<td>Product name:</td><td colspan="2"><input type="text" name="product" id="product"/><span id="productmsg"></span><span id="msg1"><font size="1pt">&nbsp;&nbsp;&nbsp;&nbsp; *Enter the product Name</font></span> </td></tr>
<tr><td>
Enter No of Fields:</td><td colspan="2"><input type="text" name="no" id="no"/><span id="fieldmsg"></span><span id="msg2"><font size="1pt">&nbsp;&nbsp;&nbsp;&nbsp; *Enter no of fields</font></span></td></tr>
<tr valign="top"><td></td>
<td colspan="2"><input type="button" value="create" onClick="CreateTextbox()"><input type="submit" value="Save" ></td></tr>
         <tr >
<td colspan="3"><div id="createTextbox"></div></td><td><div id="dropBox"></div></td>
</tr>
        </table>
        </form>
        </td>
	    <td width="72" bgcolor="#FFFFF">&nbsp;</td>
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