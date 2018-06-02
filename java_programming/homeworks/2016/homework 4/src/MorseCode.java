
public class MorseCode {


	int mode;
	static String [] codeTable = new String[26];
	static int startFind = 0;
	static int endFind = 1;
	static String moseCode;
	static int i = 0;
	static int moseLength;
	static String temp = "0";
		
	
		public static void main(String[] args)
		{
			//建立摩斯密碼表
			while(i<26)
			{
				startFind = args[0].indexOf("=",startFind+1);
				endFind = args[0].indexOf(";",endFind+1);
				moseCode = args[0].substring(startFind+1,endFind);
				moseLength = moseCode.length();
				
				for(int times1=0 ; times1<moseLength ; times1++)
				{
					if (moseCode.charAt(times1) == '.')
					{
						temp="1";
					}
					else if (moseCode.charAt(times1) == '-')
					{
						temp="111";
					}
					
					if (times1 == 0)
					{
						codeTable[i] = temp;
					}
					else if (times1!=0 && times1<=(moseLength-1) )
					{
						codeTable[i] = codeTable[i]+"0"+temp;
					}
				}
				i++;
			}
			
			
			//判斷模式 
			if (args[1].equals("encode"))
			{
				encode(args[2]);
			}
			else
			{
				System.out.println(decode(args[2]));
			}
			
			
		}
		
		//encode
		public static String encode(String inputWord)
		{
			String noncode = inputWord.toLowerCase();
			int length = noncode.length();
			
			for (int times2=0 ; times2<length ; times2++)
			{
				if (noncode.charAt(times2)== ' ')
				{
					System.out.print("0000000");
				}
				else
				{
					System.out.print(codeTable[(int)noncode.charAt(times2)-97]);
					if (times2+1 < length && noncode.charAt(times2+1) != ' ')
					{
						System.out.print("000");
					}
				}
			}
			
			return noncode;
		}

		//decode
		public static String decode(String inputWord)
		{
			String decodeLetter= "0";
			String encodeWord;
			String encodeLetter;
			int wordStart=0;
			int wordEnd=inputWord.indexOf("0000000",0);
			int letterStart=0;
			int letterEnd=inputWord.indexOf("000",0);
			
			int checkSpace = inputWord.indexOf("00000000",0);
			int checkWord = 0;
			int checkLetter = 0;
			
			if (checkSpace < 0)
			{
				while (wordStart>=0 && checkLetter>=0 && checkWord<=0)
				{
					//拆word(後面還有word)
					if (wordEnd >= 0)
					{
						letterStart = 0;
						encodeWord = inputWord.substring(wordStart, wordEnd);
						letterEnd=encodeWord.indexOf("000",letterStart);
						checkWord = encodeWord.indexOf("0000");
						
						if(checkWord < 0)
						{
							while(letterStart>=0 && checkLetter>=0)
							{
								//拆letter(後面還有letter)
								if (letterEnd >= 0)
								{
									encodeLetter=encodeWord.substring(letterStart, letterEnd);
									
									//解碼
									for(i=0 ; i<26 ; i++)
									{
										if (encodeLetter.compareTo(codeTable[i])==0)
										{
												decodeLetter = decodeLetter+(char)(i+65);
												break;
										}
										//若為table上沒有的碼，即錯誤
										else
										{
											if (i==25)
											{
												checkLetter = -1;
											}
										}
									}
									
									letterStart = letterEnd+3;
									letterEnd=encodeWord.indexOf("000",letterStart);
								}
								
								//拆letter(最後一個letter)
								else
								{
									encodeLetter=encodeWord.substring(letterStart);
									
									for(i=0 ; i<26 ; i++)
									{
										if (encodeLetter.compareTo(codeTable[i])==0)
										{
												decodeLetter = decodeLetter+(char)(i+65);
												break;
										}
										else
										{
											if (i==25)
											{
												checkLetter = -1;
											}
										}
									}
									
									letterStart = letterEnd;
								}							
							}
							
							decodeLetter = decodeLetter+" ";
							wordStart = wordEnd+7;
							wordEnd=inputWord.indexOf("0000000",wordStart);
						}
					}
					
					//拆word(最後一個word)
					else
					{
						letterStart = 0;
						encodeWord = inputWord.substring(wordStart);
						letterEnd=encodeWord.indexOf("000",letterStart);
						checkWord = encodeWord.indexOf("0000");
						
						if (checkWord < 0)
						{
							while(letterStart>=0 && checkLetter>=0)
							{
								if (letterEnd >= 0)
								{	
									encodeLetter=encodeWord.substring(letterStart, letterEnd);
									
									for(i=0 ; i<26 ; i++)
									{
										if (encodeLetter.compareTo(codeTable[i])==0)
										{
												decodeLetter = decodeLetter+(char)(i+65);
												break;
										}
										else
										{
											if (i==25)
											{
												checkLetter = -1;
											}
										}
									}
									
									letterStart = letterEnd+3;
									letterEnd=encodeWord.indexOf("000",letterStart);
								}
								else
								{
									encodeLetter=encodeWord.substring(letterStart);
									
									for(i=0 ; i<26 ; i++)
									{
										if (encodeLetter.compareTo(codeTable[i])==0)
										{
												decodeLetter = decodeLetter+(char)(i+65);
												break;
										}
										else
										{
											if (i==25)
											{
												checkLetter = -1;
											}
										}
									}
									
									letterStart = letterEnd;
								}
							}
			
							wordStart = wordEnd;
						}
					}
				}
				
				//若出現不合規定的模式，即輸出錯誤
				if (checkWord>0 || checkLetter<0 || decodeLetter=="0")
				{
					decodeLetter = "0*INVALID*";
				}
				
				decodeLetter = decodeLetter.substring(1);
				//System.out.println(decodeLetter);
				
			}
			else
			{
				decodeLetter = "*INVALID*";
			}
			
			return decodeLetter;
		}
}
