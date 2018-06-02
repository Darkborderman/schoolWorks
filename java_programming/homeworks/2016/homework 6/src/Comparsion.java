
public class Comparsion implements IOperation {
	
	public String perform (String num1,String num2)
	{
		int lengthNum1 = num1.length();
		int lengthNum2 = num2.length();
		String compare = "";
		
		
		if (lengthNum1 > lengthNum2)
		{
			compare = "large";
			//System.out.println("true");
			//return "large";
		}
		else if (lengthNum1 < lengthNum2)
		{
			compare = "small";
			//System.out.println("false");
			//return "small";
		}
		else
		{
			int n1=0,n2=0;
			for (int i=0 ; i<lengthNum1 ; i++)
			{
				n1 = (int)num1.charAt(i)-48;
				n2 = (int)num2.charAt(i)-48;
				
				if (n1>n2)
				{
					compare = "large";
					break;
				}
				else if (n1<n2)
				{
					compare = "small";
					break;
				}
				else
				{
					compare = "equal";
				}
				
			}
		}
		return compare;
	}

}
