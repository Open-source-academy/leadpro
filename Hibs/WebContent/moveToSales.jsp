<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.UserConnection"%>
<%@page import="dao.MoveTrash"%>
<%@page import="service.MoveToPurchase"%>
<%!MoveToPurchase move=new MoveToPurchase();  %>
<%! int ins=0; %>
<%
String id=request.getParameter("id");

String prefix=session.getAttribute("prefix").toString();
System.out.print(prefix+"getting prefix");

ins=move.purchase(id, prefix);
System.out.println("*******"+ins);
if(ins==1)
{
%>
<script>
window.history.go(-1);
</script>
<%
//response.sendRedirect("FollowUp.jsp");
}
else
{
%>

<script>
alert("Moving failed..!");
window.history.go(-1);
</script>
<%
//response.sendRedirect("FollowUp.jsp");
} %>



