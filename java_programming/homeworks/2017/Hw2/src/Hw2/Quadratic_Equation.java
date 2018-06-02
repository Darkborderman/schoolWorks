package Hw2;

import java.lang.Math;
import java.util.Scanner;
import java.text.DecimalFormat;

public class Quadratic_Equation {
	public static void main(String args[]){
		
		Scanner scanner = new Scanner(System.in);
		
		double a = scanner.nextDouble();
		double b = scanner.nextDouble();
		double c = scanner.nextDouble();
		String d = scanner.next();
		
		DecimalFormat pattern = new DecimalFormat(d);
		
		double ans1;
		double ans2;
		double ansa;
		double ansb;
		
		ans1 = 0 - (b + Math.sqrt(Math.pow(b, 2) - 4 * a * c)) / (2 * a);
		ans2 = 0 - (b - Math.sqrt(Math.pow(b, 2) - 4 * a * c)) / (2 * a);
		
		if(a > 0)
		{
			if(ans1 > ans2)
			{
				ansa = ans1;
				ansb = ans2;
				String Ans1 = pattern.format(ansa);
				String Ans2 = pattern.format(ansb);
				System.out.printf("%s\n%s", Ans1,Ans2);
			}
			else
			{
				ansa = ans2;
				ansb = ans1;
				String Ans1 = pattern.format(ansa);
				String Ans2 = pattern.format(ansb);
				System.out.printf("%s\n%s", Ans1,Ans2);
			}
			
		}
		
		else if(a < 0)
		{
			if(ans1 > ans2)
			{
				ansa = ans2;
				ansb = ans1;
				String Ans1 = pattern.format(ansa);
				String Ans2 = pattern.format(ansb);
				System.out.printf("%s\n%s", Ans1,Ans2);
			}
			else
			{
				ansa = ans1;
				ansb = ans2;
				String Ans1 = pattern.format(ansa);
				String Ans2 = pattern.format(ansb);
				System.out.printf("%s\n%s", Ans1,Ans2);
			}
		}
	}
}
