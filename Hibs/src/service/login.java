package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import module.TableName;

import dao.DbConnection;

public class login extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		Connection conn = null;
		   String username="";
		   String userpass="";
		   String strQuery= ""; 
		   String regDate="";
		   String host="localhost";
		   Date today=null;
		   Date endDate=null;
		   boolean chk = false;
		 
		   
		   Calendar now=Calendar.getInstance();
			String today1=(now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH )+1)+"-"+ + now.get(Calendar.DATE));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    	try {
				 today = sdf.parse(today1);
			} catch (ParseException e1) {
				System.out.println("Date Parse Exception in service/Login .java "+e1);
			}
	    	
			//Statement st=null;
			ResultSet rs=null;
			HttpSession session = request.getSession(true);

			conn=DbConnection.connect();
				if(request.getParameter("username")!=null && request.getParameter("username")!="" && request.getParameter("password")!=null && request.getParameter("password")!="")
				{
					username = request.getParameter("username").toString().trim().toLowerCase();
					userpass = request.getParameter("password").toString();
	                strQuery="select email,password,Insdatabase,startdate,username,prefix,dbuserpass from hibs_userdetails where email='"+username+"' and  password='"+userpass+"'";
					
						try {
							rs = conn.createStatement().executeQuery(strQuery);
							} catch (SQLException e) 
								{
									System.out.println("login failed in service/login.java "+e);
								}
					
					int count=0;
					try {
						while(rs.next())
						{
							
							session.setAttribute("userDataBase",rs.getString(3));// sending db name to testdb.jsp page 
							session.setAttribute("username",rs.getString(5));
							session.setAttribute("prefix", rs.getString(6));
							session.setAttribute("userPass", rs.getString(7));
							session.setAttribute("host", host);
							regDate= rs.getString(4);
							System.out.println("your end date is "+rs.getString(4));
							count++;
						}
					} catch (SQLException e) {
						System.out.println("Exception in while: login.java "+e);
					}
					if(count>0)
					{
						try {
							endDate=sdf.parse(regDate);
							 chk=today.before(endDate);
							} catch (Exception e) 
							{
								System.out.println("Parsing failure in login.java "+e);
							}
					}
					
					System.out.println("today "+today+" end date="+endDate);
					
					//boolean chk=today.before(endDate);
					
					if(count>0 )//chk==true)
					{
		                if(chk==true)//count>0  ) // chk here ... 
						{
							response.sendRedirect("setUserDb.jsp");// should go ControlPanel.jsp
						}
		                else
		                {
		                	
		                	RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
							out.print("<table align='center' border='0' width='1000px' bgcolor='red'><tr><td  ><font align='center' color='white'>Your 30 days trial version was expired.! Please Subscribe for Pro Version for Uninterrupted Service</font></td></tr></table>");
							rd.include(request, response);
		                }
					}
				
					else
					{
						RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
						out.print("<table align='center' border='0' width='1002px' bgcolor='red'><tr><td ><font color='white' align='center' >Wrong Login id...!</font align='right'><font color='white'> <a href='forgetPassWord.html' class='menu_links' onclick='displayData(11,1,0,'A')' onmouseover='' style='cursor: pointer;'> Forget Your Password? click! </a>  </font></td></tr></table>");
						rd.include(request, response);
					}
			
				  
				}
				else
				{
					 response.sendRedirect("index.jsp");
				}

				
			
		}
		
	
}
