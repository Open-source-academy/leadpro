<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.UserConnection"%>
<%@page import="dao.MoveTrash"%>
<%!MoveTrash move=new MoveTrash(); %>
<%! int ins=0; %>
<%

String prefix=session.getAttribute("prefix").toString();

String id=request.getParameter("id");

ins=move.trash(id,prefix);

System.out.println("*******"+ins);
if(ins==1)
{
response.sendRedirect("trash.jsp");
}
else
{
%>

<script>
alert("Moving failed..!");
</script>
<%
response.sendRedirect("enqiry.jsp");
} %>



