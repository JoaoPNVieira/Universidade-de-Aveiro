package aula06;

public class OriginPoint {
	private double x, y;

	public OriginPoint(double x, double y) 
	{ this.x = x; this.y = y; }

	//ORIGINPOINT: GETTERS
	public double getX() { return x; }
	public double getY() { return y; }
	//ORIGINPOINT: SETTERS
	public void setX(double x) { this.x = x; }
	public void setY(double y) { this.y = y; }
	
	@Override
	public String toString() {
		return "Origin Point: [x = " + x + " | y = " + y + "]";
	}	
}
