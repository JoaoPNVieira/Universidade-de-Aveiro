// Exercício 6.2 - Aula Prática Nº6 - Programação Orientada a Objectos 
package aula06;

import aula05.OriginPoint;

public class Circle extends OriginPoint {
	//CIRCLE: ATTRIBUTES
	private double radius, perimeter, area;
	
	//CIRCLE: CONSTRUCTOR
	public Circle(double x, double y, double radius) {
		super(x, y);
		this.radius = radius; 
		this.circlePerimeter();
		this.circleArea(); }
	
	//CIRCLE: GETTER & SETTER
	public double getRadius() {	return radius; }
	public void setRadius(double radius) { this.radius = radius; }
	
	//CIRCLE METHOD: PERIMETER
	public double circlePerimeter() { 
		this.perimeter = Math.round((2*Math.PI*radius)*100)/100D;
		return perimeter; }
	//CIRCLE METHOD: AREA
	public double circleArea() { 
		this.area = Math.round(Math.PI*(Math.pow(radius,2))*100)/100D;
		return area; }

	@Override
	public String toString() {
		return "CIRCLE: Center = (" + getX() +" , " + getY() + ") | Radius = " + radius + 
				" | Perimeter = " + perimeter + " | Area = " + area + "]";
	}

	
	
}

