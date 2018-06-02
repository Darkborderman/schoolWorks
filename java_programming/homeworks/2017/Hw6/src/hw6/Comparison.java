package hw6;

public class Comparison implements IOperation{
	public String perform(String num1,String num2){
		String result = "";
		int num1_length = num1.length();
		int num2_length = num2.length();
		char num1_symbol = num1.charAt(0);
		char num2_symbol = num2.charAt(0);
		int num1_head;
		int num2_head;
		int differ;
		int i;
		
		//x1.L > x2.L $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
		//x1 > x2 ******************************************************
		if(num1_length > num2_length && num1_symbol != '-'){
			result = "1";
		}
		
		//x1 > -x2 *****************************************************
		else if(num1_length > (num2_length - 1) && num1_symbol != '-'){
			result = "1";
		}
		
		//-x1 < x2 *****************************************************
		else if((num1_length - 1) > num2_length && num1_symbol == '-'){
			result = "-1";
		}
		
		//-x1 < -x2 *******************************************************
		else if((num1_length - 1) > (num2_length - 1) && num1_symbol == '-'){
			result = "-1";
		}
		
		//x1.L < x2.L $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
		//x1 < x2 && -x1 < x2 ******************************************
		else if(num1_length < num2_length && num2_symbol != '-'){
			result = "-1";
		}
		
		else if((num1_length - 1) < num2_length && num2_symbol != '-'){
			result = "-1";
		}
		
		//x1 > -x2 *****************************************************
		else if(num1_length < (num2_length - 1) && num2_symbol == '-'){
			result = "1";
		}
		
		//-x1 > -x2 ******************************************************
		else if((num1_length - 1) < (num2_length - 1) && num2_symbol == '-'){
			result = "1";
		}
		
		//x1.L = x2.L $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
		//x1 vs x2 *****************************************************
		else if(num1_length == num2_length && (num1_symbol != '-' && num2_symbol != '-')){
			for(i = 0;i < num1_length;i++){
				num1_head = Character.getNumericValue(num1.charAt(i));
				num2_head = Character.getNumericValue(num2.charAt(i));
				differ = num1_head - num2_head;
				
				if(differ > 0){
					result = "1";
					break;
				}
				
				else if(differ < 0){
					result = "-1";
					break;
				}
				else if(differ == 0 && i == num1_length - 1){
					result = "0";
				}
			}			
		}
		
		//-x1 < x2 ****************************************************************************
		else if((num1_length - 1) == num2_length && (num1_symbol == '-' && num2_symbol != '-')){
			result = "-1";
		}
		
		//x1 > -x2 ****************************************************************************
		else if(num1_length == (num2_length - 1) && (num1_symbol != '-' && num2_symbol == '-')){
			result = "1";
		}
		
		//-x1 vs -x2 ***************************************************************************
		else if(num1_length == num2_length && (num1_symbol == '-' && num2_symbol == '-')){
			for(i = 1;i < num1_length;i++){
				num1_head = Character.getNumericValue(num1.charAt(i));
				num2_head = Character.getNumericValue(num2.charAt(i));
				differ = num1_head - num2_head;
				
				if(differ > 0){
					result = "-1";
					break;
				}
				
				else if(differ < 0){
					result = "1";
					break;
				}
				else if(differ == 0 && i == num1_length - 1){
					result = "0";
				}
			}
		}		
		
		return result;
	}
}
