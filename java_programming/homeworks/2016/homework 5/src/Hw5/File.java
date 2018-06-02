package Hw5;

public class File extends Document{
	
	private String pathname;
	
	public String toString()
	{
		/*
		System.out.println("Path:" + getPathname());
		System.out.println(text);
		return text;
		*/
		String answer = "Path: " + getPathname() + "\n" +text ;
		return answer;
	}
	
	public void setPathname(String path)
	{
		pathname = path; 
	}
	
	public String getPathname()
	{
		return pathname;
	}

}
