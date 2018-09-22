package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DbConnection;
import dao.UserConnection;



public class SendMailToUser extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			{
		Connection con;
		ResultSet rs=null;
		
		String sender_email = "";
		String sender_password; 
		
		String sql="select mailId,password from webmail";
		con=DbConnection.connect();
		
		try {
			rs=con.createStatement().executeQuery(sql);
			while(rs.next())
			{
				sender_email=rs.getString(1);
				sender_password =rs.getString(2);
				
			}
		} catch (SQLException e) {
			System.out.println("mail error in SendMailToUser.java");
		}
		
		String reciever_id = request.getParameter("email");
		System.out.println(reciever_id+"################################");
		String subject_to_be_given = request.getParameter("sub");
		String pass  = request.getParameter("msg");/// getting PassWord 
		
		String message_mi="Welcome to LeadsPro Thank you for registering with us. Use this username and password to change your password when logging in next time. Your Product Username: "+reciever_id+ " Your password:  "+pass+"   Admin UserName: LeadAdmin and Password: admin Thank You";
		
		
		
		String sender_host = "smtp.gmail.com";//"smtp.gmail.com",
		String sender_port = "465";  // 465
		
		Properties props = new Properties();
		 props.put("mail.smtp.user", sender_email);
		 props.put("mail.smtp.host", sender_host);
		 props.put("mail.smtp.port", sender_port);
		 props.put("mail.smtp.starttls.enable","true");
		 props.put("mail.smtp.auth", "true");
		 //props.put("mail.smtp.debug", "true");
		 props.put("mail.smtp.socketFactory.port",sender_port);
		 props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		 props.put("mail.smtp.socketFactory.fallb","false");

		 SecurityManager security = System.getSecurityManager();

		 try
		 {
		 Authenticator auth = new SMTPAuthenticatorsa();
		 Session session = Session.getInstance(props, auth);
		 //session.setDebug(true);

		 MimeMessage msg = new MimeMessage(session);
		 msg.setText(message_mi);
		 msg.setSubject(subject_to_be_given);
		 msg.setFrom(new InternetAddress(sender_email));
		 msg.addRecipient(Message.RecipientType.TO,new InternetAddress(reciever_id));
		 Transport.send(msg);
		 }
		 catch (Exception mex)
		 {
			 mex.printStackTrace();
			 System.out.println("failed..!");
			 response.sendRedirect("mailError.jsp");
		 } 
		 response.sendRedirect("ResetPass.html");
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {}

}
class SMTPAuthenticatorsa extends javax.mail.Authenticator
{
	String sender_email="";
	String sender_password="";
	
	public PasswordAuthentication getPasswordAuthentication()
	{
		ResultSet rs1 = null;
		
		String sql="select mailId,password from webmail";
		Connection con=DbConnection.connect();
		try {
			rs1=con.createStatement().executeQuery(sql);
			while(rs1.next())
			{
				sender_email=rs1.getString(1).trim();
				sender_password=rs1.getString(2).trim();
			}
		}
		catch(Exception e)
		{
		System.out.println("Auth Failed in service/SendMailToUser.java");
		}
		
		
			return new PasswordAuthentication(sender_email, sender_password);
	}
	
}
