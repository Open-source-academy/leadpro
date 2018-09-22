package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Calendar;

import dao.UserConnection;

public class MoveToPurchase {

	/**
	 * 
	 * @author Suneesh saleen 
	 * under AbileTechnologies 
	 * suneesh0388@gamil.com
	 *  Class: for move data to trash \
	 *  desc: data coming from FollowUp.jsp
	 *	Sql1: move data to purchase table 
	 *	sqldel: delete data from current table once ta data moved to purchase
	 */
	public int purchase(String id,String prefix)
	{
		Connection con;
		int ins=0;
		Calendar now=Calendar.getInstance();
		String today=(now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH )+1)+"-"+ + now.get(Calendar.DATE));
		con=UserConnection.userConnect();
		String sql1="insert into "+prefix+"purchasetable(name,age,phoneno,mobileNo,address,email,purchaseDate,product,source) select name,age,phoneno,mobileNo,address,email,'"+today+"',product,source from "+prefix+"enquireydetails where id="+id;           
		//String sql="insert into purchaseTable(name,phoneno,mobileNo,address,email,product,source,status) select name,phoneno,mobileNo,address,email,product,source,status from enquireyDetails where id="+id;
		String sqlDel="delete from  "+prefix+"enquireyDetails where id="+id;
		String sqlDelUp="delete from  "+prefix+"custupdation where id="+id;
		try {
			ins=con.createStatement().executeUpdate(sql1); // move ta date 
			con.createStatement().executeUpdate(sqlDel);  // del ta data
			con.createStatement().executeUpdate(sqlDelUp); // del updations 
		} catch (SQLException e) {
			System.out.println("Moving failed...!"+e+" and "+today);
		}
		return ins;
		
	}
}
