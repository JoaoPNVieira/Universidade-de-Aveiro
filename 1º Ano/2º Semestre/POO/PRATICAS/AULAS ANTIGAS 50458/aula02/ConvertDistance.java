// Exercício 2.1 - Aula Prática Nº2 - Programação Orientada a Objectos 
package aula02;

import java.util.Scanner;

public class ConvertDistance {
	public static void main(String[] args) {
		System.out.println("Wellcome to the Distance Conversor - Kilometers to Miles.");
			double km, mile, d;
				Scanner dist = new Scanner(System.in);
					System.out.print("Please Input the Distance(Km): ");
					km = dist.nextDouble(); 
					mile = km / 1.609; 
					d = Math.round(mile);
		System.out.println("Your distance in miles is: " + mile + " Miles");
		System.out.println("This is approximately: " + d + " Miles");
		dist.close();
	}
}
