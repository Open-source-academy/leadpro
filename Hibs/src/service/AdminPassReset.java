package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.UserConnection;

public class AdminPassReset {

	public int resetpass(String old,String newp)
	{
		int reset=0;
		Connection con;
		String sql=" update adminpass set password='"+newp+"' where password='"+old+"'";
		con=UserConnection.userConnect();
		try {
			reset=con.createStatement().executeUpdate(sql);
		} catch (SQLException e) {
			System.out.println("admin reset failed "+e);
		}
		return reset;
	}
}
