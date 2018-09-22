<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.UserConnection"%>
<%
Connection con;
ResultSet rs;
ResultSet rs1;
ResultSet rs2;

String product="";

con=UserConnection.userConnect();
rs=con.createStatement().executeQuery("show tables");
 %>
<html>
<head>
<script language="javascript" type="text/javascript" src="JavaScript/ReportAjaxPage.js">  </script> 
</head>
<body>
<form name="form1">
<table align="center">
<tr>
<td>
<select name="productlist" onchange="showState(this.value)">
<option value="0">select</option>
<%
while(rs.next()){
	product=rs.getString(1);
						if(product.equalsIgnoreCase("enquireyDetails")||product.equalsIgnoreCase("purchasetable")||product.equalsIgnoreCase("trash")||product.equalsIgnoreCase("custupdation")||product.equalsIgnoreCase("adminpass"))
						{
						}
						else{
							%>
							<option value=<%=rs.getString(1)%>><%=rs.getString(1)%></option>
							<%
							}
				}
 %>
</select></td>

<td><div id="list">*</div></td>

<td><input type="text" id="datemsg" name="date" placeholder="yyyy-mm-dd"/></td>
<td>
<select name="deal" id="dealmsg">
<option value="enquireydetails" >Leads</option>
<option value="purchasetable">Closure</option>
</select>
</td>
<td>
<img alt="" src="images/searchButton.png" width="75" height="30" > 
</td>
<td>
<a href='Lead_pro_Controlpanel.html'><img src="images/back.png" alt="Submit the Updation" width="75" height="30"></a>
</td>

</tr>
<tr><td></td></tr>
</table>
</form>
</body>
</html>