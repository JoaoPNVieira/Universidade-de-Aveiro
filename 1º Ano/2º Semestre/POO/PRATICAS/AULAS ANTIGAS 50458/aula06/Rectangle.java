package aula06;

public class Rectangle extends OriginPoint {
	
	private double p1, p2, x, y; 
	private double length, height, area, perimeter;
	public Rectangle(double x, double y) {
		super(x, y);
		this.x = x;
		this.y = y;
	}

	//RECTANGLE: GETTERS
	public double getLength() { return length; }
	public double getHeight() { return height; }
	//RECTANGLE: SETTERS
	public void setLength(double x1, double y1) { 
		p1 = Math.abs(x - x1); 
		p2 = Math.abs(y - y1); 
		length = Math.round(Math.hypot(p1, p2)*100)/100D; }
	public void setHeight(double x1, double y1) {
		p1 = Math.abs(x - x1); 
		p2 = Math.abs(y - y1); 
		height = Math.round(Math.hypot(p1, p2)*100)/100D;; }
	
	//RECTANGLE METHOD: PERIMETER
	public double rectPerimeter() { 
		this.perimeter = (length*2) + (height*2);
		return perimeter; }
	
	//RECTANGLE METHOD: AREA
	public double rectArea() { 
		this.area = length*height; 
		return area; }
	
	@Override
	public String toString() {
		return "RECTANGLE: Length = " + length + " | Height = " + height + 
				" | Perimeter = " + rectPerimeter() + " | Area = " + rectArea(); }
}
