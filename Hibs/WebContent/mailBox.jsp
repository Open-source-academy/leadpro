<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String mail=session.getAttribute("toMail").toString();
String pass=session.getAttribute("pass").toString();
 %>
 <script>
 function submitForm()
 {
 document.mail.submit();
 }
 </script>
 
 <head>
 <link href="css/jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css"/>
<link href="css/main.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script> 
<script type="text/javascript" src="js/script.js"></script>
 
 </head>
<body onload="submitForm()">
<form name="mail" action="mailBean.jsp" >
<table width="50%" align="center">
<tr><td></td><td><input type="hidden" name="email" id="email" value="<%=mail %>" size="50"/></td><td><div id="mailmsg"></div></td></tr>
<tr><td></td><td><input type="hidden" name="sub" id="sub" size="50" value="Hibs Password"/></td><td><div id="submsg"></div></td></tr>
<tr><td valign="top"></td><td><input type="hidden" value="<%=pass%>" name="msg"></td><td><div id="msgmsg"></div></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td></td><td></td><td></td></tr>
</table>
</form>
<div align="center">Please wait, Registration Under Process..!</div>
 <div class="example">
       
        <div id="progress2">
            <div class="percent"></div>
            <div class="pbar"></div>
            <div class="elapsed"></div>
        </div>

    </div>
</body>