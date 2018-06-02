package Hw5;

import java.util.Scanner;

public class Document {
	private String text;
	
	public Document(){}
	
	public Document(String theText){
		text = theText;
	}
	
	public String toString(){
		return text;
	}
	
	public void setText(String input){
		text = input;
	}

}
