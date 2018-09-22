package dao;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 
 * @author Suneesh saleen 
 * under AbileTechnologies 
 * suneesh0388@gamil.com
 *  Class: creating db connection for users 
 *
 */
public class TestMe {

	static String sh()
	{
	 HttpServletRequest request = null;
	 HttpSession session=request.getSession();
	  String getUrl=session.getAttribute("userDataBase").toString();
	  String tmpurl="jdbc:mysql://localhost:3306/";
	  String url=tmpurl+getUrl;
	  
	  //*****************
	  
	  
	  
	Connection con=null;
	try{
		Class.forName(ConnectionParam.drive);
		con=DriverManager.getConnection(url,ConnectionParam.user,ConnectionParam.pass);
		
	}catch (Exception e) {
		System.out.println("failed in UserConnection"+e);
		//throw new RuntimeException();
		
	}
	return url;
}	
	
}
