
public class Main {
	public static void main (String[] args)
	{
		int space = args[0].indexOf(" ");
		int firstward = 1;
		int secondward = 1;
		String input1 = "";
		String input2 = "";
		String operator = "";
		int amount = 0;
		String result = "";
		String check = "";
		
		//System.out.println(args[0]);
		
		if (args[0].substring(0, 1).equals("-"))
		{
			firstward=-1;
			input1 = args[0].substring(1, space);
		}
		else
		{
			input1 = args[0].substring(0, space);
		}
		
		
		while(space>=0)
		{
			args[0] = args[0].substring(space);
			operator = args[0].substring(1,2);
			space = args[0].indexOf(" ",1);

			if (args[0].substring(space+1,space+2).equals("-"))
			{
				secondward=-1;
				input2 = args[0].substring(space+2);
			}
			else
			{
				input2 = args[0].substring(space+1);
			}
			
			args[0] = args[0].substring(space+1);
			space = args[0].indexOf(" ",1);
			if (amount>0)
			{
				input1 = result;
			}
		
			
			IOperation operation1 = new Subtraction();
			IOperation operation2 = new Comparison();
			IOperation operation3 = new Addition();
			
			if (operator.equals("+"))
			{
				check = operation2.perform(input1,input2);
				if (firstward*secondward==1)
				{
					result = operation3.perform(input1,input2);
				}
				
				else if (firstward==-1 && secondward==1)
				{
					if (check.equals("large"))
					{
						result = "-" + operation1.perform(input1,input2);
					}
					else if (check.equals("small"))
					{
						result = operation1.perform(input2,input1);
					}
					else if (check.equals("equal"))
					{
						result = "0";
					}
				}
				else if (firstward==1 && secondward==-1)
				{
					if (check.equals("large"))
					{
						result = operation1.perform(input1,input2);
					}
					else if (check.equals("small"))
					{
						result = "-" + operation1.perform(input2,input1);
					}
					else if (check.equals("equal"))
					{
						result = "0";
					}
				}
				
			}
			else if(operator.equals("-"))
			{					
				check = operation2.perform(input1,input2);
				if (firstward*secondward==1)
				{
					if (check.equals("large"))
					{
						result = "-" + operation1.perform(input1,input2);
					}
					else if (check.equals("small"))
					{
						result = operation1.perform(input2,input1);
					}
					else if (check.equals("equal"))
					{
						result = "0";
					}
				}
				else if (firstward==-1 && secondward==1)
				{
					result = "-" + operation3.perform(input1,input2);
				}
				else if (firstward==1 && secondward==-1)
				{
					result = operation3.perform(input1,input2);
				}
				
			}
	
			else if (operator.equals(">"))
			{
				IOperation operation = new Comparison();
				result = operation.perform(input1,input2);
				if (result.equals("large"))
				{
					result = "true";
				}
				else
				{
					result = "false";
				}
			
			}
			else if (operator.equals("<"))
			{
				IOperation operation = new Comparison();
				result = operation.perform(input1,input2);
				
				if (result.equals("small"))
				{
					result = "true";
				}
				else
				{
					result = "false";
				}
			}
			else if (operator.equals("="))
			{
				IOperation operation = new Comparison();
				result = operation.perform(input1,input2);
				
				if (result.equals("equal"))
				{
					result = "true";
				}
				else
				{
					result = "false";
				}
			}
		}
		System.out.println(result);
		
	}

}
