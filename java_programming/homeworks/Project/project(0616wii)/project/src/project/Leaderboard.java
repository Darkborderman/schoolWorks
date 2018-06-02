package project;

import java.awt.Color;


import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;


import java.io.FileInputStream;
import java.io.ObjectInputStream;//輸入檔案

import java.io.FileOutputStream;
import java.io.ObjectOutputStream;//輸出檔案

import java.util.Scanner;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;



public class Leaderboard {
	private static boolean start = false;
	public boolean getRestart(){return start;}
	
	public Leaderboard(String name,int score){
		JFrame frame = new JFrame("leaderboard");
		frame.setSize(900, 730);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setBackground(Color.BLACK);
		JLabel record = new JLabel();	
		/*
		Scanner scanner = new Scanner(System.in);
		String name = new String(scanner.next());
		int score = scanner.nextInt();
		scanner.close();//吃參數
		*/
	
		
		Leader[] leaderboard= new Leader[10];
		for(int i = 0; i < 10; i++){
			leaderboard[i]= new Leader(" ",0);
		}//初始化
			
		try {
			ObjectInputStream ois = new ObjectInputStream(new FileInputStream("d:\\record.obj"));
			for(int i = 0; i < 10; i++){
				try{
					leaderboard[i]= new Leader(ois.readUTF(), ois.readInt());
				}catch(Exception e){}
			}
			ois.close();//讀檔
			//System.out.println("完成讀檔");
			
			for(int i = 0; i < 10; i++){
				if(score > leaderboard[i].getScore()){
					for( int j = 9 ; j > i ; j-- ){
							leaderboard[j] = new Leader(leaderboard[j-1].getName(), leaderboard[j-1].getScore());
					}
					leaderboard[i]=new Leader(name,score);
					record.setText("BREAK THE RECORD!");
					
					break;
				}
				else{
					record.setText("Failed.");
				}
			}//比較
			
			
		} catch (Exception e) {
			//System.out.println("進入catch");
			leaderboard[0] = new Leader(name, score);
		}//沒有記錄檔時
		
		record.setLocation(100,50);
		record.setSize(300,50);
		record.setForeground(Color.pink);
		frame.add(record);
		
		JLabel lbtitle = new JLabel();
		lbtitle= new JLabel("Name");
		lbtitle.setLocation(350,50);
		lbtitle.setSize(400,50);
		lbtitle.setForeground(Color.yellow);
		frame.add(lbtitle);
		
		lbtitle= new JLabel("Score");
		lbtitle.setLocation(700,50);
		lbtitle.setSize(400,50);
		lbtitle.setForeground(Color.yellow);
		frame.add(lbtitle);
		
		
		JLabel[] lbnum = new JLabel[10];
		JLabel[] lbname = new JLabel[10];
		JLabel[] lbscore = new JLabel[10];
		
		for(int i = 0; i< 10; i++ ){
			lbnum[i]= new JLabel(Integer.toString(i+1));
			lbnum[i].setLocation(100,100+50*i);
			lbnum[i].setSize(50,50);
			lbnum[i].setForeground(Color.white);
			frame.add(lbnum[i]);
			
			lbname[i]= new JLabel(leaderboard[i].getName());
			lbname[i].setLocation(350,100+50*i);
			lbname[i].setSize(200,50);
			lbname[i].setForeground(Color.blue);
			frame.add(lbname[i]);
			
			lbscore[i]= new JLabel(Integer.toString(leaderboard[i].getScore()));
			lbscore[i].setLocation(700,100+50*i);
			lbscore[i].setSize(200,50);
			lbscore[i].setForeground(Color.blue);
			frame.add(lbscore[i]);
			
		}
		
		
		JButton restart = new JButton("Restart");
		RestartListener restartlistener = new RestartListener();
		restart.addActionListener(restartlistener);
		restart.setSize(100,50);
		restart.setLocation(350,600);
		frame.add(restart);
		
		
		JButton exit = new JButton("Exit");
		ExitListener exitlistener = new ExitListener();
		exit.addActionListener(exitlistener);
		exit.setSize(100,50);
		exit.setLocation(700,600);
		frame.add(exit);
		
		
		
		
		frame.setLayout(null);
		frame.setVisible(true);
		
		
		try {
			ObjectOutputStream oos = new ObjectOutputStream(new	FileOutputStream("d:\\record.obj"));
			for(int i = 0; i < 10; i++){
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

	public static class ExitListener implements ActionListener{
		public void actionPerformed(ActionEvent e){
			System.exit(0);
		}
	}
	
	public static class RestartListener implements ActionListener{
		public void actionPerformed(ActionEvent e){
			start=true;
		}
	}
}





