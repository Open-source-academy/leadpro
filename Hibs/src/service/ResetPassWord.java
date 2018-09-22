package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DbConnection;

public class ResetPassWord extends HttpServlet {

	String oldpass="";
	String newPass="";
	Connection con=null;
	int update=0;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		
		oldpass=request.getParameter("old");
		newPass=request.getParameter("pass");
		
		System.out.println(oldpass+newPass);
		con=DbConnection.connect();
		
		try {
			 update=con.createStatement().executeUpdate("update Hibs_UserDetails set password='"+newPass+"' where password='"+oldpass+"' ");
			// ResultSet dbname=con.createStatement().executeQuery(sql);
		} catch (SQLException e) {
			System.out.println("Sql Error in service/ResetPassWord.java "+ e);
		}
		if(update>0)
		{
			
			
		response.sendRedirect("index.jsp");
		}
		else 
		{
			response.sendRedirect("error.jsp");
		}
		out.flush();
		out.close();
	}

}
