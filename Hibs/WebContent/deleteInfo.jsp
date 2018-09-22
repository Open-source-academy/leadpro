<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %>
<%@page import="dao.UserConnection"%>
<%!Connection con; %>

delete your info :
<%=request.getParameter("id")%>
<%
String id=request.getParameter("id");
String table=request.getParameter("table");
System.out.println(id);
System.out.println(table);

con=UserConnection.userConnect();
String sql="delete from "+table+" where id="+id;
System.out.println(sql);
int a=0;
a=con.createStatement().executeUpdate(sql);
if(a==1){
%>
<script>
alert("Data deleted Successfully..!");
</script>
<%
}
response.sendRedirect("editTable.jsp?table="+table);
%>