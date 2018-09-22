package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


public class TopEnQInUserTable {

	public static int topId(String prefix)
	{
		Connection con=null;
		ResultSet rs;
		int get=0;
		con=UserConnection.userConnect();
		try {
			
			rs=con.createStatement().executeQuery("select max(id) from "+prefix+"enquireydetails");
			while(rs.next())
			{
				get=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("error in TopEnQInUserTable.java in dao pack" +e );
		}
		return get+1;
	}
}
