<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<jsp:forward page="sendMail">
<jsp:param value='<%=request.getParameter("email")%>' name="email"/>
<jsp:param value='<%=request.getParameter("sub")%>' name="sub"/>
<jsp:param value='<%=request.getParameter("msg")%>' name="msg"/>

</jsp:forward>