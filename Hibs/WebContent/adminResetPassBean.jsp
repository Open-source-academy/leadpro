<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="service.AdminPassReset"%>
<%
AdminPassReset pass=new AdminPassReset();

int reset=0;
String old=request.getParameter("oldpass");
String newpass=request.getParameter("newpass");

reset=pass.resetpass(old,newpass);

if(reset==1)
{
	%>
	<script>
		alert("Password reset successfuly ");
		window.location="Lead_pro_Controlpanel.html";
	</script>
	<%
}
if(reset==0)
{
	%>
	<script>
		alert("Password reset Failed ");
		window.location="adminResetPass.jsp";
	</script>
	<%
}

 %>

