<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.UserConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<head>
<script type="text/javascript">
function fun()
{
	document.form1.submit();
}
</script>
</head>
<body onload="fun();">
<form name="form1" action="Rgraph.jsp" method="post" >
<%
//
String prefix=session.getAttribute("prefix").toString();
int i;
int j=1;
int k=1;
	Connection con;
	con=UserConnection.userConnect();
	ResultSet rs;
	ResultSet rs1;
	ResultSet rs2;
	
	Vector<Integer> enquirey=new Vector<Integer>();
	Vector<Integer> purchase=new Vector<Integer>();
	Vector<Integer> missings=new Vector<Integer>();
	Calendar now = Calendar.getInstance();
	now.add(Calendar.DATE,-15);
	for( i=15;i>=1;i--)
	{
	String after=(now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH )+1)+"-"+ + now.get(Calendar.DATE));
	now.add(Calendar.DATE,1);
	System.out.println(after);
	//String sql=" select name from  enquireydetails where dealdate='"+after+"' ";
	try {
		rs=con.createStatement().executeQuery(" select count(*) from  "+prefix+"enquireydetails where enqDate='"+after+"' ");  // Enquirey sql
		rs1=con.createStatement().executeQuery(" select count(*) from   "+prefix+"purchasetable where purchaseDate='"+after+"' "); //purchase Table
		rs2=con.createStatement().executeQuery(" select count(*) from  "+prefix+"trash where trashdate='"+after+"' "); // missing lead
		while(rs.next())
		{//System.out.println(rs.getInt(1));
			enquirey.add(rs.getInt(1));
		}
		while(rs1.next())
		{//System.out.println(rs.getInt(1));
			purchase.add(rs1.getInt(1));
		}
		while(rs2.next())
		{//System.out.println(rs.getInt(1));
			missings.add(rs2.getInt(1));
		}
	
	} catch (SQLException e) {
		System.out.println("error"+e);
	}}
Iterator<Integer> enquireyDate=enquirey.iterator();
Iterator<Integer> purchaseDate=purchase.iterator();
Iterator<Integer> missingsDate=missings.iterator();
//enq loop 
while(enquireyDate.hasNext())
{
%>
<input type="hidden" name="txt<%=i%>" value=<%=enquireyDate.next() %>> 
<%i++;}
// purchase loop
while(purchaseDate.hasNext())
{
%>
<input type="hidden" name="pur<%=j%>" value=<%=purchaseDate.next() %>> 
<%
j++;
} 
while(missingsDate.hasNext())
{
%>
<input type="hidden" name="mis<%=k%>" value=<%=missingsDate.next() %>> 
<%
k++;
}
%>


</form>
</body>