package Hw3;

import java.util.Scanner;
import java.lang.Math;
import java.util.Arrays;

public class Special_Number {
	public static void main(String args[]) {
		Scanner scanner = new Scanner(System.in);

		long[] array = new long[1000000];
		array[0] = 1;

		int i, j, p, q = 0,l = 0;
		long num = 1;

		while (q < 999999) {
			for (i = 0; i < 100; i++) {
				for (j = 0; j < 100; j++) {
					for (p = 0; p < 100; p++) {
						num = (long) (Math.pow(2, p) * Math.pow(3, j) * Math.pow(5, i));
						array[q] = num;
						q++;
						//num++;
					}
				}
			}
		}
		Arrays.sort(array);

		String input = scanner.nextLine();

		
		
		if (input.startsWith("X")) {
			long value_x = Long.parseLong(input.substring(2));
			for (i = 0; i < 1000000; i++) {
				if (array[i] == value_x) {
					System.out.println("true");
					l = 1;
				}
				if(l == 0 && i == 999999){
					System.out.println("false");
				}
			}
		}

		else if (input.startsWith("Y")) {
			int value_y = Integer.parseInt(input.substring(2));
			System.out.println(array[value_y - 1]);
		}
	}
}
