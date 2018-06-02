
public class Subtraction implements IOperation{
	
	public String perform(String num1,String num2)
	{
		int lengthNum1 = num1.length();
		int lengthNum2 = num2.length();
		int n1=0,n2=0;
		
		if (lengthNum1 > lengthNum2)
		{
			for (int i=lengthNum2 ; i!=lengthNum1 ; i++)
			{
				num2 = "0"+num2;
			}
		}
		else if (lengthNum1 < lengthNum2)
		{
			for (int i=lengthNum1 ; i!=lengthNum2 ; i++)
			{
				num1 = "0"+num1;
			}
		}
		
		String answer = "" ;
		int temp = 0;
		int count = 0;
		
		
		for (int cal=num1.length()-1 ; cal>=0 ; cal--)
		{
			n1 = (int)num1.charAt(cal)-48;
			n2 = (int)num2.charAt(cal)-48;
			
			if ((n1-n2-temp)<0)
			{
				temp=1;
				answer = Integer.toString((n1-n2+10))+answer;
				if (cal==0)
				{
					count = 1;
				}
			}
			else
			{
				answer = Integer.toString((n1-n2))+answer;
			}
		}
		if (count==1)
		{
			
		}
		
		
		return answer;
	}

}
