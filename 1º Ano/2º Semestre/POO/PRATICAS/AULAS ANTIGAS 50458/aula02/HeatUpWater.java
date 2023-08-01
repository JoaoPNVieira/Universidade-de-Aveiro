// Exercício 2.3 - Aula Prática Nº2 - Programação Orientada a Objectos 
package aula02;

import java.util.Scanner;

public class HeatUpWater {
	public static void main(String[] args) {
		System.out.println("Wellcome to Heat Up Water. This Program will calculate how much energy you will need.");
			float ti, tf, M , Q;
				Scanner water = new Scanner(System.in);
					System.out.print("Please Insert the Water Quantity (in Kilograms) :");
					M = water.nextFloat();		
				Scanner tmin = new Scanner(System.in);
					System.out.print("Please Insert the current Water Temperature: ");
					ti = tmin.nextFloat();
				Scanner tmax = new Scanner(System.in);
					System.out.print("Please Insert the desired Temperature: ");
					tf = tmax.nextFloat();
		Q = (M * (tf - ti)*4184);
		System.out.println("Water Quantity :" + M +" Kg | Initial Temperature: " + ti + "ºC |Final Temperature : " + tf + "ºC");
		System.out.println("Energy necessary: " + Q + "Jouls");
		water.close(); tmin.close(); tmax.close();
	}
}
