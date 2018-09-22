<BODY>

<%@ page language="Java" import="java.sql.*" %>  

<jsp:useBean id="admission" scope="request" class="module.AdmissionBean" >

<jsp:setProperty name="admission" property="name" value='<%=request.getParameter("name")%>'/>
<jsp:setProperty name="admission" property="age" value='<%=request.getParameter("age")%>'/>
<jsp:setProperty name="admission" property="dob" value='<%=request.getParameter("dob")%>'/>
<jsp:setProperty name="admission" property="mobile" value='<%=request.getParameter("mobile")%>'/>
<jsp:setProperty name="admission" property="phone" value='<%=request.getParameter("phone")%>'/>
<jsp:setProperty name="admission" property="product" value='<%=request.getParameter("product")%>'/>
<jsp:setProperty name="admission" property="purchase" value='<%=request.getParameter("purchase")%>'/>
<jsp:setProperty name="admission" property="address" value='<%=request.getParameter("address")%>'/>
<jsp:setProperty name="admission" property="email" value='<%=request.getParameter("email")%>'/>
<jsp:setProperty name="admission" property="amount" value='<%=request.getParameter("amount")%>'/>
</jsp:useBean>

<jsp:forward page="admission">

<jsp:param name="name" value="<%=admission.getName()%>" />
<jsp:param name="age" value="<%=admission.getAge()%>" />
<jsp:param name="dob" value="<%=admission.getDob()%>" />
<jsp:param name="mobile" value="<%=admission.getMobile()%>" />
<jsp:param name="phone" value="<%=admission.getPhone()%>" />
<jsp:param name="product" value="<%=admission.getProduct()%>" />
<jsp:param name="purchase" value="<%=admission.getPurchase()%>" />
<jsp:param name="address" value="<%=admission.getAddress()%>" />
<jsp:param name="email" value="<%=admission.getEmail()%>" />
<jsp:param name="amount" value="<%=admission.getAmount()%>" />

</jsp:forward> 


</body>