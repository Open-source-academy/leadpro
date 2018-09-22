package dao;

import java.sql.Connection;
import java.sql.SQLException;
/**
 * @author Suneesh Saleen 
 * under AbileTechnologies 
 * suneesh0388@gamil.com
 *  Class: creating product  table 
 *  table name will be user defined and the data too
 *  admin can create the table  
 *
 */
public class CreateProductTable {
	static Connection con=null;
	static Connection mastCon=null;
	static int tab=0;
	public static int tableMaster(String getTableName,String prefix,String database,String userName,String passWord,String host)
	{
		mastCon=MasterDbDataCreation.dbConnection();
		
		String tableName=prefix+getTableName;
		
		 String table ="CREATE TABLE "+tableName+"(id integer not null Auto_increment,primary key(id))";
		 String PRIVILEGES="GRANT ALL PRIVILEGES ON "+database+"."+tableName+" TO '"+userName+"' @'"+host+"' IDENTIFIED BY '"+passWord+"'";
		 
		 String insertSql="insert into "+prefix+"userTablesDetails(tableLabel,tableName) values('"+getTableName+"','"+tableName+"' )";
		 
		 try {
			tab=mastCon.createStatement().executeUpdate(table);
			mastCon.createStatement().executeUpdate(insertSql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("table cteate aaiella....!"+ e);
		}
		return tab;
		
	}
	public static int addFields(String table,String field,String type,String prefix) 
	{
		int tb=0;
		String tableName=prefix+table;
		String addme="alter table "+tableName+" add "+field+" "+type+"";
		System.out.println(addme);
		try {
			tb=mastCon.createStatement().executeUpdate(addme);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tb;
	}
}
