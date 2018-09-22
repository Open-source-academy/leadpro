<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.UserConnection"%>
<%@page import="dao.DbConnection"%>
<%!Connection con; %>
<%!Connection mainCon;%>
<%!ResultSet rs; %>
<%!ResultSet rs1; %>
<%!ResultSet rs2; %>
<%!ResultSet rs3;%>
<%!ResultSet rs4;%>
<%!ResultSet rs5;%>

<html>
<head><link rel="shortcut icon" href="images/logo.ico"/>
<title>Lead Pro:Customer Status Report </title>
<script src="JavaScript/mailBoxValidation.js"></script>
<link rel="stylesheet" type="text/css" href="css/pagehead.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/bodyBackGround.css" media="screen" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <link rel="stylesheet" href="css/epane.css" />
    <link rel="stylesheet" href="css/smsPane.css" />
    
  <script language="javascript" type="text/javascript">
function imposeMaxLength(Object, MaxLen)
{
  return (Object.value.length <= MaxLen);
}

</script>  

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<style>
#mailconf{
visibility: hidden;
}

</style>

<script>
$(function() {
        $( "#draggable" ).draggable();
        $("#smsPanel").draggable();
        
	$("#mail").click(function(){
		$("#draggable").toggle();
		$("#smsPanel").hide();
		});
		$("#sms").click(function(){
		$("#smsPanel").toggle();
		$("#draggable").hide();
		});
	$("#cls").click(function(){
		$("#draggable").hide();
	});
	$("#closeP").click(function(){
		$("#smsPanel").hide();
	});
	
    });
    </script>
    
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
String id=request.getParameter("id");


String prefix=session.getAttribute("prefix").toString();

String confMail="";
String mailPass="";

con=UserConnection.userConnect();
mainCon= DbConnection.connect();

 String smsDet="select user,password,sender,priority,stype from smsTable";
String sql=" select id,name ,mobileno,email,address,status from "+prefix+"enquireydetails where id="+id;
String join="select "+prefix+"custupdation.UPDATEDATE ,"+prefix+"custupdation.updation,"+prefix+"custupdation.conMode from "+prefix+"custupdation where id="+id;
String emailselect="select email from "+prefix+"enquireydetails where id="+id;
String phone="select mobileno from "+prefix+"enquireydetails where id="+id;
String chkMail="select mail,password from "+prefix+"mailTable";

rs=con.createStatement().executeQuery(sql);
rs1=con.createStatement().executeQuery(join);
rs2=con.createStatement().executeQuery(emailselect);
rs3=con.createStatement().executeQuery(phone);

rs4=mainCon.createStatement().executeQuery(smsDet);

rs5=con.createStatement().executeQuery(chkMail);

while(rs5.next())
{
	confMail=rs5.getString(1);
	mailPass=rs5.getString(2);
}
%>


<body class="back" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('images/layout_button_03.gif','images/layout_button_05.gif')">
<!-- Save for Web Slices (new home.psd) -->
<table  bgcolor="#FFFFFF" width="1001" height="713" border="0" align="center" cellpadding="0" cellspacing="0" id="Table_01">
	<tr>
		<td colspan="5">
			<img src="images/layout_01.png" width="1000" height="155" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="155" alt=""></td>
	</tr>
	<tr>
		<td rowspan="3">
			<img src="images/layout_02.gif" width="71" height="110" alt=""></td>
		<td rowspan="2"><a href="UserHome.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','images/layout_button_03.gif',1)"><img src="images/layout_03.gif" name="Image15" width="181" height="103" border="0"></a></td>
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
		<!--- working ---->
<table align="center">
<tr align="center"><td class="pagehead ">Customer Updations</td></tr>
<tr><td>&nbsp;</td></tr>
</table>

		<Form action="EnqEditBean.jsp" method="post">
<Table width="500" align="center">
<%while(rs.next())
{
%>
<tr>
<td>Name</td><td colspan="2"><input type="text" name="name" value=<%=rs.getString(2) %>></td>
</tr>

<tr>
<td>MobileNo</td><td colspan="2"><input type="text" name="mobile" value=<%=rs.getString(3) %>></td>
</tr>

<tr>
<td>Email</td><td colspan="2"><input type="text" name="email" value=<%=rs.getString(4) %>></td>
</tr>

<tr>
<td>Address</td><td colspan="2"><textarea rows="5" cols="15"  name="address" ><%=rs.getString(5) %></textarea></td>
</tr>
<tr><td colspan="3"><input type="hidden" name="id" value=<%=rs.getString(1) %>></td></tr>
<%}%>
</table><table align="center">
<tr><td colspan="4"><div id="mail">
    <a class="menu_links" onclick="displayData(11,1,0,'A')" onmouseover="" style="cursor: pointer;"><font  color="red">Mail</font></a>
</div>
<div id="sms">
    <a class="menu_links" onclick="displayData(11,1,0,'A')" onmouseover="" style="cursor: pointer;"><font  color="Blue">SMS</font></a>
</div>


</td>
</tr>
<tr bgcolor="#819FF7">

<tH>Updates</th><th>Date</th><th>Mode</th>
</tr>
<%
while(rs1.next())
{
%>
 <tr align="center">
 <td><%=rs1.getString(2) %></td><td><%=rs1.getString(1) %></td><td><%=rs1.getString(3) %></td>
</tr>
 <%
 } %>
<tr >
</tr >
<tr bgcolor="#819FF7" align="center"><td colspan="3">--</td></tr>
<tr>
<td>Current Status</td><td ><input type="text" name="status" placeholder="Current Status"></td>
<td>Mode: 
<select name="mode">
<option value="call">CALL</option>
<option value="email">EMAIL</option>
<option value="sms">SMS</option>
<option value="direct">Direct</option>
</select>
</td>
</tr>
<tr>
<td ></td><td colspan="2"><input type="image" src="images/submit.png" alt="Submit the Updation" width="75" height="30"><a href='FollowUp.jsp'><img src="images/back.png" alt="Submit the Updation" width="75" height="30"></a></td>
</tr>

</Table></Form>
<table align="center">
<tr><td>


<div id="draggable" class="ui-widget-content">
<div  id="cls"><a class="menu_links" onclick="displayData(11,1,0,'A')" onmouseover="" style="cursor: pointer;"><font  color="red"><img src="images/close.jpg" width="15px" 

height="15px"/></font></a></div>
<form name="mailForm" action="SendFollowUpMailBean.jsp " onsubmit="return mailChk()" >
<table  align="center" >
<%
while(rs2.next())
{%>
<tr><td>Emaill Id</td><td><input type="text" name="email" id="email" value="<%=rs2.getString(1)%>" size="50"/></td></tr>
<%}%>
<tr><td>Subject</td><td><input type="text" name="sub" placeholder="Subject" id="sub" size="50"/><a class="menu_links" onclick="displayData(11,1,0,'A')" onmouseover="" style="cursor: 

pointer;"></a></td></tr>


<tr><td valign="top">Message</td><td><textarea placeholder="Message" name="msg" id="msg" rows="10" cols="50"></textarea></td></tr>
<tr><td></td><td align="right"><input type="submit" value="Send"/></td><td></td></tr>
<tr>
<td colspan="3"><div id="mailconf"><input type="text" value="<%=confMail %>" name="custmail"><input type="text" value="<%=mailPass%>" name="pass"></div></td>

</tr>
</table>
</form>
</div>
<div id="smsPanel" class="ui-widget-content">
<div  id="closeP"><a class="menu_links" onclick="displayData(11,1,0,'A')" onmouseover="" style="cursor: pointer;"><font  color="red"><img src="images/close.jpg" width="15px" height="15px"/></font></a></div>
<form name="smsForm" action="http://smsprice.textilemarketindia.com/api/sendmsg.php" onsubmit="return smsChk()" >
<table  align="center" >
<tr></tr>

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
<%while(rs3.next()){%>
<tr><td>Phone</td><td><input type="text" name="phone" id="phone" value="<%=rs3.getString(1)%>" size="13" readonly="readonly"/></td></tr>

<%}%>
<tr><td valign="top">Message</td><td><textarea placeholder="Message" name="text" id="msg" rows="7" cols="25" onkeypress="return imposeMaxLength(this, 140);"></textarea></td></tr>
<tr><td></td><td align="right"><input type="submit" value="Send"/></td><td></td></tr>

</table>
</form>
</div>
</td></tr>
</table>

		
		<!--- working ---->
		
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