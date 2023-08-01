package aula06;

public class Triangle extends OriginPoint{
	
	//CIRCLE: ATTRIBUTES
	private double p1, p2, x, y, base, side1, side2;
	//CIRCLE: CONSTRUCTOR
	public Triangle(double x, double y) {
		super(x, y);
		this.x = x; 
		this.y = y;
	}
	
	//TRIANGLE: GETTERS
	public double getBase() { return base; }
	public double getSide1() { return side1; }
	public double getSide2() { return side2; }
	//TRIANGLE: SETTERS 
	public void setBase(double x1, double y1) { 
		p1 = Math.abs(x - x1); 
		p2 = Math.abs(y - y1); 
		base = Math.round(Math.hypot(p1, p2)*100)/100D; }
	public void setSide1(double x1, double y1) { 
		p1 = Math.abs(x - x1); 
		p2 = Math.abs(y - y1); 
		side1 = Math.round(Math.hypot(p1, p2)*100)/100D; }
	public void setSide2(double x1, double y1) { 
		p1 = Math.abs(x - x1); 
		p2 = Math.abs(y - y1); 
		side2 = Math.round(Math.hypot(p1, p2)*100)/100D; }

	//TRIANGLE METHOD: Perimeter
	public double triPerimeter() { 
		return Math.round((base+side1+side2)*100)/100D; 
	}
	//TRIANGLE METHOD: Area
	public double triArea() {
		double h = Math.sqrt(Math.abs(Math.pow(side1, 2)-Math.pow((base/2), 2))); 
		return Math.round(((base*h)/2)*100)/100D;
	}
	
	@Override
	public String toString() {
		return "TRIANGLE: Base = " + base + " | Side 1 = " + side1 + " | Side 2 = " + side2 + 
				" | Perimeter = " + triPerimeter() + " | Area = " + triArea(); }

}
