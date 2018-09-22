<%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.TopEnQInUserTable"%>
<%@ page import="dao.UserConnection" %>
<%!Connection con; %>
<%!ResultSet rs; %>
<%!ResultSet rs1; %>
<%!ResultSet rs2; %>
<%!ResultSet rs3; %>
<%!String product; %>

<%con=UserConnection.userConnect();
String prefix=session.getAttribute("prefix").toString();


String getUserTables="select tableLabel,tableName from "+prefix+"userTablesDetails";

int cut=prefix.length();
rs=con.createStatement().executeQuery("select source from  "+prefix+"source");

rs1=con.createStatement().executeQuery(getUserTables);
int topEnq=0;
topEnq=TopEnQInUserTable.topId(prefix);
rs3=con.createStatement().executeQuery("select id,name,address,mobileno,email,dealdate,product,status from  "+prefix+"enquireydetails  order by id desc;");
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
<head>
<link rel="shortcut icon" href="images/logo.ico"/>
<link rel="stylesheet" type="text/css" href="css/bodyBackGround.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/pagehead.css" media="screen" />
<title>Lead Pro: Enquiry Form</title>
<script src="JavaScript/enquireyValidate.js"></script>
<script src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js">
</script>
<script>
$(document).ready(function(){
	  $("#report").click(function(){
	    $("#reportTab").toggle();
	  });
	});

</script>
<style type="text/css">
#reportTab{

}
</style>

<script src="JavaScript/conformations.js"></script>

<script type="text/javascript" src="js/mootools.js"></script>

	<script type="text/javascript" src="js/calendar.rc4.js"></script>
	
	<script type="text/javascript">		
	//<![CDATA[
		window.addEvent('domready', function() { 
			myCal1 = new Calendar({ date1: 'Y-m-d' }, { direction: 1, tweak: {x: 6, y: 0} });
			
		});
	//]]>
	</script>
	
<script language="javascript" type="text/javascript" src="JavaScript/LeadAjaxPage.js">  </script>



<link rel="stylesheet" type="text/css" href="css/iframe.css" media="screen" />


	<link rel="stylesheet" type="text/css" href="css/calendar.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="css/dashboard.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="css/i-heart-ny.css" media="screen" />
	
<style type="text/css">
<!--
.style13 {color: #FF0000}
.style19 {font-family: Arial, Helvetica, sans-serif; font-size: 10pt; }
.style22 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10pt;
	font-weight: bold;
	color: #4E82BB;
}
-->
</style>
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
<body class="back" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('images/layout_button_03.gif','images/layout_button_05.gif')">
<!-- Save for Web Slices (new home.psd) -->
<table width="1000"  bgcolor="#FFFFFF" height="713" border="0" align="center" cellpadding="0" cellspacing="0" id="Table_01">
	<tr>
		<td colspan="5">
			<img src="images/layout_01.png" width="1000" height="155" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="155" alt=""></td>
	</tr>
	<tr>
		<td rowspan="3">
			
		<td rowspan="2"><a href="UserHome.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','images/layout_button_03.gif',1)"><img src="images/layout_03.gif" name="Image15" width="181" height="103" border="0"></a></td>
		<td rowspan="2">
			</td>
		<td><a href="UserLogOut.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image16','','images/layout_button_05.gif',1)"><img src="images/layout_05.gif" name="Image16" width="106" height="40" border="0"></a></td>
		<td rowspan="3">
			
		<td>
			<img src="images/spacer.gif" width="1" height="40" alt="3"></td>
	</tr>
	<tr>
		<td rowspan="2">
			
		<td>
			<img src="images/spacer.gif" width="1" height="63" alt="5"></td>
	</tr>
	<tr>
		<td colspan="2">
			<img src="images/layout_08.gif" width="752" height="7" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="7" alt=""></td>
	</tr>
	<tr>
		<td colspan="6" valign="top">
<!-- -->


        <table width="900"><tr><td align="right">
        <form name="form1" method="post" action="enqiryBean.jsp" onsubmit="return validate()">
              <table border="0" cellpadding="10" >
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td colspan="2">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td colspan="2"><span class="style22">ENQ No</span></td>
                  <td><strong>:</strong></td>
                  <td><label>
                    <input name="abileenq" type="text" id="abileenq" value=<%=topEnq %> size="30">
                  </label></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td width="4">&nbsp;</td>
                  <td width="153">&nbsp;</td>
                  <td width="4">&nbsp;</td>
                  <td colspan="2">&nbsp;</td>
                  <td width="4">&nbsp;</td>
                  <td colspan="5">&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="style19">NAME<span class="style13">*</span></span></td>
                  <td>:</td>
                  <td colspan="2"> <label>
                    <input name="name" type="text" id="name" size="30" placeholder="Name"><span id="namemsg"></span>
                  </label></td>
                  <td>&nbsp;</td>
                  <td colspan="2"><span class="style19">ADDRESS<span class="style13">*</span></span></td>
                  <td>:</td>
                  <td rowspan="2" valign="top"><label>
                    <textarea name="address" cols="20" rows="4" id="address" placeholder="Address "></textarea><span id="addressmsg"></span>
                  </label></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="style19">AGE<span class="style13"></span></span></td>
                  <td>:</td>
                  <td colspan="2"><label>
                    <input name="age" type="text" id="age" size="5" placeholder="Age">
                  </label></td>
                  <td>&nbsp;</td>
                  <td colspan="2">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="style19">MOBILE NO<span class="style13">*</span></span></td>
                  <td>:</td>
                  <td colspan="2"><label>
                    <input name="mobileno" type="text" id="mobileno" size="30" placeholder="10 Digit Mobile No"><span id="mobilenomsg"></span>
                  </label></td>
                  <td>&nbsp;</td>
                  <td colspan="2"><span class="style19">E-MAIL<span class="style13">*</span></span></td>
                  <td>:</td>
                  <td><label>
                    <input name="email" type="text" id="email" size="30" placeholder="Email"><span id="emailmsg"></span>
                  </label></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="style19">PHONE NO </span></td>
                  <td>:</td>
                  <td colspan="2"><label>
                    <input name="phoneno" type="text" id="phoneno" size="30" placeholder="Land Line">
                  </label></td>
                  <td>&nbsp;</td>
                  <td colspan="2"><span class="style19">EXPECTED DATE OF PURCHASE&nbsp; </span></td>
                  <td>:</td>
                  <td>
                    <input id="date1" name="date1" type="text" placeholder="Expected Date"/><span id="date1msg"></span>
                 </td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="style19">PRODUCT LIST </span></td>
                  <td>:</td>
                  <td colspan="2"><label>
                    <select name="productList" onchange="showState(this.value)" >
                    <option value="0">select</option>
                    <%
                    
                    while(rs1.next())
                    {
                    product=rs1.getString(1);
                    if(product.equalsIgnoreCase("source")||product.equalsIgnoreCase("mailTable")||product.equalsIgnoreCase("mailTemp"))
					{
					}
						else
						{
						%>
						<option value=<%=rs1.getString(2) %>><%=rs1.getString(1) %></option>
						<%
						}
						}
						%>
                    </select><span id="productmsg"></span>
                  </label></td>
                  <td>&nbsp;</td>
                  <td colspan="2"><span class="style19">SOURCE</span></td>
                  <td>:</td>
                  <td><label>
                    <select name="source">
                    <option>Select</option>
                    <%while(rs.next()){ %>
                      <option value=<%=rs.getString(1) %>><%=rs.getString(1) %></option>
                      <%} %>
                    </select><span id="sourcemsg"></span>
                  </label></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><SPAN class="style19">PRODUCT</SPAN></td>
                  <td>:</td>
                  <td colspan="2"><div id="list"></div></td>
                  <td>&nbsp;</td>
                  <td colspan="2"><span class="style19">STATUS</span></td>
                  <td>:</td>
                  <td><label>
                    <input name="status" type="text" id="status" size="30" placeholder="Status"> <span id="statusmsg"></span>
                  </label></td>
                  <td width="10">&nbsp;</td>
                </tr>
                
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td width="92">&nbsp;</td>
                  <td >
                    <input type="submit"  value="Save">
                  </td>
                  <td>&nbsp;</td>
                  <td width="103"></td>
                  <td width="57">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table>
                        </form>
            
	</td></tr>
	<tr><td>&nbsp;</td></tr>
<tr>
<td align="right">
	
	</td>
	</tr>
	</table>
		
		<!--- working ---->
		
		</td>
		<tr>		<td>
			<img src="images/spacer.gif"  width="1" height="10" alt=""></td>
	</tr>
	<tr> <td colspan="5" align="center" class="pagehead" id="report">Enquiry Reports</td></tr>
	<tr> <td colspan="5" align="center">
<!--  -->

<table align="center" width="100%" id="reportTab">
	<tr bgcolor="#819FF7" >
		<th width="21%" >Name</th><th>Mobile No</th><th width="19%">Email</th><th>Date<br/>yyyy-mm-dd</th><th  width="15%">Product</th><th  width="15%">Status</th></th>
	</tr>
	<% 
	while(rs3.next())
	{%>
	<tr>
	<th ><%=rs3.getString(2) %></th><th><%=rs3.getString(4) %></th><th><%=rs3.getString(5) %></th><th><%=rs3.getString(6) %></th><th><%=rs3.getString(7) %></th><th><%=rs3.getString(8) %></th>
	
	</tr>
	<%}
	%>
	
	</table>
<!--  -->


</td></tr>
	<tr>
		<td colspan="5" bgcolor="#4E82BB"><br><br><br><br>
			</td>
	</tr>
</table>
<!-- End Save for Web Slices -->
</body>
</html>
<%}%>