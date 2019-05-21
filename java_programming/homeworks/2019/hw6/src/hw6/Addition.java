package hw6;

import java.text.DecimalFormat;

public class Addition implements IOperation{
	
	@Override
	public String perform(String num1, String num2) {
		int sign1 = 1, sign2 = 1;
		String resultString = null;
		if(num1.charAt(0) == '-') {
			num1 = num1.substring(1);
			sign1 = -1;
		}
		if(num2.charAt(0) == '-') {
			num2 = num2.substring(1);
			sign2 = -1;
		}
		if(sign1 * sign2 < 0) {
			Subtraction subtraction = new Subtraction();
			if(sign1 > 0 && sign2 < 0) {
				resultString = subtraction.perform(num1, num2);
			}else if(sign1 < 0 && sign2 > 0) {
				resultString = subtraction.perform(num2, num1);
			}
		}else{
			int i;
			int carry = 0;
			StringBuilder stringBuilder = new StringBuilder("");
			for(i = 0; i <= Math.min(num1.length(), num2.length()) - 1; ++i) {
				int lhs = num1.charAt(num1.length() - i - 1) - '0';
				int rhs = num2.charAt(num2.length() - i - 1) - '0';
				int sum = lhs + rhs + carry;
				carry = sum / 10;
				sum %= 10;
				stringBuilder.insert(0, Integer.toString(sum));
			}
			for(; i <= num1.length() - 1; ++i) {
				int lhs = num1.charAt(num1.length() - i - 1) - '0';
				int sum = lhs + carry;
				carry = sum / 10;
				sum %= 10;
				stringBuilder.insert(0, Integer.toString(sum));
			}
			for(; i <= num2.length() - 1; ++i) {
				int lhs = num2.charAt(num2.length() - i - 1) - '0';
				int sum = lhs + carry;
				carry = sum / 10;
				sum %= 10;
				stringBuilder.insert(0, Integer.toString(sum));
			}
			if(carry != 0) {
				stringBuilder.insert(0, carry);
			}
			if(sign1 == -1)
				stringBuilder.insert(0, '-');
			resultString = stringBuilder.toString();
		}
		return resultString;
	}
}
