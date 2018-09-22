<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.UserConnection"%>
<%@page import="java.sql.ResultSet"%>
<%
String admin="";
String password="";
Connection con;
ResultSet rs;
int flag=0;

con=UserConnection.userConnect();

String prefix=session.getAttribute("prefix").toString();

admin=request.getParameter("admin").trim().toLowerCase();
password=request.getParameter("password");


rs=con.createStatement().executeQuery("select  admin from "+prefix+"adminpass where  admin='"+admin+"' and password='"+password+"' ");
while(rs.next())
{
session.setAttribute("admin",rs.getString(1));
flag++;
}

if(flag==1)
{
response.sendRedirect("Lead_pro_Controlpanel.html");
}
else
{
response.sendRedirect("Leadhome.html");
}
%>