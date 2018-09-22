package service;

import java.util.ArrayList;



public class EmailList {

	public static  ArrayList<String> mailList(String[] email)
	{
		ArrayList<String> mail =new ArrayList<String>();
		   if (email != null) 
		   {
		      for (int i = 0; i < email.length; i++) 
		      {
		         mail.add(email[i]);
		      }
		   }
		   
		return mail;
	}
}
