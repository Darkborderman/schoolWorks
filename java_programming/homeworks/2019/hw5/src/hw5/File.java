package hw5;

public class File extends Document{
	public String toString() {
		return String.format("Path: %s%n%s", pathname, text);
	}
	public void setPathname(String pathname) {
		this.pathname = pathname;
	}
	public String getPathname() {
		return pathname;
	}
	public boolean contains(String pattern) {
		return super.contains(pattern) || pathname.contains(pattern);
	}
	
	
	private String pathname;
}
