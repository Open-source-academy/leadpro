<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="service.EmailList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.UserConnection"%>

<%! String[] email; %>
<%!ResultSet rs; %>
<%!ResultSet rs1; %>
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
</script>


<link rel="stylesheet" type="text/css" href="css/bodyBackGround.css" media="screen" /><link rel="stylesheet" type="text/css" href="css/pagehead.css" media="screen" />
<style>
#mailconf{
visibility: hidden;
}

</style>
<title>Lead Pro:Closure </title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="javascript" type="text/javascript" src="JavaScript/ClosureSearchRedirect.js">
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

<% 

String prefix=session.getAttribute("prefix").toString();

String mails="";
String confMail="";
String mailPass="";
  email = request.getParameterValues("mailid");
  ArrayList<String> mailId;
  mailId= EmailList.mailList(email);
  Iterator<String> ii=mailId.iterator();
  while(ii.hasNext())
  {
  mails=mails+ii.next()+";";
  } 
  
%>
<%
Connection con;
con=UserConnection.userConnect();
rs=con.createStatement().executeQuery("select temp_name,temp from "+prefix+"mailTemp");

rs1=con.createStatement().executeQuery("select mail,password from "+prefix+"mailTable");

while(rs1.next())
{
	confMail=rs1.getString(1);
	mailPass=rs1.getString(2);
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
<tr align="center"><td class="pagehead ">Mail Service</td></tr>
<tr><td>&nbsp;</td></tr>
</table>
		<!-- Work here  -->	
		<form name=form1 action="custMailBean.jsp" onSubmit="return mailBoxValidate()">
<table align="center">
<tr>
<td valign="top">Email List</td><td><textarea name="email" id="email" rows="4" cols="50"><%=mails %></textarea></td>
</tr>
<tr>
<td>Subject</td><td><input type="text" id="sub" name="sub" size="80"/></td></tr>
<tr>
<td>Message</td><td><div id="temp"></div>
<select name=mail  onchange="addtext();">
<option value="">Select Template</option>
<%while(rs.next()){ %>
<option value="<%=rs.getString(2) %>"><%=rs.getString(1) %></option><%} %>
</select>
</td>
</tr>
<tr>

<td colspan="2"><div id="mailconf"><input type="text" value="<%=confMail %>" name="custmail"><input type="text" value="<%=mailPass%>" name="pass"></div></td>

</tr>
<tr>
<td colspan="2"><textarea rows="10" cols="80" id="msg" name="msg"  ></textarea></td>
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