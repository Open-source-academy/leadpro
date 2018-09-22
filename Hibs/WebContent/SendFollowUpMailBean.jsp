<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<jsp:forward page="followupmail">
<jsp:param name="mailId" value='<%=request.getParameter("email") %>'/>
<jsp:param name="sub" value='<%=request.getParameter("sub") %>'/>
<jsp:param name="msg" value='<%=request.getParameter("msg") %>'/>
</jsp:forward>