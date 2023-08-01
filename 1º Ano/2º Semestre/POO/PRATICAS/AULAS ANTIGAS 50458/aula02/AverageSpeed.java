// Exercício 2.5 - Aula Prática Nº2 - Programação Orientada a Objectos 
package aula02;

import java.util.Scanner;

public class AverageSpeed {
	public static void main(String[] args) {
		System.out.println("Wellcome to the Average Velocity Calculator:");
		float t1, t2, v1, v2, d1, d2, vm;
			Scanner vl1 = new Scanner(System.in); Scanner ds1 = new Scanner(System.in);
				System.out.print("Insert the velocity you traveled on the first route (m/s): ");
				v1 = vl1.nextFloat();
				System.out.print("Insert the distance you traveled on the first route (meters): ");
				d1 = ds1.nextFloat();
			Scanner vl2 = new Scanner(System.in); Scanner ds2 = new Scanner(System.in);
				System.out.print("Insert the velocity you traveled on the second route (m/s): ");
				v2 = vl2.nextFloat();
				System.out.print("Insert the distance you traveled on the second route (meters): ");
				d2 = ds2.nextFloat();
		t1 = (d1/v1);
		t2 = (d2/v2);
		vm = (d1+d2)/(t1+t2);
		System.out.println("Average Speed:" + vm + " meters per secound");
		
		float h1, h2, km1, km2, vmc;
		h1 = t1/3600; h2 = t2/3600;
		km1 = d1/1000; km2 = d2/1000;
		vmc = (km1+km2)/(h1+h2);
		System.out.println("Average Speed:" + vmc + " Km/H");
		vl1.close();vl2.close();ds1.close();ds2.close();
	
		}
}

