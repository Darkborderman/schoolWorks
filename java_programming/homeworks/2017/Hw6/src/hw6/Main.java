package hw6;

import java.util.Scanner;

public class Main {
	public static void main(String args[]) {

		Scanner scanner = new Scanner(System.in);
		IOperation add = new Addition();
		IOperation sub = new Subtraction();
		IOperation com = new Comparison();

		String input = scanner.nextLine();

		int pos = 0;
		int length = input.length();
		int i;
		String num1 = "", num2 = "", result = "", temp;

		for (i = 0; i < length; i++) {
			// Addition $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
			if (input.charAt(i) == '+') {
				// -x1 + -x2 **********************************************************************
				if ((input.charAt(0) == '-' && pos == 0) || result.contains("-")) {
					if (input.charAt(i + 2) == '-') {
						if (pos == 0) {
							//System.out.println("-x1 + -x2");
							num1 = input.substring(1, i - 1);
							temp = input.substring(i + 2);
							if (temp.indexOf(' ') > 0) {
								num2 = temp.substring(1, temp.indexOf(' '));
								pos = temp.indexOf(' ') + i + 5;
							}

							else {
								num2 = temp.substring(1);
								pos = -1;
							}
							result = run(add, num1, num2);
							result = "-" + result;
						}

						else if (pos > 0) {
							temp = input.substring(pos);
							if (temp.indexOf(' ') > 0) {
								num2 = temp.substring(1, temp.indexOf(' '));
								pos = temp.indexOf(' ') + i + 5;
							}

							else {
								num2 = temp.substring(1);
								pos = -1;
							}
							result = run(add, result.substring(1), num2);
							result = "-" + result;
						}
					}
					
					// -x1 + x2 **************************************************************
					else{
						//System.out.println("-x1 + x2");
						if (pos == 0) {
							num1 = input.substring(1, i - 1);
							temp = input.substring(i + 2);
							if (temp.indexOf(' ') > 0) {
								num2 = temp.substring(0, temp.indexOf(' '));
								pos = temp.indexOf(' ') + i + 5;
							}

							else {
								num2 = temp;
								pos = -1;
							}
							result = run(sub, num2, num1);
							//result = "-" + result;
						}

						else if (pos > 0) {
							temp = input.substring(pos);
							if (temp.indexOf(' ') > 0) {
								num2 = temp.substring(0, temp.indexOf(' '));
								pos = temp.indexOf(' ') + i + 5;
							}

							else {
								num2 = temp;
								pos = -1;
							}
							result = run(sub, num2, result.substring(1));
							//result = "-" + result;
						}						
					}
				}
				
				
				// x1 + -x2 *********************************************************************
				else if(input.charAt(i + 2) == '-'){
					if (pos == 0) {
						//System.out.println("x1 + -x2");
						num1 = input.substring(0, i - 1);
						temp = input.substring(i + 2);
						if (temp.indexOf(' ') > 0) {
							num2 = temp.substring(1, temp.indexOf(' '));
							pos = temp.indexOf(' ') + i + 5;
						}

						else {
							num2 = temp.substring(1);
							pos = -1;
						}
						result = run(sub, num1, num2);
						//result = "-" + result;
					}

					else if (pos > 0) {
						temp = input.substring(pos);
						if (temp.indexOf(' ') > 0) {
							num2 = temp.substring(1, temp.indexOf(' '));
							pos = temp.indexOf(' ') + i + 5;
						}

						else {
							num2 = temp.substring(1);
							pos = -1;
						}
						result = run(sub, result, num2);
						//result = "-" + result;
					}
				}

				// x1 + x2 **********************************************************************
				else {
					//System.out.println("x1 + x2");
					if (pos == 0) {
						num1 = input.substring(0, i - 1);
						temp = input.substring(i + 2);

						if (temp.indexOf(' ') > 0) {
							num2 = temp.substring(0, temp.indexOf(' '));
							pos = temp.indexOf(' ') + i + 5;
						}

						else {
							num2 = temp;
							pos = -1;
						}
						result = run(add, num1, num2);
					} else if (pos > 0) {
						temp = input.substring(pos);
						if (temp.indexOf(' ') > 0) {
							num2 = temp.substring(0, temp.indexOf(' '));
							pos = temp.indexOf(' ') + i + 5;
						}

						else {
							num2 = temp;
							pos = -1;
						}
						result = run(add, result, num2);
					}
				}
			}

			// Subtraction$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
			else if (input.charAt(i) == '-' && input.charAt(i + 1) == ' ') {
				if (input.charAt(i + 2) == '-') {
					// -x1 - -x2 ***********************************************************************
					if ((input.charAt(0) == '-' && pos == 0) || result.contains("-")) {
						//System.out.println("-x1 - -x2");
						if (pos == 0) {
							num1 = input.substring(1, i - 1);
							temp = input.substring(i + 2);
							if (temp.indexOf(' ') > 0) {
								num2 = temp.substring(1, temp.indexOf(' '));
								pos = temp.indexOf(' ') + i + 5;
							}

							else {
								num2 = temp.substring(1);
								pos = -1;
							}
							result = run(sub, num2, num1);
						}

						else if (pos > 0) {
							temp = input.substring(pos);
							if (temp.indexOf(' ') > 0) {
								num2 = temp.substring(1, temp.indexOf(' '));
								pos = temp.indexOf(' ') + i + 5;
							}

							else {
								num2 = temp.substring(1);
								pos = -1;
							}
							result = run(sub, num2, result.substring(1));
							// result = "-" + result;
						}
					}

					// x1 - -x2 *****************************************************************************
					else {
						//System.out.println("x1 - -x2");
						if (pos == 0) {
							num1 = input.substring(pos, i - 1);
							temp = input.substring(i + 2);
							if (temp.indexOf(' ') > 0) {
								num2 = temp.substring(1, temp.indexOf(' '));
								pos = temp.indexOf(' ') + i + 5;
							}

							else {
								num2 = temp.substring(1);
								pos = -1;
							}
							result = run(add, num1, num2);
						}

						else if (pos > 0) {
							temp = input.substring(pos);
							if (temp.indexOf(' ') > 0) {
								num2 = temp.substring(1, temp.indexOf(' '));
								pos = temp.indexOf(' ') + i + 5;
							}

							else {
								num2 = temp.substring(1);
								pos = -1;
							}
							result = run(add, result, num2);
						}
					}
				}

				// -x1 - x2 ****************************************************************************
				else if ((input.charAt(0) == '-' && pos == 0) || result.contains("-")) {
					//System.out.println("-x1 - x2");
					if (pos == 0) {
						num1 = input.substring(1, i - 1);
						temp = input.substring(i + 2);
						if (temp.indexOf(' ') > 0) {
							num2 = temp.substring(0, temp.indexOf(' '));
							pos = temp.indexOf(' ') + i + 5;
						}

						else {
							num2 = temp;
							pos = -1;
						}
						result = run(add, num1, num2);
						result = "-" + result;
					}

					else if (pos > 0) {
						temp = input.substring(pos);
						if (temp.indexOf(' ') > 0) {
							num2 = temp.substring(0, temp.indexOf(' '));
							pos = temp.indexOf(' ') + i + 5;
						}

						else {
							num2 = temp;
							pos = -1;
						}
						result = run(add, result.substring(1), num2);
						result = "-" + result;
					}
				}

				// x1 - x2 ***********************************************************************************
				else {
					if (pos == 0) {
						//System.out.println("x1 - x2");
						num1 = input.substring(0, i - 1);
						temp = input.substring(i + 2);

						if (temp.indexOf(' ') > 0) {
							num2 = temp.substring(0, temp.indexOf(' '));
							pos = temp.indexOf(' ') + i + 5;
						}

						else {
							num2 = temp;
							pos = -1;
						}
						result = run(sub, num1, num2);
					} else if (pos > 0) {
						temp = input.substring(pos);
						if (temp.indexOf(' ') > 0) {
							num2 = temp.substring(0, temp.indexOf(' '));
							pos = temp.indexOf(' ') + i + 5;
						}

						else {
							num2 = temp;
							pos = -1;
						}
						result = run(sub, result, num2);
					}
				}
			}
			
			//Comparison $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
			else if(input.charAt(i) == '>' || input.charAt(i) == '<' || input.charAt(i) == '='){
				//System.out.println("Comparison");
				num1 = input.substring(0, i - 1);
				num2 = input.substring(i + 2);
				
				temp = run(com,num1,num2);
				
				if(input.charAt(i) == '>' && temp == "1"){
					result = "true";
				}
				
				else if(input.charAt(i) == '=' && temp == "0"){
					result = "true";
				}
				
				else if(input.charAt(i) == '<' && temp == "-1"){
					result = "true";
				}
				
				else{
					result = "false";
				}
			}
		}
		System.out.print(result);
		
		scanner.close();
	}

	public static String run(IOperation operation, String num1, String num2) {
		String result;
		result = operation.perform(num1, num2);
		return result;
	}
}
