package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpRetryException;
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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserConnection;

public class SendFollowUpMail extends HttpServlet {

	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		doPost(request, response);
		
		out.flush();
		out.close();
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out=response.getWriter();
		HttpSession presession =request.getSession();
		
		
		ResultSet rs = null;
		
		int count=0;
		
		String sender_email="";
		
		Connection con=UserConnection.userConnect();
		String prefix=presession.getAttribute("prefix").toString();
		 SMTPAuthenticatorsUser.getPre(prefix);
		 
		 try {
			rs=con.createStatement().executeQuery("select mail from  "+prefix+"mailtable");
		
		while(rs.next())
		{
			sender_email=rs.getString(1);
			count =count+1;
		}
		} catch (SQLException e) {
			System.out.println("Mail Not Configured");
		}
		
		
		String reciever_id=request.getParameter("mailId");
		String subject_to_be_given=request.getParameter("sub");
		String message_mi=request.getParameter("msg");
		//Past code 
		
		String sender_host = "smtp.gmail.com",
		sender_port = "465"; 
 		
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
		 Authenticator auth = new SMTPAuthenticatorsUser();
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
			 response.sendRedirect("UserMailError.jsp");
			 System.out.println("faileda..! "+ mex);
			 
		 } 
		 response.sendRedirect("FollowUp.jsp");
	}
		//past code 

}


class SMTPAuthenticatorsUser extends javax.mail.Authenticator
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
		
		try {
			rs1=con.createStatement().executeQuery("select mail,password from "+prefix);
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
