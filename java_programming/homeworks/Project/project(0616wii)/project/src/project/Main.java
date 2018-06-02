package project;

import java.awt.Color;
import java.util.Scanner;

import javax.swing.JFrame;


public class Main {
	public static void main(String[] args){
		/*Scanner scanner = new Scanner(System.in);
		String name = new String("Test");
		int score = 0;
		Leaderboard test = new Leaderboard(name,score);*/
		JFrame frame = new JFrame();
		frame.setSize(900, 730);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setBackground(Color.BLACK);
		Block block[][] = new Block[15][15] ;
		 
		 //initialize
		 for(int i=0;i<15;i++)
		 {
			 for(int j=0;j<15;j++)
			 {
				
				 block[i][j]= new Block();
				 //System.out.println(block[i][j].location_i);
				 
			 }
			 
		 }
		
		 for(int i=0;i<15;i++)
		 {
			 for(int j=0;j<15;j++)
			 {
				 block[i][j].initialSetting(i,j);
				 block[i][j].settingappear();
				 frame.add(block[i][j].block);
				 //System.out.println(block[i][j].location_i);
				 
			 }
			 
		 }
	}
	
}
