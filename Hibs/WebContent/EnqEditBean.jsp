<%@ page language="Java" import="java.sql.*" %> 
<body>

<jsp:useBean id="enqEdit" scope="request" class="module.EnquireyEditBean" >

<jsp:setProperty name="enqEdit" property="name" value='<%=request.getParameter("name")%>'/>
<jsp:setProperty name="enqEdit" property="mobile" value='<%=request.getParameter("mobile")%>'/>
<jsp:setProperty name="enqEdit" property="email" value='<%=request.getParameter("email")%>'/>
<jsp:setProperty name="enqEdit" property="address" value='<%=request.getParameter("address")%>'/>
<jsp:setProperty name="enqEdit" property="status" value='<%=request.getParameter("status")%>'/>
<jsp:setProperty name="enqEdit" property="mode" value='<%=request.getParameter("mode")%>'/>
<jsp:setProperty name="enqEdit" property="id" value='<%=request.getParameter("id")%>'/>

</jsp:useBean>
<jsp:forward page="EnquireyEdit">
<jsp:param value="<%=enqEdit.getName()%>" name="name"/>
<jsp:param value="<%=enqEdit.getMobile()%>" name="mobile"/>
<jsp:param value="<%=enqEdit.getEmail()%>" name="email"/>
<jsp:param value="<%=enqEdit.getAddress()%>" name="address"/>
<jsp:param value="<%=enqEdit.getStatus()%>" name="status"/>
<jsp:param value="<%=enqEdit.getMode()%>" name="mode"/>
<jsp:param value="<%=enqEdit.getId()%>" name="id"/>

</jsp:forward>
</body>