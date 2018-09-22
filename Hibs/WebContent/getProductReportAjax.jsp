<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<!-- ajax page 
data coming from ProductDetailTable.jsp
 -->
 

<%@page import="java.sql.ResultSetMetaData" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.UserConnection"%>

<%! ResultSet rs; %>
<%! ResultSet rs1; %>
<%! ResultSetMetaData md; %>
<%!Connection con;  %>
<%
 String table=request.getParameter("table");
 if(!table.equals("0"))
  {
con=UserConnection.userConnect();
  String sql="select * from "+table;
 String buffer="<select name='product'>";  
 rs=con.createStatement().executeQuery(sql);
     while(rs.next())
     { 
    buffer=buffer+" <option value="+rs.getString(2)+">"+rs.getString(2)+"</option>";
    }
    buffer=buffer+"  </select></form>";
 response.getWriter().println(buffer);
 }


 %>