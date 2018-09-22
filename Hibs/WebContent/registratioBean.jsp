

<%@ page language="Java" import="java.sql.*" %>  

<jsp:useBean id="reg" scope="request" class="module.RegBean" >

<jsp:setProperty name="reg" property="iName" value='<%=request.getParameter("IName")%>'></jsp:setProperty>
<jsp:setProperty name="reg" property="address1" value='<%=request.getParameter("Address")%>'></jsp:setProperty>
<jsp:setProperty name="reg" property="address2" value='<%=request.getParameter("Addresstwo")%>'></jsp:setProperty>
<jsp:setProperty name="reg" property="landmark" value='<%=request.getParameter("Landmark")%>'></jsp:setProperty>
<jsp:setProperty name="reg" property="profile" value='<%=request.getParameter("Profile")%>'></jsp:setProperty>
<jsp:setProperty name="reg" property="city" value='<%=request.getParameter("City")%>'></jsp:setProperty>
<jsp:setProperty name="reg" property="pincode" value='<%=request.getParameter("Pincode")%>'></jsp:setProperty>
<jsp:setProperty name="reg" property="otherlocation" value='<%=request.getParameter("otherlocation")%>'></jsp:setProperty>
<jsp:setProperty name="reg" property="website" value='<%=request.getParameter("website")%>'></jsp:setProperty>
<jsp:setProperty name="reg" property="phone" value='<%=request.getParameter("phone")%>'></jsp:setProperty>
<jsp:setProperty name="reg" property="mobile" value='<%=request.getParameter("mobile")%>'></jsp:setProperty>
<jsp:setProperty name="reg" property="fax" value='<%=request.getParameter("Fax")%>'></jsp:setProperty>
<jsp:setProperty name="reg" property="email" value='<%=request.getParameter("Email")%>'></jsp:setProperty>
<jsp:setProperty name="reg" property="password" value='<%=request.getParameter("Password")%>'/>
</jsp:useBean>

<jsp:forward page="register">
<jsp:param name="iName" value="<%=reg.getiName()%>" />
<jsp:param name="address1" value="<%=reg.getAddress1()%>" />
<jsp:param name="address2" value="<%=reg.getAddress2()%>" />
<jsp:param name="landmark" value="<%=reg.getLandmark()%>" />
<jsp:param name="profile" value="<%=reg.getProfile()%>" />
<jsp:param name="city" value="<%=reg.getCity()%>" />
<jsp:param name="pincode" value="<%=reg.getPincode()%>" />
<jsp:param name="otherlocation" value="<%=reg.getOtherlocation()%>" />
<jsp:param name="website" value="<%=reg.getWebsite()%>" />
<jsp:param name="phone" value="<%=reg.getPhone()%>" />
<jsp:param name="mobile" value="<%=reg.getMobile()%>" />
<jsp:param name="fax" value="<%=reg.getFax()%>" />
<jsp:param name="email" value="<%=reg.getEmail()%>" />
<jsp:param name="password" value="<%=reg.getPassword()%>" />
</jsp:forward> 


