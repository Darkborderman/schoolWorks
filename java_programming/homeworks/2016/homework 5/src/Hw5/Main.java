package Hw5;
import java.util.Scanner;

public class Main {
	
	public static void main(String[] args)
	{
		Scanner input = new Scanner(System.in);
		
		String mode = input.nextLine();
		String type = input.nextLine();
		
		switch (type)
		{
		case "Email":
			Email email = new Email();
			email.setSender(input.nextLine());
			email.setRecipient(input.nextLine());
			email.setTitle(input.nextLine());
			email.setText(input.nextLine());
			
			switch (mode)
			{
			case "A":
				System.out.println(email);
				break;
				
			case "B":
				String checkWord = input.nextLine();
				if(email.toString().indexOf(checkWord) >= 0)
				{
					System.out.println("true\n");
				}
				else
				{
					System.out.println("false\n");
				}
				break;
				
			case "C":
				String changeVariable = input.nextLine();
				
				switch (changeVariable)
				{
				case "text":
					email.setText(input.nextLine());
					break;
				
				case "sender":
					email.setSender(input.nextLine());
					break;
					
				case "recipient":
					email.setRecipient(input.nextLine());
					break;
					
				case "title":
					email.setTitle(input.nextLine());
					break;
					
				}
				System.out.println(email);
				break;
			}
			break;
			
			
		case "Document":
			Document document = new Document();
			document.setText(input.nextLine());
			
			switch (mode)
			{
			case "A":
				System.out.println(document.toString());
				break;
				
			case "B":
				String checkWord = input.nextLine();
				if (document.toString().indexOf(checkWord) >= 0)
				{
					System.out.println("true\n");
				}
				else
				{
					System.out.println("false\n");
				}
				break;
				
			case "C":
				String changeVariable = input.nextLine();
				document.setText(input.nextLine());
				System.out.println(document.toString());
				break;
			}
			break;
			
			
		case "File":
			File file = new File();
			file.setPathname(input.nextLine());
			file.setText(input.nextLine());
			
			switch (mode)
			{
			case "A":
				System.out.println(file);
				break;
				
			case "B":
				String checkWord = input.nextLine();
				if (file.toString().indexOf(checkWord) >= 0)
				{
					System.out.println("ture\n");
				}
				else
				{
					System.out.println("false\n");
				}
				break;
				
			case "C":
				String changeVariable = input.nextLine();
				if (changeVariable.equals("pathname"))
				{
					file.setPathname(input.nextLine());
				}
				else
				{
					input.nextLine();
					file.setText(input.nextLine());
				}
				System.out.println(file);
				break;
			}
			break;			
		
		}
		
		
	}

}
