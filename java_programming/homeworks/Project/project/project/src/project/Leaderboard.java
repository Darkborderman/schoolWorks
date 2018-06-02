package project;

import java.awt.Color;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

import java.io.FileInputStream;
import java.io.ObjectInputStream;//輸入檔案

import java.io.FileOutputStream;
import java.io.ObjectOutputStream;//輸出檔案

import java.util.Scanner;



public class Leaderboard {
	public static void main(String[] args){
		JFrame frame = new JFrame("leaderboard");
		frame.setSize(800, 600);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setBackground(Color.PINK);
		
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
		
		
		JLabel[] lbnum = new JLabel[3];
		for(int i = 0; i< 3; i++ ){
			lbnum[i]= new JLabel(Integer.toString(i+1));
			lbnum[i].setLocation(50,100+100*i);
			lbnum[i].setSize(50,50);
			frame.add(lbnum[i]);
		}
		
		
		JLabel[] lbname = new JLabel[3];
		for(int i = 0; i< 3; i++ ){
			lbname[i]= new JLabel(leaderboard[i].getName());
			lbname[i].setLocation(100,100+100*i);
			lbname[i].setSize(200,50);
			frame.add(lbname[i]);
		}
		
		JLabel[] lbscore = new JLabel[3];
		for(int i = 0; i< 3; i++ ){
			lbscore[i]= new JLabel(Integer.toString(leaderboard[i].getScore()));
			lbscore[i].setLocation(300,100+100*i);
			lbscore[i].setSize(200,50);
			frame.add(lbscore[i]);
		}
		
		JLabel[] lbtitle = new JLabel[2];
		lbtitle[0]= new JLabel("Name");
		lbtitle[0].setLocation(100,50);
		lbtitle[0].setSize(200,50);
		frame.add(lbtitle[0]);
		lbtitle[0]= new JLabel("Score");
		lbtitle[0].setLocation(300,50);
		lbtitle[0].setSize(200,50);
		frame.add(lbtitle[0]);
		
		
		frame.setLayout(null);
		frame.setVisible(true);
		
		
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
