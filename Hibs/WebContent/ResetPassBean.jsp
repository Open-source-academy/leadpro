<HTML>   
<HEAD><TITLE>DataBase Search</TITLE></HEAD>  
<BODY>

<%@ page language="Java" import="java.sql.*" %>  

<jsp:useBean id="rePass" scope="request" class="module.ResetPass" >

<jsp:setProperty name="rePass" property="old" value='<%=request.getParameter("old")%>'/>
<jsp:setProperty name="rePass" property="pass" value='<%=request.getParameter("pass")%>'/>

  </jsp:useBean>

<jsp:forward page="reset">
<jsp:param name="old" value="<%=rePass.getOld()%>" />
<jsp:param name="pass" value="<%=rePass.getPass()%>" />
</jsp:forward> 


</body>
</html>