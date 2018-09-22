<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="dao.UserConnection" %>
<% UserConnection obj=new  UserConnection(); %>
<%! String dataBase; %>
<%! String userName; %>
<%! String passWord; %>
<%

dataBase=session.getAttribute("userDataBase").toString();
userName=session.getAttribute("username").toString(); 
passWord=session.getAttribute("userPass").toString(); // getting user database name from login.java 

System.out.println("Your UserName is "+userName);
System.out.println("Your passWord is "+passWord);
System.out.println("Your Database is "+dataBase);
%>
<%UserConnection.getUserInfo(userName, passWord, dataBase); %>  <!-- sending data base name to dao.UserConnection.java class-->

<%response.sendRedirect("Leadhome.html"); %>
