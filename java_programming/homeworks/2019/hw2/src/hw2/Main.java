package hw2;

import java.text.DecimalFormat;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		double a, b, c;
		String formatString;
		a = sc.nextDouble();
		b = sc.nextDouble();
		c = sc.nextDouble();
		formatString = sc.next();

		double ans1, ans2, d;
		d = Math.sqrt(b * b - 4 * a * c);
		ans1 = (-b + d) / (2 * a);
		ans2 = (-b - d) / (2 * a);
		DecimalFormat dFormat = new DecimalFormat(formatString);
		System.out.println(dFormat.format(ans1));
		System.out.println(dFormat.format(ans2));

		sc.close();
	}
}
