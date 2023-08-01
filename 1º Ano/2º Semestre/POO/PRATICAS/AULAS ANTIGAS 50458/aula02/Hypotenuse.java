/* Exercício 2.7 - Aula Prática Nº2 - Programação Orientada a Objectos 
*/
package aula02;

import java.util.Scanner;

public class Hypotenuse {
	public static void main(String[] args) {
		double a, b, c, t;
		System.out.println("Wellcome to the Hypotenuse Calculator: ");
			Scanner a1 = new Scanner(System.in);
				System.out.print("Insert the value of the first side (cateto): ");
				a = a1.nextDouble();
			Scanner b1 = new Scanner(System.in);
				System.out.print("Insert the value of the second side (cateto): ");
				b = b1.nextDouble();
		c = Math.sqrt( Math.pow(a, 2) + Math.pow(b, 2));
		t = Math.acos(b/c);
		t = Math.round((t*180)/Math.PI);
		System.out.println("Hypotenuse value is:" + c);
		System.out.println("the Angle between side A and the Hypotenuse is:" + t + "º");
		a1.close();b1.close();
	}
}
