<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%!Connection con; %>
<%!ResultSet rs; %>
<%!String product; %>
<%@ page import="dao.UserConnection" %>

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
<title>Lead Pro:Product Details</title>
<link rel="stylesheet" type="text/css" href="css/bodyBackGround.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/pagehead.css" media="screen" />
<script language="javascript" type="text/javascript" src="JavaScript/ProductDetailsAjax.js">  </script>
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
<body bgcolor="#FFFFFF" class="back" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('images/layout_button_03.gif','images/layout_button_05.gif')">
<!-- Save for Web Slices (new home.psd) -->
<table width="1001" height="713" border="0" align="center" cellpadding="0" cellspacing="0" id="Table_01" bgcolor="#FFFFFF">
	<tr>
		<td colspan="5">
			<img src="images/layout_01.png" width="1000" height="155" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="155" alt=""></td>
	</tr>
	<tr>
		<td rowspan="3">
			</td>
		<td rowspan="2"><a href="UserHome.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','images/layout_button_03.gif',1)"><img src="images/layout_03.gif" name="Image15" width="181" height="103" border="0"></a></td>
		<td rowspan="2">
			</td>
		<td><a href="UserLogOut.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image16','','images/layout_button_05.gif',1)"><img src="images/layout_05.gif" name="Image16" width="106" height="40" border="0"></a></td>
		<td rowspan="3">
			</td>
		<td>
			</td>
	</tr>
	<tr>
		<td rowspan="2">
			</td>
		<td>
			<img src="images/spacer.gif" width="1" height="63" alt=""></td>
	</tr>
	<tr>
		<td colspan="2">
			<img src="images/layout_08.gif" width="752" height="7" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="7" alt=""></td>
	</tr>
	<tr>
		<td colspan="5" valign="top">
		
		<table align="center"><tr align="center"><td colspan="2"class="pagehead ">Product Details</td></tr><tr><td>&nbsp;</td></tr>
<tr><td>Select the Product:</td><td>
<select  onchange="showState(this.value)" align="center">
<option value="0">select</option>
<% String prefix=session.getAttribute("prefix").toString();
int cut=prefix.length();
System.out.print("my prefix##########################"+prefix);
con=UserConnection.userConnect();
String getUserTables="select tableLabel,tableName from "+prefix+"userTablesDetails";
rs=con.createStatement().executeQuery(getUserTables);
while(rs.next())
{
product=rs.getString(1);
						if(product.equalsIgnoreCase("source")||product.equalsIgnoreCase("mailTable")||product.equalsIgnoreCase("mailTemp"))
						{
						}
						else{
%>
<option value=<%=rs.getString(2) %>><%=rs.getString(1) %></option>
<%
}}
%>
</select>
</td></tr>

</table><table align="center">
<tr><td><div id="list">
</div></td> </tr>
<tr><td> <input type="image" src="images/back.png" onclick="window.location='UserHome.jsp'" width="75" height="30"></td></tr>
</table>
		
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