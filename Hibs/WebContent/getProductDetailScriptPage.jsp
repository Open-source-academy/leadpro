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
 String buffer="<table align='center'><tr>";  
 
 //past
 rs=con.createStatement().executeQuery(sql);
    md = rs.getMetaData();
  	int col = md.getColumnCount();
  	
  	for (int i = 2; i <= col; i++)
  	{
  	
 buffer=buffer+"<th bgcolor='blue' ><font color='white'>"+md.getColumnName(i)+"</font></th>";
  	
    }
    
   buffer=buffer+"  </tr>";
     
     while(rs.next())
     { 
    
    buffer=buffer+" <tr>";
     
    
     for(int j=2;j<=col;j++)
     { 
     
    buffer=buffer+"<td>"+rs.getString(j)+"</td>";
     
     }
     
  buffer=buffer+" </tr>";
     }
    buffer=buffer+"  </table>";
 //past

 response.getWriter().println(buffer); 
}
 %>