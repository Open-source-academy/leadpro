<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="dao.InsertDataToUserTable" %>
<%!InsertDataToUserTable send=new InsertDataToUserTable(); %>

<h3>inserting...!!</h3>
<%=request.getParameter("table")%>


<%
List<String> field=new ArrayList<String>();
List<String> value=new ArrayList<String>();


String table= request.getParameter("table");

String values[]=request.getParameterValues("newValue");
String fields[]=request.getParameterValues("field");
// updation


	System.out.print("Getting Empty value*************  "+values[0]);



//




	for(int i=0;i<=values.length-1&&i<=fields.length-1;i++)
{
	value.add(values[i]);
	field.add(fields[i]);
}
int con=send.getData(table,field,value); /// chk data // everthink is ok 
if(con==1)
{
response.sendRedirect("addDataToTable.jsp?table="+table);
}
else
{
	%>
	<script type="text/javascript">
alert("Data insertion Failed...! Miss match Datatype");
window.history.go(-1);
</script>
<%
//response.sendRedirect("addDataToTable.jsp?table="+table);
}
%>





