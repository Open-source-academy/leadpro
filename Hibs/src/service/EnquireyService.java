package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserConnection;

public class EnquireyService extends HttpServlet {

	// Db objects 
	Connection con=null;
	PreparedStatement pst;
	int insert=0;
	
	String name="";
	String age="";
	String mobileno="";
	String phoneno="";
	String address="";
	String email="";
	String expdoj="";
	String product="";
	String source="";
	String status="";
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		 name=request.getParameter("name");
		age=request.getParameter("age");
		mobileno=request.getParameter("mobileno");
		phoneno=request.getParameter("phoneno");
		address=request.getParameter("address");
		email=request.getParameter("email");
		expdoj=request.getParameter("expdoj");
		product=request.getParameter("product");
		source=request.getParameter("source");
		status=request.getParameter("status");
		
		System.out.println("Coming from enquirey table"+name);
		System.out.println("Coming from enquirey table"+expdoj);
		
		Calendar now=Calendar.getInstance();
		String enqdate=(now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH )+1)+"-"+ + now.get(Calendar.DATE));
		
		HttpSession session=request.getSession();
		String prefix=session.getAttribute("prefix").toString();
		con=UserConnection.userConnect();
		String sql="insert into  "+prefix+"enquireydetails(name,age,phoneno,mobileno,address,email,dealDate,enqDate,product,source,status) values(?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			pst=con.prepareStatement(sql);
		
			pst.setString(1,name);
			pst.setString(2,age);
			pst.setString(3,phoneno);
			pst.setString(4,mobileno);
			pst.setString(5,address);
			pst.setString(6,email);
			pst.setString(7,expdoj);
			pst.setString(8, enqdate);
			pst.setString(9,product);
			pst.setString(10,source);
			pst.setString(11,status);
			
			insert= pst.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Exception in Enquirey service "+e);
		}
		
		if(insert==1)
		{
			response.sendRedirect("enqiry.jsp");
		}
		
		out.flush();
		out.close();
	}

}
