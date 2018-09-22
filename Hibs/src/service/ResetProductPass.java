package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DbConnection;

/**
 * Servlet implementation class ResetProductPass
 */
public class ResetProductPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetProductPass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("reaching in post");
		String email= request.getParameter("email");
		String mobile=request.getParameter("mobileno");
		
		Connection con;
		ResultSet rs = null;
		int flag=0;
		int update=0;
		String userlogPassWord="";
		HttpSession session=request.getSession();
		
		con=DbConnection.connect();
		String sql="select * from  hibs_userdetails where email='"+email+"' and mobile='"+mobile+"' ";
		try {
			rs=con.createStatement().executeQuery(sql);
			
			while(rs.next())
			{
				flag=+1;
			}
			
		} catch (SQLException e) {
			System.out.println("error in service/ResetProductPass.java "+e);
		}
		System.out.println("flag var is "+flag);
		if(flag==1)
		{
			System.out.println("flag working "+flag);
			userlogPassWord =NewPassForProductUser.genPass();
			
			System.out.println(userlogPassWord);
			session.setAttribute("toMail", email);
			session.setAttribute("pass", userlogPassWord);
			update=ResetPassUpdate.resetPassUpdate(email, userlogPassWord);
			System.out.println("update? "+update);
			response.sendRedirect("mailBox.jsp");
			
		}
		else 
		{
			System.out.println("else block working "+flag);
		}
		
	}

}
