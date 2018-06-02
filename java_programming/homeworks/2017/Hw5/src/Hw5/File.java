package Hw5;

import java.util.Scanner;

public class File extends Document{
	private String pathname;
	
	public File(String thePathname,String theText){
		super(theText);
		pathname = thePathname;
	}
	
	public String toString(){
		return super.toString(); 
	}
	
	public String getPathname(){
		return pathname;
	}
	
	public void setPathname(String input){
		pathname = input;
	}
	

}
