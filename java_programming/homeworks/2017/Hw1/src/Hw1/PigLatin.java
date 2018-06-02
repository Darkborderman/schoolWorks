package Hw1;

public class PigLatin {
	public static void main(String args[]){
		int i;
		String output_string = "";
		String temp;
		
		for(i = 0;i < args.length;i++){
			if(i == (args.length - 1)){
				if(args[i].startsWith("a")||args[i].startsWith("e")||args[i].startsWith("i")||args[i].startsWith("o")||args[i].startsWith("u")){
					temp = args[i].substring(0,1);
					output_string += args[i].substring(0,1).toUpperCase() + args[i].substring(1) + "ay";
					//System.out.printf("%say ",args[i]);
				}
				else{
					temp = args[i].substring(1,2);
					output_string += temp.toUpperCase() + args[i].substring(2) + args[i].substring(0,1)+ "ay";
					//System.out.printf("%s%say ",args[i].substring(1),args[i].substring(0,1));
				}
			}
			
			else{
				if(args[i].startsWith("a")||args[i].startsWith("e")||args[i].startsWith("i")||args[i].startsWith("o")||args[i].startsWith("u")){
					temp = args[i].substring(0,1);
					output_string += args[i].substring(0,1).toUpperCase() + args[i].substring(1) + "ay ";
					//System.out.printf("%say ",args[i]);
				}
				else{
					temp = args[i].substring(1,2);
					output_string += temp.toUpperCase() + args[i].substring(2) + args[i].substring(0,1)+ "ay ";
					//System.out.printf("%s%say ",args[i].substring(1),args[i].substring(0,1));
				}
			}
		}
		System.out.println(output_string);
	}
}
