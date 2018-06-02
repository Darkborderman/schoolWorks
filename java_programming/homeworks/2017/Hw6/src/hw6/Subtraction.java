package hw6;

public class Subtraction implements IOperation{
	public String perform(String num1,String num2){
		String result = "";
		int num1_length = num1.length();
		int num2_length = num2.length();
		int sub_1;
		int sub_2;
		int sum = 0;
		int carry = 0;
		int sub1;
		int sub2;
		sub1 = Character.getNumericValue(num1.charAt(0));
		sub2 = Character.getNumericValue(num2.charAt(0));
		
		if(num1_length > num2_length || (num1_length == num2_length && sub1 > sub2)){
			
			int i = num1_length;
			int j = num2_length;
			int []array = new int[i];
			
			while(i > 0){				
				if(j == 0){
					sub_1 = Character.getNumericValue(num1.charAt(i - 1));
					sum = sub_1 + carry;
					carry = 0;
					array[i - 1] = sum;
					i--;
				}
				else if(j > 0){
					sub_1 = Character.getNumericValue(num1.charAt(i - 1));
					sub_2 = Character.getNumericValue(num2.charAt(j - 1));
					if((sub_1 + carry) >= sub_2){
						sum = (sub_1 + carry - sub_2);
						carry = 0;
						array[i - 1] = sum;
					}
					else if((sub_1 + carry) < sub_2){
						sum = (sub_1 + carry + 10 - sub_2);
						carry = -1;
						array[i - 1] = sum;
					}					
					i--;
					j--;
				}
			}
			
			int c;
			for(c = 0;c < num1_length;c++){
				if(array[0] == 0) c++;
				result = result + Integer.toString(array[c]);
			}			
		}		
		
		else if(num1_length < num2_length || (num1_length == num2_length && sub1 < sub2)){
			
			int i = num1_length;
			int j = num2_length;
			int []array = new int[j];
			while(j > 0){
				if(i == 0){
					sub_2 = Character.getNumericValue(num2.charAt(j - 1));
					sum = sub_2 + carry;
					carry = 0;
					array[j - 1] = sum;
					j--;
				}
				else if(i > 0){
					sub_1 = Character.getNumericValue(num1.charAt(i - 1));
					sub_2 = Character.getNumericValue(num2.charAt(j - 1));
					if((sub_2 + carry) >= sub_1){
						sum = (sub_2 + carry - sub_1);
						carry = 0;
						array[j - 1] = sum;
					}
					else if((sub_2 + carry) < sub_1){
						sum = (sub_2 + carry + 10 - sub_1);
						carry = -1;
						array[j - 1] = sum;						
					}
					i--;
					j--;
				}
			}
			
			int c;
			result = "-";
			for(c = 0;c < num2_length;c++){
				if(array[0] == 0) c++;
				result = result + Integer.toString(array[c]);
			}
		}
		
		else if(num1_length == num2_length && sub1 == sub2){
			int i = num1_length;
			int j = num2_length;
			sub_1 = Character.getNumericValue(num1.charAt(i - 1));
			sub_2 = Character.getNumericValue(num2.charAt(j - 1));
			
			sum = sub_1 - sub_2;
			result = Integer.toString(sum);
		}
		
		return result;
	}
}
