package Hw5;

public class Email extends Document{
	
	private String sender;
	private String recipient;
	private String title;
	
	public String toString()
	{
		/*
		System.out.println("From:" + getSender());
		System.out.println("To:" + getRecipient());
		System.out.println("Title:" + getTitle());
		System.out.println(text);
		return text;
		*/
		
		String answer = "From: " + getSender() + "\nTo: " + getRecipient() + "\nTitle: " + getTitle() + "\n" +text;
		return answer;
		
	}
	
	public void setSender(String inputSender)
	{
		sender = inputSender;
	}
	
	public void setRecipient(String inputRecipient)
	{
		recipient = inputRecipient;
	}
	
	public String getSender()
	{
		return sender;
	}
	
	public String getRecipient()
	{
		return recipient;
	}
	
	public void setTitle(String inputTitle)
	{
		title = inputTitle;
	}
	
	public String getTitle()
	{
		return title;
	}

}
