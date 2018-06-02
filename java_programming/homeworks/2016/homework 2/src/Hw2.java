import java.util.Scanner;
import java.lang.Math;
import java.text.DecimalFormat;
public class Hw2 {
	public static void main(String[] args)
	{
		double secondDegree ,firstDegree ,zeroDegree;
		Scanner scanner = new Scanner(System.in);
		
		//讀取各個的係數值
		secondDegree = scanner.nextDouble();
		firstDegree = scanner.nextDouble();
		zeroDegree = scanner.nextDouble();
		//讀取輸出樣式
		String format = scanner.next();
		
		
		DecimalFormat formatType = new DecimalFormat(format);
		double answerFirst,answerSecond;
		//check為判斷式D
		double check = Math.pow(firstDegree,2.0)-4*secondDegree*zeroDegree;
		
		
		//做運算和輸出答案
			answerFirst = ((-firstDegree)+Math.sqrt(check))/(2*secondDegree);
			answerSecond = ((-firstDegree)-Math.sqrt(check))/(2*secondDegree);
			System.out.println(formatType.format(answerFirst)+"\n"+formatType.format(answerSecond));
		
		
	}
}
