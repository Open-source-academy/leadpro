package dao;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
/**
 * 
 * @author Suneesh saleen 
 * under AbileTechnologies 
 * suneesh0388@gamil.com
 *  Class: creating db connection for users 
 *
 */

public class UserConnection 
{
	public static String dbName="";
	public static String userName="";
	public static String passWord="";
	
	
	
	public static void  get(String getUserName,String getPassWord,String getDBName)  // coming from database creation file "TableCreation.java"
	{
		userName=getUserName;
		passWord=getPassWord;
		dbName=getDBName;
	}
	
	public static void getUserInfo(String getUserName,String getPassWord,String getDBName)    // getting database name from testDb.jsp 
	{
		userName=getUserName;
		passWord=getPassWord;
		dbName=getDBName;
		
	}
	
	
	 
	public static  Connection userConnect()
	{
		
		
		  String tmpurl="jdbc:mysql://localhost:3306/";
		  String url=tmpurl+dbName;
		  
		  //*****************
		 
		Connection con=null;
		try{
			
			Class.forName(ConnectionParam.drive);
			//con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hibs_hibsUserWorkingArea",""+userName+"",""+passWord+"");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hibs_hibsUserWorkingArea01","hibs_hibsdbuser","ZBnoME+AbileHibs+cbe");
			
		}catch (Exception e) {
			System.out.println("failed in UserConnection in dao/UserConnection.java "+e);
			
		}
		return con;
	}
	public static void main(String s[]) {
		userConnect();
		
	}
	
}
