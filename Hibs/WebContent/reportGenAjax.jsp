<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.UserConnection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
Connection con;
ResultSet rs;
con=UserConnection.userConnect();

String sql="";
String buffer="<input type='text' name='report'"; 

Date date=null;

//String table=request.getParameter("productlist");
String product=request.getParameter("product");
String fdate=request.getParameter("date");
String pur_lead=request.getParameter("deal");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
date = sdf.parse(fdate);
			
if(pur_lead.equals("enquireydetails"))
{
sql="select count(*) from enquireydetails where enqDate='"+fdate+"' and product='"+product+"' ";
}
else if(pur_lead.equals("purchasetable"))
{
sql="select count(*) from purchasetable where purchaseDate='"+fdate+"' and product='"+product+"' ";
}
rs=con.createStatement().executeQuery(sql);

while(rs.next())
{
buffer=buffer+"value="+rs.getString(1)+">";
}
 response.getWriter().println(buffer); 
%>