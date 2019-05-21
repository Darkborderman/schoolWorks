package hw6;

public class Comparison implements IOperation{
	public Comparison(String operationString) {
		this.operationString = operationString;
	}
	private String operationString;

	@Override
	public String perform(String num1, String num2) {
		if(operationString.equalsIgnoreCase(">")) {
			return Boolean.toString(greater(num1, num2));
		}else if(operationString.equalsIgnoreCase("=")) {
			return Boolean.toString(equals(num1, num2));
		}else {
			return Boolean.toString(!(greater(num1, num2) || equals(num1, num2)));
		}
	}
	
	private boolean greater(String num1, String num2) {
		int sign1 = 1, sign2 = 1;
		boolean resultBoolean = false;
		if(num1.charAt(0) == '-') {
			num1 = num1.substring(1);
			sign1 = -1;
		}
		if(num2.charAt(0) == '-') {
			num2 = num2.substring(1);
			sign2 = -1;
		}
		if(sign1 != sign2) {
			resultBoolean = sign1 == 1;
		}else {
			if(num1.length() != num2.length()) {
				resultBoolean = num1.length() > num2.length();	
			}else {
				for(int i = 0; i < num1.length(); ++i) {
					if(num1.charAt(i) > num2.charAt(i)) {
						resultBoolean = true;
						break;
					}else if(num1.charAt(i) < num2.charAt(i)) {
						resultBoolean = false;
						break;
					}
				}
			}
			if(sign1 == -1) {
				resultBoolean = !resultBoolean;
			}
		}
		return resultBoolean;
	}
	private boolean equals(String num1, String num2) {
		if(num1.length() != num2.length())
			return false;
		for(int i = 0; i < num1.length(); ++i) {
			if(num1.charAt(i) != num2.charAt(i))
				return false;
		}
		return true;
	}
}
