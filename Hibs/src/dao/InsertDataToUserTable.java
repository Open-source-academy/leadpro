package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

/**
 * 
 * @author Suneesh saleen 
 * under AbileTechnologies 
 * suneesh0388@gamil.com
 *  Class: InsertDataToUserTable
 *  source: insertDataToTable.jsp 
 *
 */
public class InsertDataToUserTable {

	public int getData(String table,List<String> clmn,List<String> dta)
	{
		int insert=0;
		
		String qu="";
		String qu1="";
		String sql="insert into ";
		String sqlQ="";
		
		Connection con=null;
		
		Iterator< String> column=clmn.iterator();
		Iterator<String> data=dta.iterator();
		
		while(column.hasNext())
		{
			qu=qu+column.next()+",";
		}
		String col=qu.substring(0, qu.length()-1);
		System.out.println(col);
		while(data.hasNext())
		{
			qu1=qu1+"'"+data.next()+"',";
		}
		String val=qu1.substring(0, qu1.length()-1);
		System.out.println(val);
		
		sqlQ=sql+table+"("+col+") values("+val+")";
		
		System.out.println(" finally--->  "+sqlQ);
		
		con=UserConnection.userConnect();
		try {
			insert=	con.createStatement().executeUpdate(sqlQ);
		} catch (SQLException e) {
			System.out.println(" problem during data insertion...! "+e);
		}
		return insert;
		
	}
}
