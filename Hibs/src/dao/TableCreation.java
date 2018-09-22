package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import dao.DbConnection;
/**
 * 
 * @author Suneesh saleen 
 * under AbileTechnologies 
 * suneesh0388@gamil.com
 *  Class: creates users tables;....
 *  obj cmg from service.registration  
 *
 */

public class TableCreation {

	static Connection con=null;
	 Connection usrcon=null;
	static int tab=0;
	
	static String getUser="";
	static String getPass="";
	
	
	
	public static int createUser(String userName,String password,String dBName)
	{
		getUser=userName;
		getPass=password;
		
		con=DbConnection.connect();
		String host="localhost";
		String sql="create user '"+userName+"'@'"+host+"'  IDENTIFIED BY '"+password+"' " ;
		 try {
			//tab =con.createStatement().executeUpdate(sql);
			
			UserConnection.get(userName,password,dBName);  // need to send user name and pass word for create connection for 
			
			
		} catch (Exception e) {
			System.out.println("User Creation Failed....!"+ e);
		}
		
		return tab;
	}
	
	public  void createUserTables(String prefix,String userName,String password,String dBName)
	{
		String host="localhost";
		String tabName=prefix+"source";
		String sources[]={"News Paper","Poster","Internet","Tele Call","Media Advertisement","Reference"};
		//String PRIVILEGES="GRANT ALL PRIVILEGES ON "+dBName+"."+tabName+" TO '"+userName+"' @'"+host+"' IDENTIFIED BY '"+password+"'";
		
		PreparedStatement pst;
		
		usrcon=MasterDbDataCreation.dbConnection();
		try {
			usrcon.createStatement().executeUpdate("create table "+prefix+"source(id integer auto_increment not null,source varchar(90),primary key(id))");
			pst= usrcon.prepareStatement("insert into "+prefix+"source(source) values(?)");
			//usrcon.createStatement().executeUpdate(PRIVILEGES);
			
			
			for(int i=0;i<=sources.length-1;i++)
			{
				pst.setString(1, sources[i]);
				pst.executeUpdate();
				
			}
			// source data for every users... creates once the user register in web 
			
		} catch (Exception e) 
		{
			System.out.println("user table creation failed "+e);
		}
	}
	
	
	
	public void enqTableCreation(String prefix,String userName,String password,String dBName)
	{
		String host="localhost";
		String tabName=prefix+"enquireyDetails";
		String PRIVILEGES="GRANT ALL PRIVILEGES ON "+dBName+"."+tabName+" TO '"+userName+"' @'"+host+"' IDENTIFIED BY '"+password+"'";
		
		usrcon=MasterDbDataCreation.dbConnection();
		try {
			usrcon.createStatement().executeUpdate("create table "+prefix+"enquireyDetails(id integer auto_increment not null,name varchar(90),age varchar(3),phoneno varchar(15),mobileNo varchar(15),address varchar(90),email varchar(30),dealDate date,enqDate date,product varchar(50),source varchar(30),status varchar(90),primary key(id))");
			//usrcon.createStatement().executeUpdate(PRIVILEGES);
		} catch (SQLException e) {
			System.out.println("Enq table creation failed ..!!!");
		}
	}
	
	
	public void trashTables(String prefix,String userName,String password,String dBName)  // table for EnqTrash table 
	{
		String host="localhost";
		String tabName=prefix+"trash";
		String PRIVILEGES="GRANT ALL PRIVILEGES ON "+dBName+"."+tabName+" TO '"+userName+"' @'"+host+"' IDENTIFIED BY '"+password+"'";
		
		usrcon=MasterDbDataCreation.dbConnection();
		
		try{
			usrcon.createStatement().executeUpdate("create table "+prefix+"trash(id integer auto_increment not null,name varchar(90),phoneno varchar(15),mobileNo varchar(15),address varchar(90),email varchar(30),product varchar(50),source varchar(30),status varchar(90),trashdate date,primary key(id))");
			//usrcon.createStatement().executeUpdate(PRIVILEGES);
		}catch(Exception e)
		{
			System.out.println("Trash Tables creation Failed"+e);
		}
	}
	
	
	
	public void purchaseTable(String prefix,String userName,String password,String dBName)   // table for purchase table 
	{
		String host="localhost";
		String tabName=prefix+"purchaseTable";
		String PRIVILEGES="GRANT ALL PRIVILEGES ON "+dBName+"."+tabName+" TO '"+userName+"' @'"+host+"' IDENTIFIED BY '"+password+"'";
		
		usrcon=MasterDbDataCreation.dbConnection();
		
		try
		{
			usrcon.createStatement().executeUpdate("create table "+prefix+"purchaseTable(id integer auto_increment not null,name varchar(90),age varchar(3),dob date,phoneno varchar(15),mobileNo varchar(15),address varchar(90),email varchar(30),purchaseDate date,product varchar(50) ,source varchar(40),totalamount varchar(90),amountPaid varchar(90),primary key(id))");
			//usrcon.createStatement().executeUpdate(PRIVILEGES);
		}catch(Exception e)
		{
			System.out.println("purchase Table Creation Failed"+e);
		}
		
	}
	
	
	
	public void customerUpdationTable(String prefix,String userName,String password,String dBName)
	{
		String host="localhost";
		String tabName=prefix+"CUSTUPDATION";
		String PRIVILEGES="GRANT ALL PRIVILEGES ON "+dBName+"."+tabName+" TO '"+userName+"' @'"+host+"' IDENTIFIED BY '"+password+"'";

		usrcon=MasterDbDataCreation.dbConnection();
		
		try
		{
			usrcon.createStatement().executeUpdate("CREATE TABLE "+prefix+"CUSTUPDATION(UID INT AUTO_INCREMENT,ID INT , UPDATEDATE DATE,UPDATION VARCHAR(40),CONMODE VARCHAR(30),PRIMARY KEY(UID))");
			//usrcon.createStatement().executeUpdate(PRIVILEGES);
		}catch(Exception e)
		{
			System.out.println("Enq Updation Failed  "+e);
		}
	}
	
	
	
	public void adminLogin(String prefix,String userName,String password,String dBName)
	{
		String host="localhost";
		String tabName=prefix+"adminPass";
		String PRIVILEGES="GRANT ALL PRIVILEGES ON "+dBName+"."+tabName+" TO '"+userName+"' @'"+host+"' IDENTIFIED BY '"+password+"'";
		
		usrcon=MasterDbDataCreation.dbConnection();
		
		try
		{
			usrcon.createStatement().executeUpdate("create table "+prefix+"adminPass(admin varchar(30),password varchar(30))");
			usrcon.createStatement().executeUpdate("insert into "+prefix+"adminPass values('leadadmin','admin')");
			//usrcon.createStatement().executeUpdate(PRIVILEGES);
		}catch(Exception e)
		{
			System.out.println("Admin  Table Creation Failed "+e);
		}
	}
	
	
	
	public void mailTable(String prefix,String userName,String password,String dBName)
	{
		String host="localhost";
		String tabName=prefix+"mailTable";
		String PRIVILEGES="GRANT ALL PRIVILEGES ON "+dBName+"."+tabName+" TO '"+userName+"' @'"+host+"' IDENTIFIED BY '"+password+"'";
		
		usrcon=MasterDbDataCreation.dbConnection();
		try
		{
			usrcon.createStatement().executeUpdate("create table "+prefix+"mailTable (id INT AUTO_INCREMENT, mail varchar(40), password varchar(32),PRIMARY KEY(id))");
			//usrcon.createStatement().executeUpdate(PRIVILEGES);
		}catch(Exception e)
		{
			System.out.println("mailTable Creation failed in dao/TableCreationFailed "+e);
		}
	}
	

	
	public void mailTemp(String prefix,String userName,String password,String dBName)
	{
		String host="localhost";
		String tabName=prefix+"mailtemp";
		String PRIVILEGES="GRANT ALL PRIVILEGES ON "+dBName+"."+tabName+" TO '"+userName+"' @'"+host+"' IDENTIFIED BY '"+password+"'";
		
		usrcon=MasterDbDataCreation.dbConnection();
		try
		{
			usrcon.createStatement().executeUpdate("create table "+prefix+"mailtemp (id INT AUTO_INCREMENT,temp_name varchar(32),temp varchar(55535),PRIMARY KEY(id))");
			//usrcon.createStatement().executeUpdate(PRIVILEGES);
		}catch(Exception e)
		{
			System.out.println("mailTemp Creation failed in dao/TableCreationFailed "+e);
		}
	}
	
	//*************
	public void userTablesDetails(String prefix,String userName,String password,String dBName)
	{
		String host="localhost";
		String tabName=prefix+"mailtemp";
		//String PRIVILEGES="GRANT ALL PRIVILEGES ON "+dBName+"."+tabName+" TO '"+userName+"' @'"+host+"' IDENTIFIED BY '"+password+"'";
		
		String insertSql="insert into "+prefix+"userTablesDetails(tableLabel,tableName) values('mailtemp','"+prefix+"mailtemp' )";
		
		String insertSql1="insert into "+prefix+"userTablesDetails(tableLabel,tableName) values('mailTable','"+prefix+"mailTable' )";
		
		String insertSql2="insert into "+prefix+"userTablesDetails(tableLabel,tableName) values('source','"+prefix+"source' )";
		
		usrcon=MasterDbDataCreation.dbConnection();
		try
		{
			usrcon.createStatement().executeUpdate("create table "+prefix+"userTablesDetails (id INT AUTO_INCREMENT,tableLabel varchar(32),tableName varchar(30),PRIMARY KEY(id))");
			usrcon.createStatement().executeUpdate(insertSql);
			usrcon.createStatement().executeUpdate(insertSql1);
			usrcon.createStatement().executeUpdate(insertSql2);
			//usrcon.createStatement().executeUpdate(PRIVILEGES);
		}catch(Exception e)
		{
			System.out.println("userTablesDetails Creation failed in dao/TableCreationFailed "+e);
		}
	}
	
}
