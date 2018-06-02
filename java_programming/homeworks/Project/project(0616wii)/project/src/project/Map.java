package project;

import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Scanner;
import java.util.concurrent.BlockingDeque;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JLabel;

import java.util.Scanner;

@SuppressWarnings("serial")
public class Map extends JComponent implements ActionListener
{
	private Image back,secordImage,griddlers,btn1 = null,btn3 = null,btn4 = null,btn6 = null,btn7 = null,btn9 = null,ok1 = null,ok2 = null;
	private Graphics secordCanvas;
	public boolean start = false,btn1enter = false,btn2enter = false,btn3enter = false,press = false,press2 = false,press3 = false,howtoplay = false,setname = false,finish = false;
	private ObjectOutputStream oos = null;
	private ObjectInputStream ois = null;
	static JButton save = null,backbutton = null; 
	static JLabel imgLabel = new JLabel(new ImageIcon(Map.class.getResource( "/back2.jpg" )));
	static JLabel convince = new JLabel(new ImageIcon(Map.class.getResource( "/convince.jpg" )));
	static TextField user = new TextField();
	static String username;
	public Block block[][] = new Block[15][15] ;
	public int test;
	public Scanner scanner= new Scanner(System.in);
	Map() 
	{
		
		
		
		this.setLayout(null);
		this.add(convince);
		this.add(imgLabel);		
		convince.setBounds(0,-13,900,940);
		convince.setVisible(false);
		
		user.setLocation(200, 200);
		user.setSize(500, 100);
		user.setFont(new Font("monospaced", Font.BOLD, 80));

	
		save = new JButton(new ImageIcon(this.getClass().getResource( "/save.gif" )));
		save.setFocusable(false);  
		save.addActionListener(this); 
		save.setActionCommand("save");
		save.setLocation(155,600);
		save.setSize(150, 50);



		backbutton = new JButton(new ImageIcon(this.getClass().getResource( "/backbutton.gif" )));
		backbutton.setFocusable(false);  
		backbutton.addActionListener(this); 
		backbutton.setActionCommand("back");
		backbutton.setLocation(5,600);
		backbutton.setSize(150, 50);

			
		try
		{
			ois = new ObjectInputStream(new FileInputStream("record.obj"));
			username = (String) ois.readObject();
			ois.close();
		}
		catch(Exception e)
		{
			username = "U R ugly";
		}
		
		
		try 
		{			
			back = ImageIO.read(this.getClass().getResource( "/back.jpg" ));
			btn1 = ImageIO.read(this.getClass().getResource( "/play.png" ));

			btn3 = ImageIO.read(this.getClass().getResource( "/playP.png" ));
			btn4 = ImageIO.read(this.getClass().getResource( "/how.png" ));
	
			btn6 = ImageIO.read(this.getClass().getResource( "/howP.png" ));
			btn7 = ImageIO.read(this.getClass().getResource( "/name.png" ));
	
			btn9 = ImageIO.read(this.getClass().getResource( "/nameP.png" ));
			ok1 = ImageIO.read(this.getClass().getResource( "/ok.png" ));
			ok2 = ImageIO.read(this.getClass().getResource( "/okP.png" ));
			griddlers = ImageIO.read(this.getClass().getResource( "/griddlers.png" ));			
		} 
		catch (Exception e) 
		{
			;
		}
		addMouseListener(new MouseAdapter() 
		{
			public void mousePressed(MouseEvent e) 
			{
				if(start==false && howtoplay==false && setname==false)
				{
					int a = e.getX();
				    int b = e.getY();
				    if(a>=330 && a<=554 && b>=300 && b<=388)
				    {
				    	press=true;
				    }
				    else if(a>=330 && a<=554 && b>=430 && b<=518)
				    {
				    	press2 = true;
				    }
				    else if(a>=330 && a<=554 && b>=560 && b<=648)
				    {
				    	press3 = true; 
				    }
				    Graphics g = getGraphics();
            		paintComponent(g);
				}
				if(setname==true)
				{
					int a = e.getX();
				    int b = e.getY();
				    if(a>=330 && a<=554 && b>=430 && b<=518)
				    {
				    	press3 = true; 
				    }
				    Graphics g = getGraphics();
				    paintComponent(g);
				}
		    }
			public void mouseReleased(MouseEvent e)
			{
				if(start==false && howtoplay==false && setname==false)
				{
					int a = e.getX();
				    int b = e.getY();
				    if(a>=330 && a<=554 && b>=300 && b<=388)
				    {
				    	if(press==true)
				    	{
				    		imgLabel.setVisible(true);
				    		start();
				    		start = true;
				    		blocking();//初始化磚頭
				    	
				    		
				    	}
				    	else
				    	{
				    		btn1enter = true;
				    	}
				    }
				    else if(a>=330 && a<=554 && b>=430 && b<=518)
				    {
				    	if(press2==true)
				    	{
				    		howtoplay = true;
				    		addback();
				    	}
				    	else
				    	{
				    		btn2enter = true;
				    	}
				    }
				    else if(a>=330 && a<=554 && b>=560 && b<=648)
				    {
				    	if(press3==true)
				    	{
				    		setname = true;
				    		user.setText(username);
				    		adduser();
				    	}
				    	else
				    	{
				    		btn3enter = true;
				    	}
				    }
				    else
				    {
				    	btn1enter = false;
				    	btn2enter = false;
				    	btn3enter = false;
				    }
					press = false;
					press2 = false;
					press3 = false;
					Graphics g = getGraphics();
					paintComponent(g);
				}
				if(setname==true)
				{
					int a = e.getX();
				    int b = e.getY();
				    if(a>=330 && a<=554 && b>=430 && b<=518)
				    {
				    	if(press3==true)
				    	{
				    		setname=false;
				    		username = user.getText();
				    		System.out.println(username);
				    		removeuser();
				    	}
				    }
				    press3 = false;
					Graphics g = getGraphics();
					paintComponent(g);
				}
			}	
		});
		
		
		
		
	}
	
	
	
	public void paintComponent(Graphics g) 
	{
		if(start==true)
		{
			secordImage = createImage(getWidth(), getHeight());
			secordCanvas = secordImage.getGraphics();
			secordCanvas.drawImage(back, 0, 0, null);

			imgLabel.setBounds(0,845,900,940);
			g.drawImage(secordImage, 0, 0, null);
			
			
			
			return;
		}
		else if(setname==true)
		{
			secordImage = createImage(getWidth(), getHeight());
			secordCanvas = secordImage.getGraphics();
			secordCanvas.drawImage(back, 0, 0, null);
			if(press3==true)
			{
				secordCanvas.drawImage(ok2, 330, 430, null);
			}
			else
			{
				secordCanvas.drawImage(ok1, 330, 430, null);
			}
			g.drawImage(secordImage, 0, 0, null);
			return;
		}
		else if(howtoplay==true)
		{
			convince.setVisible(true);
			return;
		}
		else
		{
			secordImage = createImage(getWidth(), getHeight());
			secordCanvas = secordImage.getGraphics();
			secordCanvas.drawImage(back, 0, 0, null);
			secordCanvas.drawImage(griddlers, 200, 70, null);
			if(press==true)
			{
				secordCanvas.drawImage(btn3, 330, 300, null);
			}
			else
			{
				secordCanvas.drawImage(btn1, 330, 300, null);
			}

			
			if(press2==true)
			{
				secordCanvas.drawImage(btn6, 330, 430, null);
			}
			else
			{
				secordCanvas.drawImage(btn4, 330, 430, null);
			}

			
			if(press3==true)
			{
				secordCanvas.drawImage(btn9, 330, 560, null);
			}
			else
			{
				secordCanvas.drawImage(btn7, 330, 560, null);
			}
			g.drawImage(secordImage, 0, 0, null);
		}
	}

	public void actionPerformed(ActionEvent e) 
	{
		String cmd = e.getActionCommand();
		switch(cmd)
		{
			case "save":
				try
				{
					oos = new ObjectOutputStream(new FileOutputStream("record.obj"));	
					oos.writeObject(username);
					oos.flush();
				}
				catch(Exception ee)
				{
					;
				}
				break;
			case "back":
				exit();
				start = false;
				howtoplay = false;
				imgLabel.setVisible(false);
				convince.setVisible(false);
				btn1enter = false;btn2enter = false;btn3enter = false;press = false;press2 = false;press3 = false;
				Graphics gg = getGraphics();
				paintComponent(gg);
				break;
		}
	}
	
	public void adduser()
	{
		this.add(user);
	}
	public void removeuser()
	{
		this.remove(user);
	}
	public void start()
	{
		this.add(save);
		this.add(backbutton);
		
	}
	public void exit()
	{
		this.remove(save);
		this.remove(backbutton);
	}
	public void addback()
	{
		this.add(backbutton);
	}
	
	public void blocking(){
		 
		 for(int i=0;i<15;i++)
		 {
			 for(int j=0;j<15;j++)
			 {
				 block[i][j] = new Block() ;
				 
			 }
			 
		 }
		 
		 //initialize
		 for(int i=0;i<15;i++)
		 {
			 for(int j=0;j<15;j++)
			 {
				 block[i][j].initialSetting(i,j);
				
				 
			 }
			 
		 }
		
		 int[] guess = new int[15];
		 //產生第一列
		 for(int k=0;k<15;k++)
		 {
			guess[k] = ((int)(Math.random()*2));
			//System.out.println(guess[k]);
			 if(guess[k]==1)
			 {
				
				 //Map.blockLocation[0][k]=1 ;
				 this.add(block[k][0].block);
				 block[k][0].settingappear();
			 }
		 }
		 /*
		 Block block1 = new Block();
		 block1.initialSetting(13, 16);
		block1.locationEnd(block1.location_j);
		this.add(block1.block);
		block1.settingappear();
			*/
		 
	}
	
	
	
	
}

