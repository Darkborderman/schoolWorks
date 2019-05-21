package hw6;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String inputString = scanner.nextLine();
		scanner.close();
		scanner = new Scanner(inputString);
		IOperation operation = null;
		String num1, num2, operator;
		num1 = scanner.next();
		while(scanner.hasNext()) {
			operator = scanner.next();
			num2 = scanner.next();

			switch (operator) {
			case "+":
				operation = new Addition();
				break;
			case "-":
				operation = new Subtraction();
				break;
			default:
				operation = new Comparison(operator);
				break;
			}
			num1 = operation.perform(num1, num2);
		}
		
		System.out.print(num1);

		scanner.close();
	}

}
