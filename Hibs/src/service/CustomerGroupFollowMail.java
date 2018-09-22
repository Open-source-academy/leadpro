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
import javax.servlet.http.HttpSession;

import dao.UserConnection;

public class CustomerGroupFollowMail extends HttpServlet {

	/**
	 * * 
	 * @author Suneesh Saleen 
	 * under AbileTechnologies 
	 * suneesh0388@gamil.com
	 *  Class: Send group mail
	 *
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			
			{
		HttpSession getSession=request.getSession();
		System.out.println("MAIL SERVICE");
		String mails =request.getParameter("mailId");
		String subject_to_be_given=request.getParameter("sub");
		String message_mi=request.getParameter("msg");
		//reciever_id
		String [] mm=mails.split(";");
		
		
		//
		ResultSet rs = null;
		
		 String sender_email="";
		String sender_password="";
		
		Connection con=UserConnection.userConnect();
		String prefix=getSession.getAttribute("prefix").toString();
		SMTPAuthenticatorsGroup.getPre(prefix);
		try {
			rs=con.createStatement().executeQuery("select mail,password from  "+prefix+"mailtable");
		
		while(rs.next())
		{
			sender_email=rs.getString(1);
			sender_password=rs.getString(2);
		}
		} catch (SQLException e) {
			System.out.println("Mail Not Configured");
			response.sendRedirect("UserMailError.jsp");
		}
		String sender_host = "smtp.gmail.com",//"smtp.gmail.com",
		sender_port = "465";  // 465
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
		 Authenticator auth = new SMTPAuthenticatorsGroup();
		 Session session = Session.getInstance(props, auth);
		 //session.setDebug(true);

		 MimeMessage msg = new MimeMessage(session);
		 msg.setText(message_mi);
		 msg.setSubject(subject_to_be_given);
		 msg.setFrom(new InternetAddress(sender_email));
		
		 for(int i=0;i<=mm.length-1;i++)
		 {
			 System.out.println("Now Sending "+mm[i]);
			 msg.addRecipient(Message.RecipientType.TO,new InternetAddress(mm[i]));
			 Transport.send(msg);
		 }
		 }
		 catch (Exception mex)
		 {
			 response.sendRedirect("UserMailError.jsp");
			 System.out.println("failed..! "+ mex);
			 
		 } 
		 response.sendRedirect("UserHome.jsp");
		}
	}
		//past code 

class SMTPAuthenticatorsGroup extends javax.mail.Authenticator
{
	String sender_email="";
	String sender_password="";
	
	static String getVal="";
	public static void getPre(String prefix)
	{
		getVal=prefix;
	}
	
	public PasswordAuthentication getPasswordAuthentication()
	{
		ResultSet rs1 = null;
		Connection con=UserConnection.userConnect();
		
		String pre=getVal;
		String prefix=pre+"mailtable";
		System.out.println("calling Static method value"+getVal);
		try {
			rs1=con.createStatement().executeQuery("select mail,password from  "+prefix);
			while(rs1.next())
			{
				sender_email=rs1.getString(1).trim();
				sender_password=rs1.getString(2).trim();
			}
		}
		catch(Exception e)
		{
			System.out.println("failed auth in serivce.SendFollowUpMail.java");
		}
		
			return new PasswordAuthentication(sender_email, sender_password);
	}
	
}
