package aula05;

public class Rectangle {
	
	private double length, height, perimeter, area;
	
	public Rectangle (double length, double height){ 
		this.length = length; 
		this.height = height; 
		this.rectPerimeter();
		this.rectArea();
	}
	
	public double getLength() { return length; }
	public double getHeight() { return height; }
	public void setLength(double length) { this.length = length; }
	public void setHeight(double height) {this.height = height; }
		
	public double rectPerimeter() { 
		this.perimeter = (length*2) + (height*2);
		return perimeter;
	}
	
	public double rectArea() { 
		this.area = length*height; 
		return area;
	}

	@Override
	public String toString() {
		return "[ Length = " + length + " | Height = " + height + " | Perimeter = " + perimeter + " | Area = " + area + " ]";
	}
	
	
}
