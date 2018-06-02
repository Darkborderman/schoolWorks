package project;
import java.awt.Color;
import javax.swing.BorderFactory;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

public class Block {
	
	public int location_i;
	public int location_j;
	public int number ;
	public JLabel block = new JLabel("",SwingConstants.CENTER); ;
	public Block(){
		location_i = 0;
		location_j = 0 ;
		
		number = 0;
		block.setVisible(false);
		
	}


	

	public void initialSetting(int i,int j) {
		

		int count=0 ;
		int x=0 ,y=0;
		count = ((int)(Math.random()*5) + 1);
		String str = "" + count ;
		block.setText(str);
		number = count ;
		
		
		x =126 + 43*i;
		location_i = x ;

		y = 92 + 43*j ;
		location_j = y ;
		
		block.setLocation(x,y);
		block.setSize(40,40);
		block.setBorder(BorderFactory.createLineBorder(Color.red,2)); 
		block.setBackground(Color.red);
		block.setForeground(Color.red);
		
			}
	
	public void settingLocation(int i ,int j){
		int x=0,y=0 ;
		x =126 + 43*i;
		y = 92 + 43*j ;
		block.setLocation(x, y);
		location_i = x ;
		location_j = y ;
		
		
	}
	
	public void settingNumber(){
		number = number - 1 ;
		String str = "" + number ;
		block.setText(str);
		
	}
	
	public void settingDisappear(){
		
		block.setVisible(false);
	}
	public void settingappear(){
		
		block.setVisible(true);
	}
	
	public void locationEnd(int j){
		if(j>=740)
		{
			System.out.println("game over!");
			
		}
	}
	
	
	//摨��740
	//j:15
	//i:15
	//x : 126 + 43i
	//y : 92 + 43j
}

