package project;

import java.awt.*;
import java.awt.event.MouseEvent;
import java.util.Scanner;

import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.JScrollPane;

@SuppressWarnings("serial")
public class project extends JFrame  
{	
	//wii
	 static project frm = new project();
	 static Map picture = new Map();
	 
	 static JScrollPane scroll;
	
	 public static void main(String args[])
	 {	 
		 Image logo = null;
		 try
		 {
			 logo = ImageIO.read(project.class.getResource( "/logo.png" ));
		 }
		 catch(Exception e)
		 {
			 ;
		 }
		 frm.setTitle("BB-10");
		 frm.setIconImage(logo);
		 frm.setResizable(false);
		 frm.setSize(900,940);
		 frm.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		 frm.add(picture);
		 frm.setVisible(true);
		 
		 
		 
		 Scanner scanner = new Scanner(System.in);
		gameover:  while(true)//�C������
			{
				playball.ballStart();
				int test = scanner.nextInt();//�ƹ��I�Ϊ�����
				if(test==1){
					 for(int j=14;j>0;j--)//����
					 {
						 for(int i=0;i<15;i++)
						 {
									
							 		if(picture.block[i][j-1].block.isVisible())
									{
										if(j==14)
										{
											break gameover ;
										}
							 			//System.out.println(i+" "+j);
									

							 				picture.add(picture.block[i][j].block);
											picture.block[i][j].number = picture.block[i][j-1].number ;
											picture.block[i][j-1].settingDisappear();
											picture.block[i][j].settingappear();
										
									}
									
									}
							
						 
					 }
					 
					 int[] guess = new int[15];
					 for(int a=0;a<10;a++)
					 {
						 guess[a] = 0 ;
					 }
					 //���ͷs���Ĥ@�C
					 for(int k=0;k<15;k++)
					 {
						guess[k] = ((int)(Math.random()*2));
						//System.out.println(guess[k]);
						 if(guess[k]==1)
						 {
							
							 //Map.blockLocation[0][k]=1 ;
							 picture.add(picture.block[k][0].block);
							 picture.block[k][0].settingappear();
							 
						 }
					 }
					 //���ͷs���@��
					 
				}
				/*if(//gameover){
					break;
				}*/
			}
		 	System.out.println("hi");
		 	Leaderboard leader = new Leaderboard(picture.username,0);
		 	//frm.add(leader);
		 //	frm.setVisible(true);
		 	if(leader.getRestart()){
		 		
		 	}
		 	
		 	
	 }
} 