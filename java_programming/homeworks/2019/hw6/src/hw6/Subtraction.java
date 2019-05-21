package hw6;

public class Subtraction implements IOperation{

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
			Addition addition = new Addition();
			if(sign1 > 0 && sign2 < 0) {
				resultString = addition.perform(num1, num2);
			}else if(sign1 < 0 && sign2 > 0) {
				resultString = addition.perform(num2, num1);
				resultString = "-".concat(resultString);
			}
		}else{
			int i;
			int borrow = 0;
			int resultSign = 1;
			if(new Comparison("<").perform(num1, num2) == "true") { // num1 < num2
				String tempString = num1;
				num1 = num2;
				num2 = tempString;
				resultSign = -1;
			}else if(new Comparison("=").perform(num1, num2) == "true") {
				return "0";
			}
			StringBuilder stringBuilder = new StringBuilder("");
			for(i = 0; i <= Math.min(num1.length(), num2.length()) - 1; ++i) {
				int lhs = num1.charAt(num1.length() - i - 1) - '0';
				int rhs = num2.charAt(num2.length() - i - 1) - '0';
				int sum = lhs - rhs - borrow;
				for(borrow = 0; sum < 0; sum += 10, ++borrow);
				stringBuilder.insert(0, Integer.toString(sum));
			}
			for(; i <= num1.length() - 1; ++i) {
				int lhs = num1.charAt(num1.length() - i - 1) - '0';
				int sum = lhs - borrow;
				for(borrow = 0; sum < 0; sum += 10, ++borrow);
				stringBuilder.insert(0, Integer.toString(sum));
			}
			for(; i <= num2.length() - 1; ++i) {
				int lhs = num2.charAt(num2.length() - i - 1) - '0';
				int sum = lhs - borrow;
				for(borrow = 0; sum < 0; sum += 10, ++borrow);
				stringBuilder.insert(0, Integer.toString(sum));
			}
			for(int j = 0; j < stringBuilder.length(); ++j) { // remove leading zeros
				if(stringBuilder.charAt(j) == '0') {
					stringBuilder.deleteCharAt(j);
				}else {
					break;
				}
			}
			if(resultSign == -1)
				stringBuilder.insert(0, '-');
			resultString = stringBuilder.toString();
		}
		return resultString;
	}

}
