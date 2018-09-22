package service;

import java.util.ArrayList;

public class MobileList {

	static public ArrayList<String> getMobile(String[] mobile)
	{
		
		ArrayList<String> phoneNo =new ArrayList<String>();
		   if (mobile != null) 
		   {
		      for (int i = 0; i < mobile.length; i++) 
		      {
		    	  phoneNo.add(mobile[i]);
		      }
		   }
		   
		return phoneNo;
	}
}
