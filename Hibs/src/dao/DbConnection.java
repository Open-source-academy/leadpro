package dao;

import java.sql.DriverManager;
import java.sql.Connection;
/**
 * 
 * @author Suneesh Saleen 
 * under AbileTechnologies 
 * suneesh0388@gamil.com
 *  Class: Creating connection to admin table .. when new user come for registration the every data will be store in USRINFO table 
 *  database can handle with product admin (Lead Pro Admin )
 *
 */

public class DbConnection {
	ConnectionParam cp;
		public static Connection connect()
		{
			Connection con=null;
			try{
				Class.forName(ConnectionParam.drive);
				con=DriverManager.getConnection(ConnectionParam.url,ConnectionParam.user,ConnectionParam.pass);
				
			}catch (Exception e) {
				System.out.println("Connection failed DbConnection.java ");
				
			}
			return con;
		}

}
