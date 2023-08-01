package aula05;

public class Circle {
	 
		private OriginPoint center;
		private double radius, perimeter, area;
		
		public Circle (OriginPoint center, double radius) { 
			this.radius = radius; 
			this.setCenter(center); 
			this.circlePerimeter();
			this.circleArea();
		}
		
		public OriginPoint getCenter() { return center; }
		public double getRadius() {	return radius; }
		public void setCenter(OriginPoint center) {	this.center = center; }
		public void setRadius(double radius) { this.radius = radius; }
		
		
		public double circlePerimeter() { 
			this.perimeter = 2*Math.PI*radius;
			return perimeter; 
		}
		
		public double circleArea() { 
			this.area = Math.PI*(Math.pow(radius,2));
			return area;
		}

		@Override
		public String toString() {
			return center + "\n\n | Radius = " + radius + 
					"\n | Perimeter = " + perimeter + "\n | Area = " + area + "]";
		}
}


