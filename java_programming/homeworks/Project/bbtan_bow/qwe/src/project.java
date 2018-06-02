import java.awt.*;

import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.JScrollPane;

@SuppressWarnings("serial")
public class project extends JFrame  
{
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
	 }
} 