package hw6;

public class Addition implements IOperation{
	public String perform(String num1,String num2){
		String result = "";
		int num1_length = num1.length();
		int num2_length = num2.length();
		int add_1;
		int add_2;
		int sum = 0;
		int carry = 0;
		
		if(num1_length >= num2_length){
			
			int i = num1_length;
			int j = num2_length;
			int []array = new int[i];
			
			while(i > 0){				
				if(j == 0){
					add_1 = Character.getNumericValue(num1.charAt(i - 1));
					sum = (add_1 + carry) % 10 ;
					carry = (add_1 + carry) / 10;
					array[i - 1] = sum;
					i--;
				}
				else if(j > 0){
					add_1 = Character.getNumericValue(num1.charAt(i - 1));
					add_2 = Character.getNumericValue(num2.charAt(j - 1));
					sum = (add_1 + add_2 + carry) % 10 ;
					carry = (add_1 + add_2 + carry) / 10;
					array[i - 1] = sum;
					i--;
					j--;
				}
			}
			int c;
			
			if(carry == 0){
				for(c = 0;c < num1_length;c++){
					result = result + Integer.toString(array[c]);
				}
			}
			else{
				result = result + carry;
				for(c = 0;c < num1_length;c++){
					result = result + Integer.toString(array[c]);
				}
			}
			
		}
		
		else if(num1_length < num2_length){
			
			int i = num1_length;
			int j = num2_length;
			int []array = new int[j];
			while(j > 0){
				if(i == 0){
					add_2 = Character.getNumericValue(num2.charAt(j - 1));
					sum = (add_2 + carry) % 10 ;
					carry = (add_2 + carry) / 10;
					array[j - 1] = sum;
					j--;
				}
				else if(i > 0){
					add_1 = Character.getNumericValue(num1.charAt(i - 1));
					add_2 = Character.getNumericValue(num2.charAt(j - 1));
					sum = (add_1 + add_2 + carry) % 10 ;
					carry = (add_1 + add_2 + carry) / 10;
					array[j - 1] = sum;
					i--;
					j--;
				}
			}
			int c;
			if(carry == 0){
				for(c = 0;c < num2_length;c++){
					result = result + Integer.toString(array[c]);
				}
			}
			else{
				result = result + carry;
				for(c = 0;c < num2_length;c++){
					result = result + Integer.toString(array[c]);
				}
			}
		}
		
		return result;
	}

}
