package hw4;

import java.text.DecimalFormat;
import java.util.Scanner;

public class main {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		double n, r, guess;
		n = scanner.nextDouble();
		guess = n / 2;
		do {
			r = n / guess;
			guess = (guess + r) / 2;
		} while (Math.abs((r - guess) / guess) > 0.01);
		DecimalFormat decimalFormat = new DecimalFormat("#.##");
		System.out.println(decimalFormat.format(guess));
	}

}
