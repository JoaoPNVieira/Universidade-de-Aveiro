package aula05;

import java.util.Scanner;
public class TestShape {
	
	public static void main(String[] args) {
		System.out.println("CHOOSE VALUES OF THE SHAPES: \n");
		double[] v = valueChoice();
		
		OriginPoint p1 = new OriginPoint(v[0],v[1]);
		OriginPoint p2 = new OriginPoint(v[2],v[3]);
		
		System.out.println("\n\n\n\n\n CIRCLES:");
		Circle c1 = new Circle(p1,v[4]);
		Circle c2 = new Circle(p2,v[5]);
		System.out.println("\n Circulo Nº1: " + c1.toString() + "\n");
		System.out.println("\n Circulo Nº2: " + c2.toString() + "\n");
		System.out.println("Circle Nº1 & Circle Nº2 are equal? -> " + c1.equals(c2) + "\n");
		
		System.out.println("RECTANGLES: \n");
		Rectangle r1 = new Rectangle(v[6],v[7]);
		Rectangle r2 = new Rectangle(v[8],v[9]);
		System.out.println("Rectangle Nº1: " + r1.toString());
		System.out.println("Rectangle Nº2: " + r2.toString() + "\n");
		System.out.println("Rectangle nº1 & Rectangle nº2 are equal? -> " + c1.equals(c2) + "\n");
		
		System.out.println("TRIANGLES: \n");
		Triangle t1 = new Triangle (v[10],v[11],v[12]);
		Triangle t2 = new Triangle (v[13],v[14],v[15]);
		System.out.println("Triangle nº1: " + t1.toString());
		System.out.println("Triangle nº2: " + t2.toString());
		System.out.println("Triangle nº1 & Triangle nº2 are equal? -> " + c1.equals(c2) + "\n");
	}

	public static double[] valueChoice() {
		double[] v = new double [16];
		
		/* CHOOSE X & Y COORDINATES FOR ORIGIN POINTS
		 * 1ST ORIGIN POINTS */
		Scanner px1 = new Scanner(System.in);
		System.out.print("Enter X Coordinate value for the 1st Circle's Origin Point: ");
		v[0] = px1.nextDouble();
		Scanner py1 = new Scanner(System.in); 
		System.out.print("Enter Y Coordinate value for the 1st Circle's Origin Point: "); 
		v[1] = py1.nextDouble();
		//2ND ORIGIN POINTS
		Scanner px2 = new Scanner(System.in); 
		System.out.print("Enter X Coordinate value for the 2nd Circle's Origin Point: "); 
		v[2] = px2.nextDouble();
		Scanner py2 = new Scanner(System.in); 
		System.out.print("Enter Y Coordinate value for the 2nd Circle's Origin Point: "); 
		v[3] = py2.nextDouble();
		
		
		//CHOOSE RADIUS VALUES FOR CIRCLES
		Scanner rd1 = new Scanner(System.in); 
		System.out.print("Enter RADIUS value for the 1st Circle's Radius: "); 
		v[4] = rd1.nextDouble();
		Scanner rd2 = new Scanner(System.in); 
		System.out.print("Enter RADIUS value for the 2nd Circle's Radius: "); 
		v[5] = rd2.nextDouble();
		
		
		/* CHOOSE LENGHT & HEIGHT VALUES FOR RECTANGLES
		 * 1ST RECTANGLE */
		Scanner l1 = new Scanner(System.in); 
		System.out.print("Enter LENGHT value for the 1st Rectangle: "); 
		v[6] = l1.nextDouble();
		Scanner h1 = new Scanner(System.in); 
		System.out.print("Enter HEIGHT value for the 2nd Rectangle: "); 
		v[7] = h1.nextDouble(); 
		
		
		//2ND RECTANGLE
		Scanner l2 = new Scanner(System.in); 
		System.out.print("Enter LENGHT value for the 1st Rectangle: "); 
		v[8] = l2.nextDouble();
		Scanner h2 = new Scanner(System.in); 
		System.out.print("Enter HEIGHT value for the 2nd Rectangle: "); 
		v[9] = h2.nextDouble();
		
		
		/* CHOOSE BASE & SIDES FOR TRIANGLES
		 * 1ST TRIANGLE */
		Scanner b1 = new Scanner(System.in); 
		System.out.print("Enter BASE value for the 1st Triangle: "); 
		v[10] = b1.nextDouble();
		Scanner s11 = new Scanner(System.in); 
		System.out.print("Enter 1ST SIDE value for the 1st Triangle: "); 
		v[11] = s11.nextDouble();
		Scanner s21 = new Scanner(System.in); 
		System.out.print("Enter 2ND SIDE value for the 1st Triangle: "); 
		v[12] = s21.nextDouble();
		
		
		//2ND TRIANGLE
		Scanner b2 = new Scanner(System.in); 
		System.out.print("Enter BASE value for the 2nd Triangle: "); 
		v[13] = b2.nextDouble();
		Scanner s12 = new Scanner(System.in); 
		System.out.print("Enter 1ST SIDE value for the 2nd Triangle: "); 
		v[14] = s12.nextDouble();
		Scanner s22 = new Scanner(System.in); 
		System.out.print("Enter 2ND SIDE value for the 2nd Triangle: "); 
		v[15] = s22.nextDouble();
		
		//Resource close 
		px1.close();px2.close();py1.close();py2.close();rd1.close();rd2.close();l1.close();h1.close();
		l2.close();h2.close();b1.close();s11.close();s21.close();b2.close();s12.close();s22.close();
		return v;
	}	
}
