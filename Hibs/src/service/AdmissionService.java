package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserConnection;

public class AdmissionService extends HttpServlet {
/**
 * need to write sql and pst 
 */
	int insert=0;
	Connection con=null;
	PreparedStatement pst;
	String name="";
	String age="";
	String dob="";
	String mobile="";
	String phone="";
	String product="";
	String purchasedate="";
	String address="";
	String email="";
	String amountPaid="";
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		int chk=0;
		
		name=request.getParameter("name");
		age=request.getParameter("age");
		dob=request.getParameter("dob");
		mobile=request.getParameter("mobile");
		phone=request.getParameter("phone");
		product=request.getParameter("course");
		purchasedate=request.getParameter("dateofjoin");
		address=request.getParameter("address");
		email=request.getParameter("email");
		amountPaid=request.getParameter("feepaid");
		System.out.println(name+"%%%%%%%%%%%%%%");
		con=UserConnection.userConnect();
		String sql="insert into  purchaseTable(name,age,dob,mobileNo,phoneno,address,email,purchasedate,product,totalamount,amountPaid) values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
		pst=con.prepareStatement(sql);
		pst.setString(1,name );
		pst.setString(2, age);
		pst.setString(3, "2010-02-02"); // var: dob/// value show chk
		pst.setString(4,mobile );
		pst.setString(5, phone);
		pst.setString(6,address );
		pst.setString(7,email );  
		pst.setString(8,"2010-10-10" );//dateofjoin
		pst.setString(9, product);
		pst.setString(10, "1000");
		pst.setString(11,amountPaid );
		
		chk=pst.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("Insertion failed in Admission service..!" +e);
		}
		if(chk==1)
		{
			response.sendRedirect("PrintBill.jsp");
		}
		else
		{
			response.sendRedirect("purchaseFailed.html");
		}
		out.flush();
		out.close();
	}

}
