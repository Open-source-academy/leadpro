<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="module.TableName"%>
<%!TableName tb=new TableName();%>
<%
String name=session.getAttribute("tableName").toString();
System.out.print(name+"table name ");
System.out.print("in welcome page ");

%>
<%=name%>