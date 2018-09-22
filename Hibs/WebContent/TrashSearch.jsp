<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.UserConnection"%>
<%!ResultSet rs1; %>
<html>
<head>
<link rel="shortcut icon" href="images/logo.ico"/>
<title>Lead Pro:Search  </title><link rel="stylesheet" type="text/css" href="css/bodyBackGround.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/pagehead.css" media="screen" />
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
<body  class="back" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('images/layout_button_03.gif','images/layout_button_05.gif')">
<!-- Save for Web Slices (new home.psd) -->
<table width="1001" height="713" bgcolor="#FFFFFF" border="0" align="center" cellpadding="0" cellspacing="0" id="Table_01">
	<tr>
		<td colspan="5">
			<img src="images/layout_01.png" width="1000" height="155" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="155" alt="1"></td>
	</tr>
	<tr>
		<td rowspan="3">
			</td>
		<td rowspan="2"><a href="UserHome.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','images/layout_button_03.gif',1)"><img src="images/layout_03.gif" name="Image15" width="181" height="103" border="0"></a></td>
		<td rowspan="2">
			</td>
		<td><a href="index.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image16','','images/layout_button_05.gif',1)"><img src="images/layout_05.gif" name="Image16" width="106" height="40" border="0"></a></td>
		<td rowspan="3">
			</td>
		<td>
		<!--  	<img src="images/spacer.gif" width="1" height="40" alt="">--></td>
	</tr>
	<tr>
		<td rowspan="2">
			</td>
		<td>
			</td>
	</tr>
	<tr>
		<td colspan="2">
			<img src="images/layout_08.gif" width="752" height="7" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="7" alt=""></td>
	</tr>
	<tr>
		<td colspan="5" valign="top">
		<%
		String prefix=session.getAttribute("prefix").toString();
		String search=request.getParameter("search").trim();
		System.out.print(search);
		Connection con;
		ResultSet rs;
		int flag=0;                              //select id,name,mobileno,address,email,product,status from trash order by name asc
		con=UserConnection.userConnect();
		rs=con.createStatement().executeQuery("select name,mobileno,email,product from  "+prefix+"trash");
		while(rs.next())
		{
		if(rs.getString(1).equalsIgnoreCase(search))
		{
		flag=1;
		}
		else if(rs.getString(2).equalsIgnoreCase(search))
		{
		flag=2;
		}
		else if(rs.getString(3).equalsIgnoreCase(search))
		{
		flag=3;
		}
		else if(rs.getString(4).equalsIgnoreCase(search))
		{
		flag=4;
		}
		}
		if(flag==1)
		{
		   rs1=con.createStatement().executeQuery("SELECT id,name,mobileno,address,email,product,status from "+prefix+"trash where name='"+search+"' order by id desc");
		}
		else if(flag==2)
		{
		   rs1=con.createStatement().executeQuery("SELECT id,name,mobileno,address,email,product,status from "+prefix+"trash where mobileNo='"+search+"' order by id desc");
		}
		else if(flag==3)
		{
		   rs1=con.createStatement().executeQuery("SELECT id,name,mobileno,address,email,product,status from "+prefix+"trash where email='"+search+"' order by id desc");
		}
		else if(flag==4)
		{
		   rs1=con.createStatement().executeQuery("select id,name,mobileno,address,email,product,status from "+prefix+"trash  where product='"+search+"' order by id desc");
		}
		else
		{
		%>
		<script>
		alert("No result Found..!");
		window.location='trash.jsp';
		</script>
		<%
		}if(flag==0)
		{
		%>
		<script>
		alert("No result Found..!");
		window.location='trash.jsp';
		</script>
		<%
		}
		 %>

<table align="center">
<tr align="center"><td class="pagehead ">Missed Leads</td></tr>
<tr><td>&nbsp;</td></tr>
</table>

		 
		<table align="center" bordercolor="#819FF7" border="1" cellspacing=".3" width=900>
		
		<tr bgcolor="#819FF7" align="center">
		<td>T.No</td><td>NAME</td><td>MOBILE</td><td>ADDRESS </td><td>EMAIL</td><td>PRODUCT</td><td>REPORT</td><TD bgcolor="#F781F3">FOLLOW</TD>
		</tr>
		<%
		
if(flag!=0){
		while(rs1.next()){ %>
			<tr>
		<TD valign="top"><%=rs1.getString(1) %></TD><TD valign="top"><%=rs1.getString(2) %></TD><TD valign="top"><%=rs1.getString(3) %></TD><TD valign="top"><textarea rows="4" cols="15"><%=rs1.getString(4) %></textarea></TD><TD  valign="top"><%=rs1.getString(5) %></TD><TD valign="top"><%=rs1.getString(6) %></TD><TD valign="top"><%=rs1.getString(7) %></TD><TD bgcolor="#F781F3" valign="top">SMS</TD>
		</tr>
		<%}} %>
		<tr><td colspan="8"><input type="image" src="images/back.png" onclick="window.location='trash.jsp'" width="75" height="30"></td></tr>
		</table>
		<!--- working ---->
		
		</td>
		<td>
			<img src="images/spacer.gif" width="1" height="364" alt=""></td>
	</tr>
	<tr>
		<td colspan="5">
			<img src="images/layout_10.png" width="1000" height="84" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="84" alt=""></td>
	</tr>
</table>
<!-- End Save for Web Slices -->
</body>
</html>