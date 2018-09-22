package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class MasterDbDataCreation {

	public static Connection dbConnection()
	{
		Connection con=null;
		try{
			Class.forName(ConnectionParam.drive);
			con=DriverManager.getConnection(ConnectionParam.userURL,ConnectionParam.user,ConnectionParam.pass);
		}catch (Exception e) {
			System.out.println("Connection failed MasterDbDataConnection.java ");
			
		}
		return con;
		
	}
}
