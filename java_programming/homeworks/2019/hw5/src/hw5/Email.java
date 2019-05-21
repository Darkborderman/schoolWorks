package hw5;

public class Email extends Document{
	public String toString() {
		return String.format("From: %s%nTo: %s%nTitle: %s%n%s", sender, recipient, title, text);
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getSender() {
		return sender;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle() {
		return title;
	}
	public boolean contains(String pattern) {
		return super.contains(pattern) || sender.contains(pattern)
				|| recipient.contains(pattern) || title.contains(pattern);
	}
	
	private String sender;
	private String recipient;
	private String title;
	
}
