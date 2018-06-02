package Hw4;

import java.util.Scanner;
import java.lang.Math;
import java.math.BigDecimal;

public class Babylonian_algorithm {
	public static void main(String args[])
	{
		Scanner scanner = new Scanner(System.in);
		double n = scanner.nextDouble();
		double guess = n / 2;
		double diff = Double.MAX_VALUE;
		double last = guess;
		
		while(Math.abs(diff) >= 0.01){
			double r = n / guess;
			guess = (guess + r) / 2;
			diff = ((guess - last) / last);
			last = guess;
		}
		
		
		double ans = new BigDecimal(guess).setScale(2, BigDecimal.ROUND_HALF_UP)
                .doubleValue();
		
		int result = (int)Math.sqrt(n);
		if(result == ans)
		{
			System.out.println(result);
		}
		else{
			System.out.println(ans);
		}
		//System.out.println(guess);
		

	}

}
