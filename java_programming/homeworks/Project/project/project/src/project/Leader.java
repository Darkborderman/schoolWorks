package project;
import java.io.Serializable;

public class Leader implements Serializable{
	private String name = new String();
	private int score;
	public Leader(String name,int score){
		this.name = name;
		this.score= score;
	}
	public String getName(){
		return name;
	}
	public int getScore(){
		return score;
	}
	
}
