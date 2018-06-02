package Hw5;

public class Email extends Document{
	private String sender;
	private String recipient;
	private String title;
	
	public Email(String theSender,String theRecipient,String theTitle,String theText){
		super(theText);
		sender = theSender;
		recipient = theRecipient;
		title = theTitle;
	}
	
	public String toString(){
		return super.toString(); 
	}
	
	public String getSender(){
		return sender;
	}
	
	public String getRecipient(){
		return recipient;
	}
	
	public String getTitle(){
		return title;
	}
	
	public void setSender(String input){
		sender = input;
	}
	
	public void setRecipient(String input){
		recipient = input;
	}
	
	public void setTitle(String input){
		title = input;
	}

}
