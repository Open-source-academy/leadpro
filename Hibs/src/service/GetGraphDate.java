package service;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Vector;

import dao.UserConnection;

public class GetGraphDate {
//public Vector<Integer> getDate()
public static void main (String s[]){

	int i;
	Connection con;
	con=UserConnection.userConnect();
	ResultSet rs;
	Vector<Integer> date=new Vector<Integer>();
	Calendar now = Calendar.getInstance();
	now.add(Calendar.DATE,-6);
	for( i=6;i>=1;i--)
	{
	String after=(now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH )+1)+"-"+ + now.get(Calendar.DATE));
	now.add(Calendar.DATE,1);
	System.out.println(after);
	String sql=" select count(*) from  enquireydetails where dealdate='2012-10-17'";
	try {
		rs=con.createStatement().executeQuery(sql);
		while(rs.next())
		{
			//System.out.println("date="+rs.getInt(1));
			date.add(rs.getInt(1));
		}
	
	} catch (SQLException e) {
		System.out.println("error"+e);
	}}
	//return date;
	
}
}
