import java.util.Arrays;

public class Hw3 {
	public static void main(String[] args)
	{
		//將輸入的字串分成數字和X、Y
		String inputNum = args[0].substring(2);
		//將字串轉成數字
		int x = Integer.parseInt(inputNum);
		int check=0;
		int mode;
		char input = args[0].charAt(0);
		
		//判斷是輸入X或Y
		if (input=='x' || input=='X')
		{
			mode = 1;
		}
		else
		{
			mode = 2;
		}
		
		//將輸入的數值做運算除法
		if (mode==1)
		{
			if (x!=1)
			{
				while ((x%2)==0)
				{
					x/=2;
				}
				while ((x%3)==0)
				{
					x/=3;
				}
				while ((x%5)==0)
				{
					x/=5;
				}
			}
			
			//判斷是否整除，若是則check=1
			if(x==1)
			{
				check=1;
			}
			else
			{
				check=0;
			}
			
			//是特別數就輸出true,反之輸出false
			if (check==1)
			{
				System.out.println("true");
			}
			else
			{
				System.out.println("false");
			}
		}
			
		
		
		if(mode==2)
		{
			int pow2=0,pow3=0,pow5=0;
			int index=0;
			double data=0;
			
			//建立表格存放所有的特別數
			int[] table = new int[6000];

			//產生1000個以內所有的特別數
			for( ; pow2<26 ; pow2++)
			{
				for( ; pow3<17 ; pow3++)
				{

					for( ; pow5<12 ; pow5++)
					{
						data = 1*Math.pow(2, pow2)*Math.pow(3,pow3)*Math.pow(5, pow5);
						table[index]= (int)data ;
						index++;
					}
					pow5=0;
				}
				pow3=0;
			}
			
			//對存放的表格做整理
			Arrays.sort(table);
			System.out.println(table[x+695]);
		}

	}

}



