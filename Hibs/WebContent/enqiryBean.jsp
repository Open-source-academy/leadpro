<BODY>

<%@ page language="Java" import="java.sql.*" %>  

<jsp:useBean id="enquirey" scope="request" class="module.EnquireyBean" >

<jsp:setProperty name="enquirey" property="name" value='<%=request.getParameter("name")%>'/>
<jsp:setProperty name="enquirey" property="age" value='<%=request.getParameter("age")%>'/>
<jsp:setProperty name="enquirey" property="mobileno" value='<%=request.getParameter("mobileno")%>'/>
<jsp:setProperty name="enquirey" property="phoneno" value='<%=request.getParameter("phoneno")%>'/>
<jsp:setProperty name="enquirey" property="address" value='<%=request.getParameter("address")%>'/>
<jsp:setProperty name="enquirey" property="email" value='<%=request.getParameter("email")%>'/>
<jsp:setProperty name="enquirey" property="product" value='<%=request.getParameter("product")%>'/>
<jsp:setProperty name="enquirey" property="expdoj" value='<%=request.getParameter("date1")%>'/>
<jsp:setProperty name="enquirey" property="source" value='<%=request.getParameter("source")%>'/>
<jsp:setProperty name="enquirey" property="status" value='<%=request.getParameter("status")%>'/>
</jsp:useBean>
<jsp:forward page="enquirey">
<jsp:param name="name" value="<%=enquirey.getName()%>" />
<jsp:param name="age" value="<%=enquirey.getAge()%>" />
<jsp:param name="mobileno" value="<%=enquirey.getMobileno()%>" />
<jsp:param name="phoneno" value="<%=enquirey.getPhoneno()%>" />
<jsp:param name="address" value="<%=enquirey.getAddress()%>" />
<jsp:param name="email" value="<%=enquirey.getEmail()%>" />
<jsp:param name="product" value="<%=enquirey.getProduct()%>" />
<jsp:param name="expdoj" value="<%=enquirey.getExpdoj()%>" />
<jsp:param name="source" value="<%=enquirey.getSource()%>" />
<jsp:param name="status" value="<%=enquirey.getStatus()%>" />


</jsp:forward> 


</body>