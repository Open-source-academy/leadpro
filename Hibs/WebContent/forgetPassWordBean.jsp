<%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1"%>
<jsp:forward page="resetProductPass">
<jsp:param name="email" value='<%=request.getParameter("email")%>'/>
<jsp:param  name="mobileno" value='<%=request.getParameter("mobile") %>'/>
</jsp:forward>
