<HTML>   
<HEAD><TITLE>DataBase Search</TITLE></HEAD>  
<BODY>

<%@ page language="Java" import="java.sql.*" %>  

<jsp:useBean id="db" scope="request" class="module.LoginBean" >

<jsp:setProperty name="db" property="userName" value='<%=request.getParameter("name")%>'></jsp:setProperty>
<jsp:setProperty name="db" property="password" value='<%=request.getParameter("password")%>'></jsp:setProperty>

  </jsp:useBean>

<jsp:forward page="logme">
<jsp:param name="username" value="<%=db.getUserName()%>" ></jsp:param>
<jsp:param name="password" value="<%=db.getPassword()%>" ></jsp:param>

</jsp:forward> 

</body>
</html>