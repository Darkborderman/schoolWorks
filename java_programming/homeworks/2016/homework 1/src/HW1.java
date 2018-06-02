
public class HW1 {
	public static void main(String[] args)
	{
		//去尋找一開始的目標是哪種
		int start = args[0].indexOf(">")+1;
		int end = args[0].indexOf("<",1);
		String words=args[0].substring(start,end);
		
		int temp=0;
		int length=words.length();
		
		//尋找要輸出的東西在哪
		if (args[0].indexOf(words,6)>0)
		{
			temp=args[0].indexOf(words,6);
		}
		
		//擷取只要輸出的部分
		int startPrint=temp+length+1;
		int endPrint=args[0].indexOf(">",startPrint-1);
		
		//去除掉有時候會出現的'/'
		char check=args[0].charAt(endPrint-1);
		if ( check=='/' )
		{
			endPrint--;
		}
		
		//若是startPrint和endPrint相差1而已表示沒有東西輸出
		if (endPrint-startPrint>1)
		{
			String target=args[0].substring(startPrint,endPrint);
			System.out.println(target);
		}
	
	}

}
