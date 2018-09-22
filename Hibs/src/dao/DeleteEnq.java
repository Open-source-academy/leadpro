package dao;

import java.sql.Connection;
import java.sql.SQLException;

public class DeleteEnq {
	/**
	 * 
	 * @author Suneesh saleen 
	 * under AbileTechnologies 
	 * suneesh0388@gamil.com
	 *  Class: delete data from enq
	 *  desc: data coming from enqDel.jsp
	 *  Delete the Enquire  
	 */
	
	public int deleteEnq(String id)
	{
		Connection con;
		int del=0;
		con=UserConnection.userConnect();
		String sqlDel="delete from  enquireyDetails where id="+id;
		String sqlDelUp="delete from  custupdation where id="+id;
		
		try {
			del =con.createStatement().executeUpdate(sqlDel);
			con.createStatement().executeUpdate(sqlDelUp);
		} catch (SQLException e) {
			System.out.println("Deleting  failed...!");
		}
		return del;
		
	}
}
