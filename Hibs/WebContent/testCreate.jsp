<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="dao.UserConnection" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.DbConnection"%>
<%! Connection con; %>
<%
con=UserConnection.userConnect();
ResultSet rs=con.createStatement().executeQuery("show tables");
while(rs.next())
{
out.print(rs.getString(1));
}
out.print("**********");
out.print(session.getAttribute("userDataBase"));
out.print("**********");
%>