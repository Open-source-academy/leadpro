<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="dao.DeleteEnq"%>
<%! int del=0; %>
<%!DeleteEnq delEnq=new  DeleteEnq();%>
<%
del=delEnq.deleteEnq(request.getParameter("id"));
if(del==1)
{
response.sendRedirect("enqiry.jsp");
}
else
{
%>
<script>
alert("Deletion failed..!");
</script>
<%
response.sendRedirect("enqiry.jsp");
} %>
