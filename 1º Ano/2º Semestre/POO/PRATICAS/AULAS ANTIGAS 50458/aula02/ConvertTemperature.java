// Exerc�cio 2.2 - Aula Pr�tica N�2 - Programa��o Orientada a Objectos 
package aula02;

import java.util.Scanner;

public class ConvertTemperature {
	public static void main(String[] args) {
		double cel, fah;
			Scanner temp = new Scanner (System.in);
				System.out.print("Please input the Temperature (Celsius): ");
				cel = temp.nextDouble();
				fah = (1.8*cel) + 32;
		System.out.println("The temperature is: " + fah + " degees Fahrenheit");
		temp.close();
	}

}
