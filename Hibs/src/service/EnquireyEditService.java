package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserConnection;

public class EnquireyEditService extends HttpServlet {


	String name="";
	String mobile="";
	String email="";
	String address="";
	String status="";
	String mode="";
	String id="";
	
	Connection con;

	String sql="";
	int update=0;
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
			name=request.getParameter("name");
			mobile=request.getParameter("mobile");
			email=request.getParameter("email");
			address=request.getParameter("address");
			status=request.getParameter("status");
			id=request.getParameter("id");
			mode=request.getParameter("mode");
		
			Calendar now=Calendar.getInstance();
			String today=(now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH )+1)+"-"+ + now.get(Calendar.DATE));
			
			HttpSession session=request.getSession();
			String prefix=session.getAttribute("prefix").toString();
			// connection 
			sql=" update enquireydetails set name="+name+",mobileno="+mobile+",email="+email+",address="+address+",status="+status+"  where id="+id;
			con=UserConnection.userConnect();
			try {
				update=con.createStatement().executeUpdate("update  "+prefix+"enquireydetails set name='"+name+"',address='"+address+"',mobileno="+mobile+",email='"+email+"',status='"+status+"' where id='"+id+"'");
				con.createStatement().executeUpdate("insert into  "+prefix+"custupdation(ID, UPDATEDATE, UPDATION,CONMODE) values('"+id+"','"+today+"','"+status+"','"+mode+"')");
			} catch (SQLException e) {
				System.out.println("Enq updation failed ..! "+e);
			}
			if(update==1)
			{
				response.sendRedirect("FollowUp.jsp");
			}
			else
			{
				response.sendRedirect("FollowUp.jsp");
			}
			
		out.flush();
		out.close();
	}

}
