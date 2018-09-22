package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.DbConnection;

public class ResetPassUpdate {
	
	public static int resetPassUpdate(String email,String password)
	{
		Connection con;
		int update=0;
		String sql="update Hibs_UserDetails set password='"+password+"' where  email='"+email+"'";
		con=DbConnection.connect();
		
		try {
			update=con.createStatement().executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("exception in service/ResetPassUpdate.java "+e);
		}
		
		
		return update;
	}
}
