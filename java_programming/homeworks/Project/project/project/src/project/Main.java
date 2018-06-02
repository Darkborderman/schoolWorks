package project;

import java.io.FileInputStream;
import java.io.ObjectInputStream;//輸入檔案

import java.io.FileOutputStream;
import java.io.ObjectOutputStream;//輸出檔案

import java.util.Scanner;


public class Main {
	public static void main(String[] args){
		
		Scanner scanner = new Scanner(System.in);
		String name = new String(scanner.next());
		int score = scanner.nextInt();
		scanner.close();
		
		Leader[] leaderboard= new Leader[3];
		for(int i = 0; i < 3; i++){
			leaderboard[i]= new Leader(" ",0);
		}//初始化
		
		try {
			ObjectInputStream ois = new ObjectInputStream(new FileInputStream("d:\\record.obj"));
			for(int i = 0; i < 3; i++){
				try{
					leaderboard[i]= new Leader(ois.readUTF(), ois.readInt());
				}catch(Exception e){}
			}
			ois.close();//讀檔
			System.out.println("完成讀檔");
						
			for(int i = 0; i < 3; i++){
				if(score > leaderboard[i].getScore()){
					for( int j = 2 ; j > i ; j-- ){
							leaderboard[j] = new Leader(leaderboard[j-1].getName(), leaderboard[j-1].getScore());
					}
					leaderboard[i]=new Leader(name,score);
					break;
				}
			}//比較
			
		} catch (Exception e) {
			System.out.println("進入catch");
			leaderboard[0] = new Leader(name, score);
		}//沒有記錄檔時
		
		for(int i = 0; i < 3; i++){
			try{
				System.out.println(leaderboard[i].getName()+" "+leaderboard[i].getScore());
			}catch(Exception e){}
		}//印出結果(要改為GUI
			
		
		
		
		
		
		
		
		try {
			ObjectOutputStream oos = new ObjectOutputStream(new	FileOutputStream("d:\\record.obj"));
			for(int i = 0; i < 3; i++){
				try{
					oos.writeUTF(leaderboard[i].getName());
					oos.writeInt(leaderboard[i].getScore());
				}catch(Exception e){}
			}
			oos.flush();
			oos.close();
		} catch (Exception e) {
				e.printStackTrace();
		}//輸出記錄檔
		
	}
	
}
