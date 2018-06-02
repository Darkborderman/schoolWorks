package final_project;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;

/********************************************/
/*這個城市可以偵測滑鼠的動作，記住發射器的位置		*/
/*並且在當fireEnable等於true的時候可以傳出滑		*/
/*鼠拖曳的向量。								*/
/*使用這個object的時候，main frame需要implement*/
/*MouseMotionListener, MouseListener兩個		*/
/*interface，並且在主要的class的constructor加入*/
/*this.addMouseListener(this);				*/
/*this.addMouseMotionListener(this);		*/
/*還有哦，在主要的class加入以下method:			*/
/*public void mouseMoved(MouseEvent e){		
		
	}
	
	public void mousePressed(MouseEvent e){
		launcher.x1 = e.getX();
		launcher.y1 = e.getY();
	}
	
	public void mouseReleased(MouseEvent e){
		launcher.fire();
	}
	
	public void mouseEntered(MouseEvent e){
		
	}
	
	public void mouseExited(MouseEvent e){
		
	}
	
	public void mouseClicked(MouseEvent e){
		
	}
											*/
/********************************************/



import javax.swing.JPanel;


public class Launcher /*extends JPanel*/{
	
	int locationX;//發射器的所在位置
	int launchVectorX;//發射向量的x分量
	int launchVectorY;//發射向量的y分量
	boolean fireEnable;//看現在能不能發射
	int bulletNumber;//要發射的球球數量
	
	int x1, y1, x2, y2;//x1, x2紀錄滑鼠按下的時候的座標
	
	public Launcher(){
		
	}
	
	
	
	public void fire(){//想要射的時候就摳這個method
		launchVectorX = x1 - x2;//算出發射角度
		launchVectorY = y1 - y2;//算出發射角度
		System.out.println("fire~" + launchVectorX + " " + launchVectorY);
		
		
		
		fireEnable = false;
	}
	
	public void setfireEnable(boolean fireEnable){//可以透過這個method決定這個object能不能射
		this.fireEnable = fireEnable;
	}
	
}
