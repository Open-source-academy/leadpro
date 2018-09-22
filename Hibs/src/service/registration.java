package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DbConnection;
import dao.TableCreation;


public class registration extends HttpServlet {

	String IName="";
	String Address1="";
	String Address2="";
	String Landmark="";
	String Profile="";
	String City="";
	String Pincode="";
	String otherlocation="";
	String website="";
	String phone="";
	String mobile="";
	String Fax="";
	String Email="";
	String Password="";
	Connection con=null;
	PreparedStatement pst;
	int ins=0;
	public void doget(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {doPost(request, response);}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		IName=request.getParameter("iName").toString();
		Address1=request.getParameter("address1").toString();
		Address2=request.getParameter("address2").toString();
		Landmark=request.getParameter("landmark").toString();
		Profile=request.getParameter("profile").toString();
		City=request.getParameter("city").toString();
		Pincode=request.getParameter("pincode").toString();
		otherlocation=request.getParameter("otherlocation").toString();
		website=request.getParameter("website").toString();
		phone=request.getParameter("phone").toString();
		mobile=request.getParameter("mobile").toString();
		Fax=request.getParameter("fax").toString();
		Email=request.getParameter("email").toString();
		Password=request.getParameter("password").toString();
		
		/*
		 * Generating random char for password and db name 
		 * pass word name will send to user mobile/email
		 * 
		 * User Db information ll save in UsrInfo..!
		 */
		StringBuilder s=new StringBuilder();
		StringBuilder passWoordGen=new StringBuilder();
		//random for create user 
		for(int i=0;i<5;i++)
		{
			Random r = new Random();
			char c = (char) (r.nextInt(26) + 'a');
			s.append(c);
			
		}
		//Random for Password
		for(int j=0;j<15;j++)
		{
			Random r1 = new Random();
			char c1 = (char) (r1.nextInt(26) + 'a');
			passWoordGen.append(c1);
			
		}
		String hostName="hibs_hibsdbuser";
		String prefix="hibs_"+s+"_";
		int ran=(int)(Math.random()*1000);
		String org=IName.replaceAll(" ", "");
		String userlogPassWord=passWoordGen+"2013";
		String userPassWord="ZBnoME+AbileHibs+cbe";
		String userName=hostName;
		String passWord="";
		String dBName=" hibs_hibsUserWorkingArea01";
		System.out.println("Your User name is ****** "+hostName+" *********");
		System.out.println("Your Pass word is ****** "+userPassWord+" *********");
		
		/*
		 * generating Date for give 30 days trial usage 
		 * ** check the date on every login time 
		 */
		Calendar now=Calendar.getInstance();
		now.add(Calendar.DATE, 30);
		String regDate=(now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH )+1)+"-"+ + now.get(Calendar.DATE));
		
		con= DbConnection.connect();   // admin DB  connecting here and every data will  store in admin dataBase 
		try {
			PreparedStatement pst= con.prepareStatement("insert into  Hibs_UserDetails(insname, Address1,address2,landmark,profile,city,pincode,location,web,phone,mobile,fax,email,password,Insdatabase,startdate,username,prefix,dbuserpass) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		
		
		pst.setString(1,IName);
		pst.setString(2,Address1);
		pst.setString(3,Address2);
		pst.setString(4,Landmark);
		pst.setString(5,Profile);
		pst.setString(6,City);
		pst.setString(7,Pincode);
		pst.setString(8,otherlocation);
		pst.setString(9,website);
		pst.setString(10,phone);
		pst.setString(11,mobile);
		pst.setString(12,Fax);
		pst.setString(13,Email);
		pst.setString(14,userlogPassWord);
		pst.setString(15,dBName);
		pst.setString(16,regDate);
		pst.setString(17,userName);
		pst.setString(18,prefix);
		pst.setString(19, userPassWord);
		ins=pst.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Exception in User Registeration "+e);
		}
		if(ins==1)
		{
			// Table Creations 
			// It create all default tables for every users 
			
			TableCreation.createUser(userName,userPassWord,dBName);  // set user dataBase 
			
			TableCreation ob=new TableCreation();
			
			ob.createUserTables(prefix,userName,userPassWord,dBName);     // creates users databases;
			ob.enqTableCreation(prefix,userName,userPassWord,dBName);
			ob.purchaseTable(prefix,userName,userPassWord,dBName);
			ob.trashTables(prefix,userName,userPassWord,dBName);
			ob.customerUpdationTable(prefix,userName,userPassWord,dBName);
			ob.adminLogin(prefix,userName,userPassWord,dBName);
			ob.mailTable(prefix,userName,userPassWord,dBName);
			ob.mailTemp(prefix,userName,userPassWord,dBName);
			ob.userTablesDetails(prefix,userName,userPassWord,dBName);
			
			session.setAttribute("toMail", Email);
			session.setAttribute("pass", userlogPassWord);
			response.sendRedirect("mailBox.jsp");
			
			//response.sendRedirect("ResetPass.html");
			
		}
		else
		{
			response.sendRedirect("error.html");
		}
		out.flush();
		out.close();
	}

}
