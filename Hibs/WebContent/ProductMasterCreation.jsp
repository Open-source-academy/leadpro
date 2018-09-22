<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="dao.CreateProductTable" %>

<%
List<String> field=new ArrayList<String>();
List<String> type=new ArrayList<String>();

String product= request.getParameter("product");

String prefix=session.getAttribute("prefix").toString();
String userDataBase=session.getAttribute("userDataBase").toString();
String username=session.getAttribute("username").toString();
String userPass=session.getAttribute("userPass").toString();
String host=session.getAttribute("host").toString();



String values[]= request.getParameterValues("mytext");
String types[]= request.getParameterValues("element");  // type of field
System.out.println(values.length+" ***** "+types.length);

String tableName=product.trim().replaceAll(" ","_");

CreateProductTable.tableMaster(tableName,prefix,userDataBase,username,userPass,host);

for(int i=0;i<=values.length-1&&i<=types.length-1;i++)
{
	field.add(values[i].trim().replaceAll(" ","_"));
	type.add(types[i]);
}

System.out .print("size****"+field.size());
System.out.print("type***"+type.size());

Iterator ii=field.iterator();
Iterator jj=type.iterator();
while(ii.hasNext()&&jj.hasNext())
{
CreateProductTable.addFields(tableName,ii.next().toString(),jj.next().toString(),prefix);

}
response.sendRedirect("productPanelNewTable.jsp");
 %>