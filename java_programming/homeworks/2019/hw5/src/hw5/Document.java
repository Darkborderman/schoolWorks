package hw5;

public class Document {
	public String toString() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public boolean contains(String pattern) {
		return text.contains(pattern);
	}
	
	protected String text;
}
