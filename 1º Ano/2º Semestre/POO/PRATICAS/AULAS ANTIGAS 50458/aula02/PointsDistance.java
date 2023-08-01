// Exercício 2.7 - Aula Prática Nº2 - Programação Orientada a Objectos 
package aula02;

import java.util.Scanner;

public class PointsDistance {
	public static void main(String[] args) {
		System.out.println("Welcome to PointsDistance");
		double d, x1, y1, x2, y2;
			Scanner a1 = new Scanner(System.in);
				System.out.print("Insert the X coordinate of the shortest Point: ");
				x1 = a1.nextDouble();
			Scanner b1 = new Scanner(System.in);
				System.out.print("Insert the Y coordinate of the shortest Point: ");
				y1 = b1.nextDouble();		
			Scanner a2 = new Scanner(System.in);
				System.out.print("Insert the X coordinate of the highest Point: ");
				x2 = a2.nextDouble();
			Scanner b2 = new Scanner(System.in);
				System.out.print("Insert the Y coordinate of the highest Point: ");
				y2 = b2.nextDouble();		
				
		d=Math.sqrt( Math.pow(x1-x2, 2) + Math.pow(y1-y2, 2) );		
		System.out.print("The distance between the points is:" + d );
		a1.close();a2.close();b1.close();b2.close();
	}

}
