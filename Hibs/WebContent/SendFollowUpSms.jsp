<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="service.EmailList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.UserConnection"%>
<%@page import="service.MobileList"%>
<%@page import="dao.DbConnection"%>

<%!Connection mainCon;%>
<%! String[] phone; %>
<%!ResultSet rs; %>
<%!ResultSet rs4;%>
<%
mainCon=DbConnection.connect();
String smsNo=" select user,password,sender,priority,stype from smsTable";
rs4=mainCon.createStatement().executeQuery(smsNo);
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

<script  type="text/JavaScript" src="JavaScript/CustMailBoxValidation.js"></script>
<script language="javascript" type="text/javascript">
function addtext()
{
var newtext = form1.mail.options[form1.mail.selectedIndex].value;

document.form1.msg.value = newtext ;
}
function imposeMaxLength(Object, MaxLen)
{
  return (Object.value.length <= MaxLen);
}

function smsChk()
{
var text=document.smsForm.text.value;
var no=document.smsForm.phone.value;

if(no=="")
		{
		
		
		 document.getElementById("phone").style.borderColor="red";
		 return false;
		}

if(text=="")
		{
		
		
		 document.getElementById("text").style.borderColor="red";
		 return false;
		}
}

</script>


<link rel="stylesheet" type="text/css" href="css/bodyBackGround.css" media="screen" /><link rel="stylesheet" type="text/css" href="css/pagehead.css" media="screen" />

<title>Lead Pro:Closure </title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

</head>

<% 
String nos="";
  phone = request.getParameterValues("mobile");
  ArrayList<String> phoneNo;
  phoneNo=MobileList.getMobile(phone);
  Iterator<String> ii=phoneNo.iterator();
  while(ii.hasNext())
  {
  nos=nos+ii.next()+",";
  } 
  
%>

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
			<img src="images/layout_02.gif" width="71" height="110" alt=""></td>
		<td rowspan="2"><a href="UserHome.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','images/layout_button_03.gif',1)"><img src="images/layout_03.gif" name="Image15" width="181" height="103" border="0" alt="Back to HOME"></a></td>
		<td rowspan="2">
			<img src="images/layout_04.gif" width="571" height="103" alt=""></td>
		<td><a href="UserLogOut.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image16','','images/layout_button_05.gif',1)"><img src="images/layout_05.gif" name="Image16" width="106" height="40" border="0"></a></td>
		<td rowspan="3">
			<img src="images/layout_06.gif" width="71" height="110" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="40" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2">
			<img src="images/layout_07.png" width="106" height="70" alt=""></td>
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
<table align="center">
<tr align="center"><td class="pagehead ">SMS Service</td></tr>
<tr><td>&nbsp;</td></tr>
</table>
		<!-- Work here  -->	
		<form name="smsForm" action="http://smsprice.textilemarketindia.com/api/sendmsg.php" onsubmit="return smsChk()" >

<table align="center">
<tr>

<%
while(rs4.next())
{
%>
<td>
<input type="hidden" name="user" value="<%=rs4.getString(1)%>"/>
<input type="hidden" name="pass" value="<%=rs4.getString(2)%>" />
<input type="hidden" name="sender" value="<%=rs4.getString(3)%>"/>
<input type="hidden" name="priority" value="<%=rs4.getString(4)%>"/>
<input type="hidden" name="stype" value="<%=rs4.getString(5)%>"/>

</td>
<%}%>

</tr>
<tr>
<td valign="top">Phone No List</td><td><textarea name="phone" id="phone" rows="4" cols="40"><%=nos %></textarea></td>
</tr>


<tr>
<td colspan="2" align="right"><textarea rows="6" cols="40" id="text" name="text"  onkeypress="return imposeMaxLength(this, 140);" ></textarea></td>
</tr>
<tr><td colspan="2" align="right"><input type="submit" value="Send"/></td></tr>
</table>
</form>
<!-- Work end  -->
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