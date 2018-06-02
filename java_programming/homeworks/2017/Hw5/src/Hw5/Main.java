package Hw5;

import java.util.Scanner;

public class Main {
	public static void main(String args[]){
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("Please input the mode");
		String mode = scanner.nextLine();
		System.out.println("Please input the type");
		String type = scanner.nextLine();
		
		if(mode.equals("A")|| mode.equals("a")){
			if(type.equals("Document") || type.equals("document")){
				System.out.println("Please input the text");
				String text_in = scanner.nextLine();
				
				Document docu = new Document(text_in);
				System.out.println(docu.toString());
			}
			
			else if(type.equals("Email") || type.equals("email")){
				System.out.println("Please input the sender");
				String sender_in = scanner.nextLine();
				System.out.println("Please input the recipient");
				String reci_in = scanner.nextLine();
				System.out.println("Please input the title");
				String title_in = scanner.nextLine();
				System.out.println("Please input the text");
				String text_in = scanner.nextLine();
				
				Email mail = new Email(sender_in,reci_in,title_in,text_in);
				System.out.println("From : " + mail.getSender());
				System.out.println("To : " + mail.getRecipient());
				System.out.println("Title : " + mail.getTitle());
				System.out.println(mail.toString());
			}
			
			else if(type.equals("File") || type.equals("file")){
				System.out.println("Please input the path");
				String path_in = scanner.nextLine();
				System.out.println("Please input the text");
				String text_in = scanner.nextLine();
				
				File f = new File(path_in,text_in);				
				System.out.println(f.getPathname());
				System.out.println(f.toString());
			}
		}
		
		else if(mode.equals("B") || mode.equals("b")){
			if(type.equals("Document") || type.equals("document")){
				System.out.println("Please input the text");
				String text_in = scanner.nextLine();
				System.out.println("Please input the keyword");
				String key = scanner.nextLine();
				
				Document docu = new Document(text_in);
				
				if(text_in.contains(key)){
					System.out.println("true");
				}
				else{
					System.out.println("false");
				}
			}
			
			else if(type.equals("Email") || type.equals("email")){
				System.out.println("Please input the sender");
				String sender_in = scanner.nextLine();
				System.out.println("Please input the recipient");
				String reci_in = scanner.nextLine();
				System.out.println("Please input the title");
				String title_in = scanner.nextLine();
				System.out.println("Please input the text");
				String text_in = scanner.nextLine();
				System.out.println("Please input the keyword");
				String key = scanner.nextLine();
				
				Email mail = new Email(sender_in,reci_in,title_in,text_in);
				
				if(text_in.contains(key)){
					System.out.println("true");
				}
				else{
					System.out.println("false");
				}
			}
			
			else if(type.equals("File") || type.equals("file")){
				System.out.println("Please input the path");
				String path_in = scanner.nextLine();
				System.out.println("Please input the text");
				String text_in = scanner.nextLine();
				System.out.println("Please input the keyword");
				String key = scanner.nextLine();
				
				File f = new File(path_in,text_in);
				
				if(text_in.contains(key)){
					System.out.println("true");
				}
				else{
					System.out.println("false");
				}
			}
		}
		
		else if(mode.equals("C") || mode.equals("c")){
			if(type.equals("Document") || type.equals("document")){
				System.out.println("Please input the text");
				String text_in = scanner.nextLine();
				System.out.println("Please input the type to change (text)");
				String change_mode = scanner.nextLine();
				System.out.println("Please input the text to change");
				String change = scanner.nextLine();
				
				Document docu = new Document(text_in);
				
				docu.setText(change);
				System.out.println(docu.toString());				
			}
			
			else if(type.equals("Email") || type.equals("email")){
				System.out.println("Please input the sender");
				String sender_in = scanner.nextLine();
				System.out.println("Please input the recipient");
				String reci_in = scanner.nextLine();
				System.out.println("Please input the title");
				String title_in = scanner.nextLine();
				System.out.println("Please input the text");
				String text_in = scanner.nextLine();
				System.out.println("Please input the type to change (sender,recipient,title or text)");
				String change_mode = scanner.nextLine();
				
				Email mail = new Email(sender_in,reci_in,title_in,text_in);
				
				if(change_mode.equals("sender")){
					System.out.println("Please input the sender to change");
					String change = scanner.nextLine();
					mail.setSender(change);
					
					System.out.println("From : " + mail.getSender());
					System.out.println("To : " + mail.getRecipient());
					System.out.println("Title : " + mail.getTitle());
					System.out.println(mail.toString());
				}
				
				else if(change_mode.equals("recipient")){
					System.out.println("Please input the recipient to change");
					String change = scanner.nextLine();
					mail.setRecipient(change);
					
					System.out.println("From : " + mail.getSender());
					System.out.println("To : " + mail.getRecipient());
					System.out.println("Title : " + mail.getTitle());
					System.out.println(mail.toString());
				}
				
				else if(change_mode.equals("title")){
					System.out.println("Please input the title to change");
					String change = scanner.nextLine();					
					mail.setTitle(change);
					
					System.out.println("From : " + mail.getSender());
					System.out.println("To : " + mail.getRecipient());
					System.out.println("Title : " + mail.getTitle());
					System.out.println(mail.toString());					
				}
				else if(change_mode.equals("text")){
					System.out.println("Please input the text to change");
					String change = scanner.nextLine();
					mail.setText(change);
					
					System.out.println("From : " + mail.getSender());
					System.out.println("To : " + mail.getRecipient());
					System.out.println("Title : " + mail.getTitle());
					System.out.println(mail.toString());
				}
			}
			
			else if(type.equals("File") || type.equals("file")){
				System.out.println("Please input the path");
				String path_in = scanner.nextLine();
				System.out.println("Please input the text");
				String text_in = scanner.nextLine();
				System.out.println("Please input the type to change (pathname or text)");
				String change_mode = scanner.nextLine();
				
				File f = new File(path_in,text_in);
				if(change_mode.equals("pathname")){
					System.out.println("Please input the path to change");
					String change = scanner.nextLine();
					f.setPathname(change);
					System.out.println(f.getPathname());
					System.out.println(f.toString());					
				}
				else if(change_mode.equals("text")){
					System.out.println("Please input the text to change");
					String change = scanner.nextLine();
					f.setText(change);
					System.out.println(f.getPathname());
					System.out.println(f.toString());					
				}				
			}
		}
	}
}
