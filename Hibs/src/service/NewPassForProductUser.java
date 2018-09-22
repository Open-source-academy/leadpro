package service;

import java.util.Random;

public class NewPassForProductUser {
	static String genPass()
	{
		StringBuilder passWoordGen=new StringBuilder();
		String pass="";
		for(int j=0;j<15;j++)
		{
			Random r1 = new Random();
			char c1 = (char) (r1.nextInt(26) + 'a');
			passWoordGen.append(c1);
			
		}
		pass=passWoordGen+"Hibs";
		return pass;
		
	}
	public static void main(String s[])
	{
		System.out.println(genPass());
	}

}
