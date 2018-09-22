package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Calendar;

public class MoveTrash {

	/**
	 * 
	 * @author Suneesh saleen 
	 * under AbileTechnologies 
	 * suneesh0388@gamil.com
	 *  Class: for move data to trash \
	 *  desc: data coming from enqTrash.jsp
	 *
	 *	Sql1: move data to trash table 
	 *	sqldel: delete data from current table once ta data moved to trash
	 */
	
	
	public int trash(String id,String prefix)
	{
		Connection con;
		int ins=0;
		Calendar now=Calendar.getInstance();
		String today=(now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH )+1)+"-"+ + now.get(Calendar.DATE));
		con=UserConnection.userConnect();
		String sql="insert into "+prefix+"trash(name,phoneno,mobileNo,address,email,product,source,trashdate,status) select name,phoneno,mobileNo,address,email,product,source,'"+today+"',status from "+prefix+"enquireyDetails where id="+id;
		String sqlDel="delete from  "+prefix+"enquireyDetails where id="+id;
		String sqlDelUp="delete from  "+prefix+"custupdation where id="+id;
		try {
			ins=con.createStatement().executeUpdate(sql);
			con.createStatement().executeUpdate(sqlDel);
			con.createStatement().executeUpdate(sqlDelUp);
		} catch (SQLException e) {
			System.out.println("Moving failed...!");
		}
		return ins;
		
	}
}
