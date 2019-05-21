package hw5;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		String modeString;
		Scanner sc = new Scanner(System.in);
		sc.useDelimiter("[\r\n]+");
		Document document = new Document();
		modeString = sc.next();
		switch (sc.next()) {
		case "Document":
			document = new Document();
			document.setText(sc.next());
			break;
		case "Email":
			Email barEmail = new Email();
			barEmail.setSender(sc.next());
			barEmail.setRecipient(sc.next());
			barEmail.setTitle(sc.next());
			barEmail.setText(sc.next());
			document = barEmail;
			break;
		case "File":
			File barFile = new File();
			barFile.setPathname(sc.next());
			barFile.setText(sc.next());
			document = barFile;
			break;
		default:
			System.out.println("document type identifier invalid");
			break;
		}
		switch (modeString) {
		case "A":
			System.out.print(document.toString());
			break;
		case "B":
			System.out.print(document.contains(sc.next()));
			break;
		case "C":
			switch (sc.next()) {
			case "text":
				document.setText(sc.next());
				break;
			case "sender":
				((Email)document).setSender(sc.next());
				break;
			case "recipient":
				((Email)document).setRecipient(sc.next());
				break;
			case "title":
				((Email)document).setTitle(sc.next());
				break;
			case "pathname":
				((File)document).setPathname(sc.next());
				break;
			default:
				System.out.println("member identifier invalid");
				break;
			}
			System.out.print(document.toString());
			break;
		default:
			System.out.println("execution mode identifier invalid%n");
			break;
		}
		sc.close();
	}

}
