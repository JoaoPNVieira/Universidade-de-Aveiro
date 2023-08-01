package aula05;

public class Triangle {
	
	private double base, side1, side2;
	
		public Triangle (double base, double side1, double side2) 
		{ this.base = base; this.side1 = side1; this.side2 = side2; }
		
		public double getBase() { return base; }
		public double getSide1() { return side1; }
		public double getSide2() { return side2; }
		public void setBase(double base) { this.base = base; }
		public void setSide1(double side1) { this.side1 = side1; }
		public void setSide2(double side2) { this.side2 = side2; }
		
		public double triPerimeter() { 
			return base+side1+side2; 
		}
		public double triArea() {
			double h = Math.sqrt(Math.abs(Math.pow(side1, 2)-Math.pow((base/2), 2))); 
			return (base*h)/2;
		}

		
		
		
		
}
