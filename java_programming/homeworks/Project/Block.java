package projectFinal;
import java.awt.BorderLayout;
import java.awt.Checkbox;
import java.awt.Color;
import java.awt.SecondaryLoop;
import java.io.FilterInputStream;
import java.util.ArrayList;

import javax.annotation.Generated;
import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.tools.DocumentationTool.Location;

public class Block {
	
	int location_i;
	int location_j;
	String number ;
	JLabel block = new JLabel("",SwingConstants.CENTER);
	public Block(){
		location_i = 0;
		location_j = 0 ;
		number = "";
		setting();
		
	}


	

	public void setting() {
		

		int count ;
		int i=0 , j=0 ;
		count = ((int)(Math.random()*100) + 1);
		String str = "" + count ;
		block.setText(str);
		number = str ;
		
		i= 40*((int)(Math.random()*20) + 1);
		location_i = i ;

		j= 0 ;
		location_j = j ;

		block.setLocation(i,j);
		block.setSize(40,40);
		block.setBorder(BorderFactory.createLineBorder(Color.red,2)); 
		block.setBackground(Color.red);
		block.setForeground(Color.red);
		
			}
	
	public static ArrayList<Block> generating(ArrayList<Block> E){
		
		int i = ((int)(Math.random()*10) + 1 );

		for(int j=0; j<i ; j ++)
		{
			Block lb1 = new Block();
			E.add(lb1) ;
		}
		return E;
	}
	
	public static void checkDelete(ArrayList<Block> E)
	{
	for(int i = 0; i<E.size();i++)
	{
		for(int j = i + 1 ; j<E.size();j++)
		{
			if(i==j)
			{
				continue ;
			}
			if(E.get(i).location_i==E.get(j).location_i)
			{
				E.get(i).block.setVisible(false);
				break ;
			}
		}
		
	}
		
		
	}

	
}

