package hw3;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		specIntegers.add(1);
		Scanner sc = new Scanner(System.in);
		sc.useDelimiter("[=\\s]");
		String c = sc.next();
		int num = sc.nextInt();
		switch (c) {
		case "X":
			for (; num % 2 == 0; num /= 2)
				;
			for (; num % 3 == 0; num /= 3)
				;
			for (; num % 5 == 0; num /= 5)
				;
			if (num == 1)
				System.out.println("true");
			else
				System.out.println("false");
			break;
		case "Y":
			System.out.println(getSpecial(num));
			break;
		default:
			break;
		}
		sc.close();
	}

	public static int getSpecial(int n) {
		for (int i = specIntegers.get(specIntegers.size() - 1) + 1; specIntegers.size() < n; ++i) {
			int num = i;
			for (; num % 2 == 0; num /= 2)
				;
			for (; num % 3 == 0; num /= 3)
				;
			for (; num % 5 == 0; num /= 5)
				;
			if (num == 1)
				specIntegers.add(i);
		}
		return specIntegers.get(n - 1);
	}

	private static ArrayList<Integer> specIntegers = new ArrayList<Integer>();
}
